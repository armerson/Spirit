import 'dart:math';

import 'package:quitter/habit.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/verses.dart';

/// A moment in the user's day that deserves a word of encouragement.
enum EncouragementMoment {
  checkIn,
  streakMilestone,
  missedDay,
  relapse,
  reminder,
  struggling,
  freshStart,
}

/// Verse themes that fit each moment, so a missed day gets grace rather
/// than a call to be strong, and a relapse gets a fresh start.
const Map<EncouragementMoment, Set<String>> momentThemes = {
  EncouragementMoment.checkIn: {'strength', 'faith', 'body', 'love', 'spirit'},
  EncouragementMoment.streakMilestone: {'strength', 'faith', 'spirit'},
  EncouragementMoment.missedDay: {'grace', 'new_start'},
  EncouragementMoment.relapse: {'grace', 'new_start', 'temptation'},
  EncouragementMoment.reminder: {'strength', 'spirit', 'faith', 'peace'},
  EncouragementMoment.struggling: {'temptation', 'strength'},
  EncouragementMoment.freshStart: {'new_start', 'grace'},
};

/// Verses longer than this are left out of snackbars and notifications,
/// where only a couple of lines fit comfortably.
const shortVerseLength = 170;

/// Long enough to read a message and a short verse in a snackbar.
const encouragementToastDuration = Duration(seconds: 8);

/// Streak lengths worth celebrating: days for daily habits, weeks otherwise.
const dailyMilestones = {3, 7, 14, 21, 30, 40, 50, 75, 100, 150, 200, 365};
const weeklyMilestones = {2, 4, 8, 12, 26, 52};

/// A verse no longer than [maxLength] whose themes fit [moment], or null
/// if none is loaded.
Verse? verseFor(
  EncouragementMoment moment,
  List<Verse> verses, [
  Random? random,
  int maxLength = shortVerseLength,
]) {
  final themes = momentThemes[moment]!;
  final fitting = verses
      .where(
        (verse) =>
            verse.text.length <= maxLength && verse.themes.any(themes.contains),
      )
      .toList();
  if (fitting.isEmpty) return null;
  return fitting[(random ?? Random()).nextInt(fitting.length)];
}

/// Whether reaching [streak] on [habit] is a milestone to celebrate.
bool isStreakMilestone(Habit habit, int streak) {
  return (habit.isDaily ? dailyMilestones : weeklyMilestones).contains(streak);
}

/// The message shown after the user marks [habit] done, celebrating the
/// new [streak] when it is a milestone.
String checkInMessage(
  AppLocalizations l10n,
  Habit habit,
  int streak, [
  Random? random,
]) {
  if (isStreakMilestone(habit, streak)) {
    return habit.isDaily
        ? l10n.encourageMilestoneDays(streak)
        : l10n.encourageMilestoneWeeks(streak);
  }
  final messages = [
    l10n.encourageCheckIn1,
    l10n.encourageCheckIn2,
    l10n.encourageCheckIn3,
    l10n.encourageCheckIn4,
    l10n.encourageCheckIn5,
    l10n.encourageCheckIn6,
  ];
  return messages[(random ?? Random()).nextInt(messages.length)];
}

/// Whether [habit] was on a daily streak that ended yesterday and has not
/// been picked back up today, so a gentle nudge is kind rather than nagging.
bool missedYesterday(Habit habit, DateTime now) {
  if (!habit.isDaily) return false;
  final today = dateOnly(now);
  return !habit.isDoneOn(today) &&
      !habit.isDoneOn(addDays(today, -1)) &&
      habit.isDoneOn(addDays(today, -2));
}

/// [message] followed by [verse] on its own lines, for snackbars and
/// notifications.
String withVerse(AppLocalizations l10n, String message, Verse? verse) {
  if (verse == null) return message;
  return '$message\n\n${l10n.verseShareMessage(verse.text, verse.reference)}';
}
