import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/logging.dart';

/// Holds the good habits the user is building and saves them on the device
/// under the `habits` preference key.
class HabitProvider extends ChangeNotifier {
  static const _prefKey = 'habits';

  SharedPreferences? _pref;
  List<Habit> habits = [];

  Future<void> loadHabits() async {
    _pref = await SharedPreferences.getInstance();
    habits = [];

    final raw = _pref!.get(_prefKey);
    if (raw is String) {
      try {
        final data = json.decode(raw);
        if (data is List) {
          for (final item in data) {
            if (item is! Map<String, dynamic>) continue;
            try {
              habits.add(Habit.fromJson(item));
            } catch (error, stackTrace) {
              talker.handle(error, stackTrace, 'Ignored invalid habit');
            }
          }
        }
      } catch (error, stackTrace) {
        talker.handle(error, stackTrace, 'Ignored invalid habit data');
      }
    }

    notifyListeners();
    talker.debug('Loaded habits: ${habits.length}');
  }

  Habit? byId(String id) {
    for (final habit in habits) {
      if (habit.id == id) return habit;
    }
    return null;
  }

  /// Habits in [category], in the order they were added.
  List<Habit> inCategory(HabitCategory category) =>
      habits.where((habit) => habit.category == category).toList();

  Future<void> addHabit(Habit habit) async {
    habits.add(habit);
    await _save();
    talker.info('Added a habit');
  }

  Future<void> updateHabit(Habit habit) async {
    final index = habits.indexWhere((h) => h.id == habit.id);
    if (index == -1) return;
    habits[index] = habit;
    await _save();
    talker.info('Updated a habit');
  }

  Future<void> deleteHabit(String id) async {
    habits.removeWhere((habit) => habit.id == id);
    await _save();
    talker.info('Deleted a habit');
  }

  /// Marks the habit done on [day], or undoes it if it was already done.
  Future<void> toggleCheckIn(String id, DateTime day) async {
    final habit = byId(id);
    if (habit == null) return;
    habit.toggle(day);
    await _save();
  }

  Future<void> _save() async {
    await _pref?.setString(
      _prefKey,
      json.encode(habits.map((habit) => habit.toJson()).toList()),
    );
    notifyListeners();
  }
}
