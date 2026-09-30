import 'package:flutter/material.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

/// A ready-made good habit offered as a one-tap suggestion when adding one.
class HabitPreset {
  final String Function(AppLocalizations l10n) title;
  final HabitCategory category;
  final int targetPerWeek;
  final IconData icon;
  final Color color;
  final bool opensReading;

  const HabitPreset({
    required this.title,
    required this.category,
    required this.targetPerWeek,
    required this.icon,
    required this.color,
    this.opensReading = false,
  });
}

/// The suggested good habits for faith, fitness and time with a partner.
final List<HabitPreset> habitPresets = [
  HabitPreset(
    title: (l10n) => l10n.presetDevotional,
    category: HabitCategory.faith,
    targetPerWeek: 7,
    icon: Icons.menu_book,
    color: Colors.indigo,
    opensReading: true,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetPray,
    category: HabitCategory.faith,
    targetPerWeek: 7,
    icon: Icons.self_improvement,
    color: Colors.deepPurple,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetPsalm,
    category: HabitCategory.faith,
    targetPerWeek: 7,
    icon: Icons.auto_stories,
    color: Colors.blue,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetChurch,
    category: HabitCategory.faith,
    targetPerWeek: 1,
    icon: Icons.church,
    color: Colors.brown,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetWalk,
    category: HabitCategory.fitness,
    targetPerWeek: 5,
    icon: Icons.directions_walk,
    color: Colors.green,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetWorkout,
    category: HabitCategory.fitness,
    targetPerWeek: 3,
    icon: Icons.fitness_center,
    color: Colors.teal,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetStretch,
    category: HabitCategory.fitness,
    targetPerWeek: 7,
    icon: Icons.spa,
    color: Colors.lightGreen,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetWater,
    category: HabitCategory.fitness,
    targetPerWeek: 7,
    icon: Icons.local_drink,
    color: Colors.cyan,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetBedtime,
    category: HabitCategory.fitness,
    targetPerWeek: 7,
    icon: Icons.bedtime,
    color: Colors.blueGrey,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetPrayTogether,
    category: HabitCategory.relationship,
    targetPerWeek: 7,
    icon: Icons.favorite,
    color: Colors.pink,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetDateNight,
    category: HabitCategory.relationship,
    targetPerWeek: 1,
    icon: Icons.restaurant,
    color: Colors.red,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetEncourage,
    category: HabitCategory.relationship,
    targetPerWeek: 7,
    icon: Icons.volunteer_activism,
    color: Colors.orange,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetPhonesAway,
    category: HabitCategory.relationship,
    targetPerWeek: 7,
    icon: Icons.phonelink_off,
    color: Colors.deepOrange,
  ),
  HabitPreset(
    title: (l10n) => l10n.presetAskAboutDay,
    category: HabitCategory.relationship,
    targetPerWeek: 7,
    icon: Icons.forum,
    color: Colors.purple,
  ),
];
