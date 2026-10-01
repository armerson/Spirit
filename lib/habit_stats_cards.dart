import 'package:flutter/material.dart';
import 'package:quitter/edit_habit_page.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_stats.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

/// Weekly progress for each good habit: this week against its target, the
/// last four weeks, the best streak and a twelve-week bar chart.
class HabitStatsCard extends StatelessWidget {
  final List<Habit> habits;
  final DateTime now;
  final bool weekStartsMonday;

  const HabitStatsCard({
    super.key,
    required this.habits,
    required this.now,
    required this.weekStartsMonday,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _StatsSection(
      icon: Icons.spa,
      title: l10n.statsHabitsTitle,
      children: [
        for (final (index, habit) in habits.indexed) ...[
          if (index > 0) const Divider(height: 24),
          _HabitStats(
            habit: habit,
            now: now,
            weekStartsMonday: weekStartsMonday,
          ),
        ],
      ],
    );
  }
}

class _HabitStats extends StatelessWidget {
  final Habit habit;
  final DateTime now;
  final bool weekStartsMonday;

  const _HabitStats({
    required this.habit,
    required this.now,
    required this.weekStartsMonday,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final (defaultIcon, _) = habitCategoryDefaults[habit.category]!;
    final counts = weeklyCounts(habit, now, weekStartsMonday: weekStartsMonday);
    final recent = recentCompletion(
      habit,
      now,
      weekStartsMonday: weekStartsMonday,
    );
    final best = habit.bestStreak(weekStartsMonday: weekStartsMonday);
    final mutedStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(habit.icon ?? defaultIcon, size: 18, color: habit.color),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                habit.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              l10n.statsHabitThisWeek(counts.last, habit.targetPerWeek),
              style: mutedStyle,
            ),
          ],
        ),
        const SizedBox(height: 8),
        _WeekBars(
          values: counts,
          target: habit.targetPerWeek,
          color: habit.color,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            if (recent != null)
              Expanded(
                child: Text(
                  l10n.statsHabitRecent((recent * 100).round()),
                  style: mutedStyle,
                ),
              )
            else
              const Spacer(),
            if (best > 0)
              Text(
                habit.isDaily
                    ? l10n.statsHabitBestDays(best)
                    : l10n.statsHabitBestWeeks(best),
                style: mutedStyle,
              ),
          ],
        ),
      ],
    );
  }
}

/// Exercise minutes logged on fitness habits: this week, the recent weekly
/// average and an eight-week bar chart.
class ExerciseCard extends StatelessWidget {
  final List<Habit> fitnessHabits;
  final DateTime now;
  final bool weekStartsMonday;

  const ExerciseCard({
    super.key,
    required this.fitnessHabits,
    required this.now,
    required this.weekStartsMonday,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final minutes = weeklyMinutes(
      fitnessHabits,
      now,
      weekStartsMonday: weekStartsMonday,
    );
    final pastWeeks = minutes.sublist(0, minutes.length - 1);
    final loggedWeeks = pastWeeks.where((total) => total > 0);
    final average = loggedWeeks.isEmpty
        ? 0
        : loggedWeeks.reduce((a, b) => a + b) ~/ loggedWeeks.length;
    final hasMinutes = minutes.any((total) => total > 0);
    final most = minutes.fold(0, (a, b) => a > b ? a : b);

    return _StatsSection(
      icon: Icons.directions_run,
      title: l10n.statsExerciseTitle,
      children: [
        if (!hasMinutes)
          Text(l10n.statsExerciseHint, style: theme.textTheme.bodyMedium)
        else ...[
          Text(
            l10n.statsExerciseThisWeek(minutes.last),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (average > 0) ...[
            const SizedBox(height: 2),
            Text(
              l10n.statsExerciseAverage(average),
              style: theme.textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: 12),
          _WeekBars(
            values: minutes,
            target: most,
            color: theme.colorScheme.primary,
          ),
        ],
      ],
    );
  }
}

class _StatsSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const _StatsSection({
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: theme.colorScheme.primary, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

/// A row of small bars, one per week with the current week last, each as
/// tall as its share of [target].
class _WeekBars extends StatelessWidget {
  final List<int> values;
  final int target;
  final Color color;

  const _WeekBars({
    required this.values,
    required this.target,
    required this.color,
  });

  static const _height = 32.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final (index, value) in values.indexed) ...[
            if (index > 0) const SizedBox(width: 4),
            Expanded(
              child: Container(
                height: target <= 0
                    ? 2
                    : (_height * (value / target).clamp(0.0, 1.0)).clamp(
                        2.0,
                        _height,
                      ),
                decoration: BoxDecoration(
                  color: value >= target && target > 0
                      ? color
                      : color.withValues(alpha: value > 0 ? 0.5 : 0.15),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
