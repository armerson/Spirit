import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';

Habit _habit({int targetPerWeek = 7, Iterable<DateTime> checkIns = const []}) {
  return Habit(
    id: 'devotional',
    title: 'Daily devotional',
    category: HabitCategory.faith,
    color: Colors.indigo,
    createdAt: DateTime(2026, 9, 1),
    targetPerWeek: targetPerWeek,
    checkIns: checkIns,
  );
}

List<DateTime> _days(DateTime from, int count) => [
  for (var i = 0; i < count; i++) addDays(from, i),
];

void main() {
  // 2026-09-30 is a Wednesday; its week starts Monday 2026-09-28.
  final wednesday = DateTime(2026, 9, 30, 18, 45);

  group('dates', () {
    test('weekStart returns the Monday of the week', () {
      expect(weekStart(wednesday), DateTime(2026, 9, 28));
      expect(weekStart(DateTime(2026, 10, 4)), DateTime(2026, 9, 28));
      expect(weekStart(DateTime(2026, 9, 28)), DateTime(2026, 9, 28));
    });

    test('addDays stays at midnight across daylight saving changes', () {
      final result = addDays(DateTime(2026, 3, 28), 2);
      expect(result, DateTime(2026, 3, 30));
      expect(result.hour, 0);
    });
  });

  group('check-ins', () {
    test('toggle marks a day done and undone, ignoring time of day', () {
      final habit = _habit();
      habit.toggle(wednesday);
      expect(habit.isDoneOn(DateTime(2026, 9, 30, 7)), isTrue);
      habit.toggle(DateTime(2026, 9, 30, 23, 59));
      expect(habit.isDoneOn(wednesday), isFalse);
    });

    test('doneInWeekOf counts only that Monday-to-Sunday week', () {
      final habit = _habit(
        checkIns: [
          DateTime(2026, 9, 27),
          DateTime(2026, 9, 28),
          DateTime(2026, 9, 30),
          DateTime(2026, 10, 4),
          DateTime(2026, 10, 5),
        ],
      );
      expect(habit.doneInWeekOf(wednesday), 3);
    });

    test('target per week is kept between 1 and 7', () {
      expect(_habit(targetPerWeek: 0).targetPerWeek, 1);
      expect(_habit(targetPerWeek: 12).targetPerWeek, 7);
    });
  });

  group('daily streak', () {
    test('counts consecutive days ending today', () {
      final habit = _habit(checkIns: _days(DateTime(2026, 9, 26), 5));
      expect(habit.currentStreak(wednesday), 5);
    });

    test('is kept while today is not done yet', () {
      final habit = _habit(checkIns: _days(DateTime(2026, 9, 26), 4));
      expect(habit.currentStreak(wednesday), 4);
    });

    test('resets after a missed day', () {
      final habit = _habit(
        checkIns: [..._days(DateTime(2026, 9, 20), 5), DateTime(2026, 9, 30)],
      );
      expect(habit.currentStreak(wednesday), 1);
      expect(habit.bestStreak, 5);
    });

    test('is zero with no check-ins', () {
      expect(_habit().currentStreak(wednesday), 0);
      expect(_habit().bestStreak, 0);
    });
  });

  group('weekly streak', () {
    test('counts weeks that met the target', () {
      final habit = _habit(
        targetPerWeek: 3,
        checkIns: [
          ..._days(DateTime(2026, 9, 14), 3),
          ..._days(DateTime(2026, 9, 21), 3),
          ..._days(DateTime(2026, 9, 28), 3),
        ],
      );
      expect(habit.currentStreak(wednesday), 3);
      expect(habit.bestStreak, 3);
    });

    test('is kept while this week can still meet the target', () {
      final habit = _habit(
        targetPerWeek: 3,
        checkIns: [
          ..._days(DateTime(2026, 9, 14), 3),
          ..._days(DateTime(2026, 9, 21), 3),
          DateTime(2026, 9, 28),
        ],
      );
      expect(habit.currentStreak(wednesday), 2);
    });

    test('resets after a week below target', () {
      final habit = _habit(
        targetPerWeek: 2,
        checkIns: [
          ..._days(DateTime(2026, 9, 7), 2),
          DateTime(2026, 9, 14),
          ..._days(DateTime(2026, 9, 21), 2),
        ],
      );
      expect(habit.currentStreak(wednesday), 1);
      expect(habit.bestStreak, 1);
    });
  });

  group('json', () {
    test('round-trips all fields', () {
      final habit = _habit(
        targetPerWeek: 5,
        checkIns: [DateTime(2026, 9, 29), DateTime(2026, 9, 30)],
      )..reminderMinutes = 7 * 60;
      final copy = Habit.fromJson(habit.toJson());
      expect(copy.id, habit.id);
      expect(copy.title, habit.title);
      expect(copy.category, HabitCategory.faith);
      expect(copy.targetPerWeek, 5);
      expect(copy.color.toARGB32(), habit.color.toARGB32());
      expect(copy.createdAt, habit.createdAt);
      expect(copy.reminderMinutes, 420);
      expect(copy.checkIns, habit.checkIns);
    });

    test('falls back to safe defaults for unknown values', () {
      final habit = Habit.fromJson({
        'id': 'walk',
        'title': 'Walk',
        'category': 'gardening',
        'color': Colors.green.toARGB32(),
        'createdAt': '2026-09-01T00:00:00.000',
        'checkIns': ['2026-09-30', 'not a date', 3],
      });
      expect(habit.category, HabitCategory.other);
      expect(habit.targetPerWeek, 7);
      expect(habit.checkIns, {DateTime(2026, 9, 30)});
    });
  });

  group('HabitProvider', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('saves habits and check-ins across reloads', () async {
      final provider = HabitProvider();
      await provider.loadHabits();
      await provider.addHabit(_habit());
      await provider.toggleCheckIn('devotional', wednesday);

      final reloaded = HabitProvider();
      await reloaded.loadHabits();
      expect(reloaded.habits, hasLength(1));
      expect(reloaded.byId('devotional')!.isDoneOn(wednesday), isTrue);
      expect(reloaded.inCategory(HabitCategory.faith), hasLength(1));
      expect(reloaded.inCategory(HabitCategory.fitness), isEmpty);
    });

    test('updates and deletes habits', () async {
      final provider = HabitProvider();
      await provider.loadHabits();
      await provider.addHabit(_habit());
      await provider.updateHabit(_habit()..title = 'Morning prayer');
      expect(provider.byId('devotional')!.title, 'Morning prayer');

      await provider.deleteHabit('devotional');
      final reloaded = HabitProvider();
      await reloaded.loadHabits();
      expect(reloaded.habits, isEmpty);
    });

    test('ignores corrupt saved data', () async {
      SharedPreferences.setMockInitialValues({'habits': '{not json'});
      final provider = HabitProvider();
      await provider.loadHabits();
      expect(provider.habits, isEmpty);
    });
  });
}
