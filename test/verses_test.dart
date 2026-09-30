import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/verse_card.dart';
import 'package:quitter/verses.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const knownThemes = {
    'strength',
    'peace',
    'grace',
    'faith',
    'new_start',
    'body',
    'love',
    'rest',
    'temptation',
  };

  group('bundled verses', () {
    late List<Verse> verses;

    setUpAll(() async => verses = await loadVerses());

    test('load with text, unique references and known themes', () {
      expect(verses.length, greaterThanOrEqualTo(60));
      expect(verses.map((v) => v.reference).toSet(), hasLength(verses.length));
      for (final verse in verses) {
        expect(verse.text.trim(), isNotEmpty, reason: verse.reference);
        expect(verse.themes, isNotEmpty, reason: verse.reference);
        expect(knownThemes.containsAll(verse.themes), isTrue);
      }
    });

    test('use the World English Bible wording', () {
      final verse = verses.firstWhere((v) => v.reference == 'Philippians 4:13');
      expect(
        verse.text,
        'I can do all things through Christ who strengthens me.',
      );
    });

    test('cover temptation and grace for hard days', () {
      expect(verses.where((v) => v.themes.contains('temptation')), isNotEmpty);
      expect(verses.where((v) => v.themes.contains('grace')), isNotEmpty);
    });
  });

  group('verseForDay', () {
    final verses = [
      for (var i = 0; i < 5; i++) Verse(reference: 'Ref $i', text: 'Text $i'),
    ];

    test('is the same all day', () {
      expect(
        verseForDay(verses, DateTime(2026, 9, 30, 0, 1)).reference,
        verseForDay(verses, DateTime(2026, 9, 30, 23, 59)).reference,
      );
    });

    test('shows every verse once before repeating', () {
      final shown = {
        for (var i = 0; i < 5; i++)
          verseForDay(verses, DateTime(2026, 3, 27 + i)).reference,
      };
      expect(shown, hasLength(5));
      expect(
        verseForDay(verses, DateTime(2026, 3, 27)).reference,
        verseForDay(verses, DateTime(2026, 4, 1)).reference,
      );
    });

    test('works for dates before the reference year', () {
      expect(verseForDay(verses, DateTime(2025, 12, 31)).reference, 'Ref 4');
    });
  });

  testWidgets('the card shows the verse and its reference', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: VerseOfTheDayCard(
            verses: Future.value(const [
              Verse(reference: 'Psalm 118:24', text: 'This is the day.'),
            ]),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Verse of the day'), findsOneWidget);
    expect(find.text('This is the day.'), findsOneWidget);
    expect(find.text('Psalm 118:24 (WEB)'), findsOneWidget);
    expect(find.byTooltip('Share verse'), findsOneWidget);
  });
}
