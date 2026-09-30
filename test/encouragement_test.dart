import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/encouragement.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/l10n/generated/app_localizations_en.dart';
import 'package:quitter/verses.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final l10n = AppLocalizationsEn();
  final today = DateTime(2026, 9, 30, 9);

  Habit habit({int targetPerWeek = 7, Iterable<DateTime> checkIns = const []}) {
    return Habit(
      id: 'devotional',
      title: 'Daily devotional',
      category: HabitCategory.faith,
      color: Colors.indigo,
      createdAt: DateTime(2026, 1, 1),
      targetPerWeek: targetPerWeek,
      checkIns: checkIns,
    );
  }

  group('verseFor', () {
    const shortGrace = Verse(
      reference: 'Lamentations 3:22',
      text: 'His mercies are new every morning.',
      themes: {'grace'},
    );
    const shortStrength = Verse(
      reference: 'Philippians 4:13',
      text: 'I can do all things through Christ.',
      themes: {'strength'},
    );
    final longGrace = Verse(
      reference: 'Long 1:1',
      text: 'grace ' * 40,
      themes: const {'grace'},
    );

    test('picks only short verses whose themes fit the moment', () {
      final verses = [shortGrace, shortStrength, longGrace];
      for (var seed = 0; seed < 20; seed++) {
        expect(
          verseFor(EncouragementMoment.missedDay, verses, Random(seed)),
          shortGrace,
        );
      }
    });

    test('returns null when nothing fits', () {
      expect(verseFor(EncouragementMoment.missedDay, [shortStrength]), isNull);
      expect(verseFor(EncouragementMoment.checkIn, const []), isNull);
    });

    test('finds a verse for every moment in the bundled set', () async {
      final verses = await loadVerses();
      for (final moment in EncouragementMoment.values) {
        final verse = verseFor(moment, verses);
        expect(verse, isNotNull, reason: moment.name);
        expect(verse!.text.length, lessThanOrEqualTo(shortVerseLength));
        expect(verse.themes.any(momentThemes[moment]!.contains), isTrue);
      }
    });
  });

  group('milestones', () {
    test('count days for daily habits and weeks for weekly ones', () {
      expect(isStreakMilestone(habit(), 7), isTrue);
      expect(isStreakMilestone(habit(), 8), isFalse);
      expect(isStreakMilestone(habit(targetPerWeek: 3), 4), isTrue);
      expect(isStreakMilestone(habit(targetPerWeek: 3), 7), isFalse);
    });

    test('celebrate the streak in the check-in message', () {
      expect(
        checkInMessage(l10n, habit(), 7),
        '7 days in a row! Keep walking in step with the Spirit.',
      );
      expect(
        checkInMessage(l10n, habit(targetPerWeek: 3), 4),
        '4 weeks in a row! Faithful in the small things.',
      );
    });

    test('otherwise give one of the everyday messages', () {
      final everyday = {
        l10n.encourageCheckIn1,
        l10n.encourageCheckIn2,
        l10n.encourageCheckIn3,
        l10n.encourageCheckIn4,
        l10n.encourageCheckIn5,
        l10n.encourageCheckIn6,
      };
      for (var seed = 0; seed < 20; seed++) {
        expect(
          everyday,
          contains(checkInMessage(l10n, habit(), 5, Random(seed))),
        );
      }
    });
  });

  group('missedYesterday', () {
    test('is true when a daily streak ended yesterday', () {
      expect(
        missedYesterday(habit(checkIns: [addDays(today, -2)]), today),
        isTrue,
      );
    });

    test('is false once today is done', () {
      final checkIns = [addDays(today, -2), today];
      expect(missedYesterday(habit(checkIns: checkIns), today), isFalse);
    });

    test('is false when yesterday was done or the gap is older', () {
      expect(
        missedYesterday(habit(checkIns: [addDays(today, -1)]), today),
        isFalse,
      );
      expect(
        missedYesterday(habit(checkIns: [addDays(today, -3)]), today),
        isFalse,
      );
    });

    test('is false for weekly habits', () {
      final weekly = habit(targetPerWeek: 3, checkIns: [addDays(today, -2)]);
      expect(missedYesterday(weekly, today), isFalse);
    });
  });

  test('withVerse adds the verse on its own lines', () {
    const verse = Verse(reference: 'John 14:26', text: 'He will teach you.');
    expect(withVerse(l10n, 'Well done.', null), 'Well done.');
    expect(
      withVerse(l10n, 'Well done.', verse),
      'Well done.\n\n${l10n.verseShareMessage(verse.text, verse.reference)}',
    );
  });
}
