import 'package:quitter/habit.dart';

/// Days [habit] was done in each of the last [weeks] weeks, oldest first,
/// ending with the current week so far.
List<int> weeklyCounts(
  Habit habit,
  DateTime now, {
  int weeks = 12,
  bool weekStartsMonday = true,
}) {
  final thisWeek = weekStart(now, startsMonday: weekStartsMonday);
  return [
    for (var ago = weeks - 1; ago >= 0; ago--)
      habit.doneInWeekOf(
        addDays(thisWeek, -7 * ago),
        weekStartsMonday: weekStartsMonday,
      ),
  ];
}

/// How much of its weekly target [habit] met over the last [weeks] full
/// weeks, from 0 to 1, counting no week before the habit was created.
///
/// The current week is left out so an unfinished week never drags the
/// number down, and days beyond the target do not make up for a short
/// week. Returns null until the habit has a full week behind it.
double? recentCompletion(
  Habit habit,
  DateTime now, {
  int weeks = 4,
  bool weekStartsMonday = true,
}) {
  final thisWeek = weekStart(now, startsMonday: weekStartsMonday);
  final firstWeek = weekStart(habit.createdAt, startsMonday: weekStartsMonday);
  var counted = 0;
  var met = 0;
  for (var ago = 1; ago <= weeks; ago++) {
    final week = addDays(thisWeek, -7 * ago);
    if (week.isBefore(firstWeek)) break;
    final done = habit.doneInWeekOf(week, weekStartsMonday: weekStartsMonday);
    met += done < habit.targetPerWeek ? done : habit.targetPerWeek;
    counted++;
  }
  if (counted == 0) return null;
  return met / (counted * habit.targetPerWeek);
}

/// Minutes logged across [habits] in each of the last [weeks] weeks,
/// oldest first, ending with the current week so far.
List<int> weeklyMinutes(
  Iterable<Habit> habits,
  DateTime now, {
  int weeks = 8,
  bool weekStartsMonday = true,
}) {
  final thisWeek = weekStart(now, startsMonday: weekStartsMonday);
  final totals = List.filled(weeks, 0);
  for (final habit in habits) {
    for (final MapEntry(key: day, value: minutes) in habit.minutes.entries) {
      final weeksAgo = _weeksBetween(
        weekStart(day, startsMonday: weekStartsMonday),
        thisWeek,
      );
      if (weeksAgo >= 0 && weeksAgo < weeks) {
        totals[weeks - 1 - weeksAgo] += minutes;
      }
    }
  }
  return totals;
}

/// Whole weeks from [from] to [to], both week starts at midnight. Rounding
/// the hours keeps a week that crosses a daylight saving change, and so is
/// an hour short or long, from counting as six days.
int _weeksBetween(DateTime from, DateTime to) =>
    (to.difference(from).inHours / 24).round() ~/ 7;
