import 'package:flutter/material.dart';
import 'package:quitter/app_icons.dart';

/// The area of life a good habit belongs to, used for grouping and presets.
enum HabitCategory { faith, fitness, relationship, other }

/// A good habit the user is building, such as a daily devotional or a
/// weekly date night, tracked by the days it was completed.
class Habit {
  String id;
  String title;
  HabitCategory category;

  /// How many days per week the habit should be done, from 1 to 7.
  /// A target of 7 is a daily habit and its streak is counted in days;
  /// anything lower is counted in weeks that met the target.
  int targetPerWeek;
  Color color;
  IconData? icon;
  DateTime createdAt;

  /// Minutes after midnight for a daily reminder, or null for none.
  int? reminderMinutes;

  /// Whether this habit is done by reading the day's Bible passage, so its
  /// tile offers the devotional page and finishing a reading ticks it off.
  bool opensReading;

  final Set<DateTime> _checkIns;

  Habit({
    required this.id,
    required this.title,
    required this.category,
    required this.color,
    required this.createdAt,
    int targetPerWeek = 7,
    this.icon,
    this.reminderMinutes,
    this.opensReading = false,
    Iterable<DateTime> checkIns = const [],
  }) : targetPerWeek = targetPerWeek.clamp(1, 7),
       _checkIns = checkIns.map(dateOnly).toSet();

  /// The days this habit was completed, each at midnight local time.
  Set<DateTime> get checkIns => Set.unmodifiable(_checkIns);

  bool get isDaily => targetPerWeek == 7;

  bool isDoneOn(DateTime day) => _checkIns.contains(dateOnly(day));

  /// Marks [day] as done if it was not, or undone if it was.
  void toggle(DateTime day) {
    final date = dateOnly(day);
    if (!_checkIns.remove(date)) _checkIns.add(date);
  }

  /// Number of completed days in the week containing [day], with weeks
  /// starting on Monday or Sunday per [weekStartsMonday].
  int doneInWeekOf(DateTime day, {bool weekStartsMonday = true}) {
    final start = weekStart(day, startsMonday: weekStartsMonday);
    final end = addDays(start, 7);
    return _checkIns
        .where((date) => !date.isBefore(start) && date.isBefore(end))
        .length;
  }

  /// The streak as of [now]: consecutive days for a daily habit, or
  /// consecutive weeks meeting [targetPerWeek] otherwise.
  ///
  /// The current day (or week) only adds to the streak once it is complete,
  /// and never breaks it while it is still in progress, so the user is not
  /// told they have lost a streak they can still keep today.
  int currentStreak(DateTime now, {bool weekStartsMonday = true}) {
    if (isDaily) return _dayStreak(dateOnly(now));
    return _weekStreak(
      weekStart(now, startsMonday: weekStartsMonday),
      weekStartsMonday,
    );
  }

  /// The longest streak ever reached, in the same unit as [currentStreak].
  int bestStreak({bool weekStartsMonday = true}) {
    if (_checkIns.isEmpty) return 0;
    final sorted = _checkIns.toList()..sort();
    if (isDaily) {
      return _longestRun(sorted, (date) => addDays(date, 1));
    }
    final weeks =
        sorted
            .map((date) => weekStart(date, startsMonday: weekStartsMonday))
            .toSet()
            .where(
              (week) =>
                  doneInWeekOf(week, weekStartsMonday: weekStartsMonday) >=
                  targetPerWeek,
            )
            .toList()
          ..sort();
    if (weeks.isEmpty) return 0;
    return _longestRun(weeks, (week) => addDays(week, 7));
  }

  int _dayStreak(DateTime today) {
    var day = isDoneOn(today) ? today : addDays(today, -1);
    var streak = 0;
    while (isDoneOn(day)) {
      streak++;
      day = addDays(day, -1);
    }
    return streak;
  }

  int _weekStreak(DateTime thisWeek, bool weekStartsMonday) {
    bool metTarget(DateTime week) =>
        doneInWeekOf(week, weekStartsMonday: weekStartsMonday) >= targetPerWeek;
    var week = metTarget(thisWeek) ? thisWeek : addDays(thisWeek, -7);
    var streak = 0;
    while (metTarget(week)) {
      streak++;
      week = addDays(week, -7);
    }
    return streak;
  }

  static int _longestRun(
    List<DateTime> sorted,
    DateTime Function(DateTime) next,
  ) {
    var best = 1;
    var run = 1;
    for (var i = 1; i < sorted.length; i++) {
      run = sorted[i] == next(sorted[i - 1]) ? run + 1 : 1;
      if (run > best) best = run;
    }
    return best;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category': category.name,
    'targetPerWeek': targetPerWeek,
    'color': color.toARGB32(),
    'icon': icon != null ? iconNames[icon] : null,
    'createdAt': createdAt.toIso8601String(),
    'reminderMinutes': reminderMinutes,
    'opensReading': opensReading,
    'checkIns': (_checkIns.toList()..sort()).map(_formatDate).toList(),
  };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
    id: json['id'] as String,
    title: json['title'] as String,
    category: HabitCategory.values.firstWhere(
      (category) => category.name == json['category'],
      orElse: () => HabitCategory.other,
    ),
    targetPerWeek: json['targetPerWeek'] as int? ?? 7,
    color: Color(json['color'] as int),
    icon: json['icon'] != null ? allIcons[json['icon'] as String] : null,
    createdAt: DateTime.parse(json['createdAt'] as String),
    reminderMinutes: json['reminderMinutes'] as int?,
    opensReading: json['opensReading'] as bool? ?? false,
    checkIns: (json['checkIns'] as List<dynamic>? ?? const [])
        .whereType<String>()
        .map(DateTime.tryParse)
        .whereType<DateTime>(),
  );

  static String _formatDate(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}

/// [date] at midnight local time, dropping the time of day.
DateTime dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

/// Calendar-day arithmetic that stays at midnight across daylight saving
/// changes, unlike adding a [Duration] of whole days.
DateTime addDays(DateTime date, int days) =>
    DateTime(date.year, date.month, date.day + days);

/// The first day of the week containing [date]: Monday when [startsMonday]
/// is true, otherwise Sunday, matching the app's week-start setting.
DateTime weekStart(DateTime date, {bool startsMonday = true}) {
  final firstDay = startsMonday ? DateTime.monday : DateTime.sunday;
  return addDays(dateOnly(date), -((date.weekday - firstDay) % 7));
}
