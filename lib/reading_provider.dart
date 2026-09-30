import 'package:flutter/material.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/logging.dart';
import 'package:quitter/reading_plans.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tracks the reading plan the user is following and how far through it
/// they are, saved on the device.
class ReadingProvider extends ChangeNotifier {
  static const _planKey = 'reading_plan';
  static const _lastReadKey = 'reading_last_read';
  static String _progressKey(String planId) => 'reading_progress_$planId';

  SharedPreferences? _pref;
  ReadingPlan? plan;

  /// Days of [plan] finished so far; the next reading is day
  /// `daysDone + 1`.
  int daysDone = 0;

  /// The day a reading was last finished, at midnight local time.
  DateTime? lastRead;

  Future<void> load() async {
    _pref = await SharedPreferences.getInstance();
    plan = readingPlanById(_pref!.getString(_planKey));
    daysDone = plan == null ? 0 : _savedProgress(plan!);
    final lastRead = _pref!.getString(_lastReadKey);
    this.lastRead = lastRead == null ? null : DateTime.tryParse(lastRead);
    notifyListeners();
  }

  int _savedProgress(ReadingPlan plan) =>
      (_pref!.getInt(_progressKey(plan.id)) ?? 0).clamp(0, plan.days.length);

  bool get isFinished => plan != null && daysDone >= plan!.days.length;

  /// The chapters for the next unfinished day, or null when there is no
  /// plan or it is finished.
  List<ChapterRef>? get nextReading =>
      plan == null || isFinished ? null : plan!.days[daysDone];

  bool readOn(DateTime day) => lastRead == dateOnly(day);

  /// Follows [newPlan], picking up where the user left off if they had
  /// followed it before.
  Future<void> startPlan(ReadingPlan newPlan) async {
    plan = newPlan;
    daysDone = _savedProgress(newPlan);
    await _pref!.setString(_planKey, newPlan.id);
    notifyListeners();
    talker.info('Started reading plan ${newPlan.id}');
  }

  /// Starts [plan] again from day one.
  Future<void> restartPlan() async {
    final current = plan;
    if (current == null) return;
    daysDone = 0;
    await _pref!.setInt(_progressKey(current.id), 0);
    notifyListeners();
  }

  Future<void> stopPlan() async {
    plan = null;
    daysDone = 0;
    await _pref!.remove(_planKey);
    notifyListeners();
  }

  /// Marks the next day's reading finished on [day].
  Future<void> finishReading(DateTime day) async {
    final current = plan;
    if (current == null || isFinished) return;
    daysDone++;
    lastRead = dateOnly(day);
    await _pref!.setInt(_progressKey(current.id), daysDone);
    await _pref!.setString(_lastReadKey, lastRead!.toIso8601String());
    notifyListeners();
    talker.info('Finished day $daysDone of ${current.id}');
  }
}
