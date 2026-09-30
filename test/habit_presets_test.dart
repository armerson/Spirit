import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/app_icons.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_presets.dart';
import 'package:quitter/l10n/generated/app_localizations_en.dart';

void main() {
  final l10n = AppLocalizationsEn();

  test('every preset has a unique title, valid target and savable icon', () {
    final titles = habitPresets.map((preset) => preset.title(l10n)).toList();
    expect(titles.toSet(), hasLength(titles.length));
    for (final preset in habitPresets) {
      expect(preset.targetPerWeek, inInclusiveRange(1, 7));
      expect(iconNames[preset.icon], isNotNull, reason: preset.title(l10n));
    }
  });

  test('faith, fitness and relationship each have suggestions', () {
    for (final category in [
      HabitCategory.faith,
      HabitCategory.fitness,
      HabitCategory.relationship,
    ]) {
      expect(
        habitPresets.where((preset) => preset.category == category),
        isNotEmpty,
      );
    }
  });
}
