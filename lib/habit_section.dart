import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quitter/edit_habit_page.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_provider.dart';

/// The "Building" part of the home screen: the good habits being built,
/// each with a one-tap check-in for today and its current streak.
class HabitSection extends StatelessWidget {
  final String searchQuery;

  const HabitSection({super.key, this.searchQuery = ''});

  Future<void> _openEditor(BuildContext context, [Habit? habit]) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EditHabitPage(habit: habit)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final habits = context.watch<HabitProvider>().habits;
    final weekStartsMonday = context.select<SettingsProvider, bool>(
      (settings) => settings.weekStartsMonday,
    );
    final visible = searchQuery.isEmpty
        ? habits
        : habits
              .where((habit) => habit.title.toLowerCase().contains(searchQuery))
              .toList();

    if (searchQuery.isNotEmpty && visible.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.homeSectionBuilding,
                style: textTheme.titleLarge,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: l10n.habitAddButton,
              onPressed: () => _openEditor(context),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (visible.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.habitEmptyHint, style: textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  FilledButton.tonalIcon(
                    onPressed: () => _openEditor(context),
                    icon: const Icon(Icons.add),
                    label: Text(l10n.habitAddButton),
                  ),
                ],
              ),
            ),
          ),
        for (final habit in visible)
          HabitTile(
            key: ValueKey(habit.id),
            habit: habit,
            weekStartsMonday: weekStartsMonday,
            onTap: () => _openEditor(context, habit),
          ),
        const SizedBox(height: 24),
        Text(l10n.homeSectionQuitting, style: textTheme.titleLarge),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// One good habit on the home screen, showing its streak and a button that
/// marks it done (or not done) for today.
class HabitTile extends StatelessWidget {
  final Habit habit;
  final bool weekStartsMonday;
  final VoidCallback onTap;

  const HabitTile({
    super.key,
    required this.habit,
    required this.weekStartsMonday,
    required this.onTap,
  });

  String _progress(AppLocalizations l10n, DateTime now) {
    final streak = habit.currentStreak(now, weekStartsMonday: weekStartsMonday);
    if (habit.isDaily) return l10n.habitStreakDays(streak);
    final done = habit.doneInWeekOf(now, weekStartsMonday: weekStartsMonday);
    return '${l10n.habitStreakWeeks(streak)}\n'
        '${l10n.habitWeekProgress(done, habit.targetPerWeek)}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final doneToday = habit.isDoneOn(now);
    final (defaultIcon, _) = habitCategoryDefaults[habit.category]!;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: habit.color.withAlpha(51),
          foregroundColor: habit.color,
          child: Icon(habit.icon ?? defaultIcon),
        ),
        title: Text(habit.title),
        subtitle: Text(_progress(l10n, now)),
        trailing: IconButton(
          key: Key('habitCheck-${habit.id}'),
          iconSize: 32,
          color: doneToday ? habit.color : null,
          tooltip: doneToday ? l10n.habitUndoToday : l10n.habitDoneToday,
          icon: Icon(
            doneToday ? Icons.check_circle : Icons.radio_button_unchecked,
          ),
          onPressed: () {
            HapticFeedback.lightImpact();
            context.read<HabitProvider>().toggleCheckIn(habit.id, now);
          },
        ),
      ),
    );
  }
}
