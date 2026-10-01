import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/habit_stats.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/stats_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // A Wednesday, so the Monday-start week holds Mon 28 Sep to Sun 4 Oct.
  final now = DateTime(2026, 9, 30, 18);

  Habit habit({
    int targetPerWeek = 7,
    HabitCategory category = HabitCategory.faith,
    DateTime? createdAt,
    Iterable<DateTime> checkIns = const [],
    Map<DateTime, int> minutes = const {},
  }) {
    return Habit(
      id: 'habit',
      title: 'Walk',
      category: category,
      color: Colors.green,
      createdAt: createdAt ?? DateTime(2026, 1, 1),
      targetPerWeek: targetPerWeek,
      checkIns: checkIns,
      minutes: minutes,
    );
  }

  group('weeklyCounts', () {
    test('counts each week oldest first, ending with this week', () {
      final counts = weeklyCounts(
        habit(
          checkIns: [
            DateTime(2026, 9, 28),
            DateTime(2026, 9, 29),
            DateTime(2026, 9, 21),
          ],
        ),
        now,
        weeks: 3,
      );
      expect(counts, [0, 1, 2]);
    });

    test('follows a Sunday week start', () {
      final sunday = DateTime(2026, 9, 27);
      expect(weeklyCounts(habit(checkIns: [sunday]), now, weeks: 2), [1, 0]);
      expect(
        weeklyCounts(
          habit(checkIns: [sunday]),
          now,
          weeks: 2,
          weekStartsMonday: false,
        ),
        [0, 1],
      );
    });
  });

  group('recentCompletion', () {
    test('caps each week at the target and skips this week', () {
      final checkIns = [
        // Last week: 4 days against a target of 3.
        for (var day = 21; day <= 24; day++) DateTime(2026, 9, day),
        // The week before: 1 day.
        DateTime(2026, 9, 14),
        // This week does not count yet.
        DateTime(2026, 9, 28),
      ];
      final completion = recentCompletion(
        habit(targetPerWeek: 3, checkIns: checkIns),
        now,
        weeks: 2,
      );
      expect(completion, closeTo(4 / 6, 0.001));
    });

    test('ignores weeks before the habit existed', () {
      final completion = recentCompletion(
        habit(
          targetPerWeek: 2,
          createdAt: DateTime(2026, 9, 22),
          checkIns: [DateTime(2026, 9, 22), DateTime(2026, 9, 23)],
        ),
        now,
      );
      expect(completion, 1.0);
    });

    test('is null for a habit started this week', () {
      expect(
        recentCompletion(habit(createdAt: DateTime(2026, 9, 29)), now),
        isNull,
      );
    });
  });

  test('weeklyMinutes adds up minutes across habits by week', () {
    final run = habit(
      minutes: {DateTime(2026, 9, 28): 30, DateTime(2026, 9, 21): 20},
    );
    final gym = habit(
      minutes: {DateTime(2026, 9, 29): 45, DateTime(2026, 6, 1): 60},
    );
    expect(weeklyMinutes([run, gym], now, weeks: 3), [0, 20, 75]);
  });

  test('weeklyMinutes stays correct across a daylight saving change', () {
    final winter = DateTime(2026, 11, 4);
    final minutes = {DateTime(2026, 10, 26): 30, DateTime(2026, 10, 19): 15};
    expect(weeklyMinutes([habit(minutes: minutes)], winter, weeks: 3), [
      15,
      30,
      0,
    ]);
  });

  group('minutes', () {
    test('round-trip through json and clear when the day is undone', () {
      final day = DateTime(2026, 9, 30);
      final walk = habit(checkIns: [day])..setMinutes(day, 40);
      final copy = Habit.fromJson(walk.toJson());
      expect(copy.minutesOn(day), 40);

      copy.toggle(day);
      expect(copy.minutesOn(day), 0);
      expect(copy.minutes, isEmpty);
    });

    test('zero clears and bad saved values are ignored', () {
      final walk = habit()..setMinutes(now, 20);
      walk.setMinutes(now, 0);
      expect(walk.minutes, isEmpty);

      final json = habit().toJson()
        ..['minutes'] = {'2026-09-30': 25, 'nope': 10, '2026-09-29': 'x'};
      expect(Habit.fromJson(json).minutes, {DateTime(2026, 9, 30): 25});
    });
  });

  testWidgets('the stats page shows good habits and exercise', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();
    final habits = HabitProvider();
    await habits.loadHabits();
    final today = DateTime.now();
    await habits.addHabit(
      Habit(
        id: 'gym',
        title: 'Workout',
        category: HabitCategory.fitness,
        color: Colors.green,
        createdAt: DateTime(2026, 1, 1),
        targetPerWeek: 3,
        checkIns: [today],
        minutes: {today: 45},
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>.value(value: settings),
          ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
          ChangeNotifierProvider<HabitProvider>.value(value: habits),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: StatsPage()),
        ),
      ),
    );

    expect(find.text('Good habits'), findsOneWidget);
    expect(find.text('Workout'), findsOneWidget);
    expect(find.text('This week: 1 of 3'), findsOneWidget);
    expect(find.text('Exercise'), findsOneWidget);
    expect(find.text('45 minutes this week'), findsOneWidget);
    expect(find.text('Your Streaks'), findsNothing);
  });
}
