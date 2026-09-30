import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/habit_section.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsProvider settings;
  late HabitProvider habits;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    settings = SettingsProvider();
    await settings.loadPreferences();
    habits = HabitProvider();
    await habits.loadHabits();
  });

  Widget createTestWidget({String searchQuery = ''}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>.value(value: settings),
        ChangeNotifierProvider<HabitProvider>.value(value: habits),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SingleChildScrollView(
            child: HabitSection(searchQuery: searchQuery),
          ),
        ),
      ),
    );
  }

  Habit habit({
    String id = 'devotional',
    String title = 'Daily devotional',
    int targetPerWeek = 7,
    Iterable<DateTime> checkIns = const [],
  }) {
    return Habit(
      id: id,
      title: title,
      category: HabitCategory.faith,
      color: Colors.indigo,
      createdAt: DateTime(2026, 9, 1),
      targetPerWeek: targetPerWeek,
      checkIns: checkIns,
    );
  }

  testWidgets('shows both headings and a prompt when there are no habits', (
    tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Building'), findsOneWidget);
    expect(find.text('Quitting'), findsOneWidget);
    expect(
      find.textContaining('Start a good habit, like a daily devotional'),
      findsOneWidget,
    );
  });

  testWidgets('tapping the check marks a habit done today and back', (
    tester,
  ) async {
    final yesterday = addDays(DateTime.now(), -1);
    await habits.addHabit(habit(checkIns: [yesterday]));
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Daily devotional'), findsOneWidget);
    expect(find.text('1-day streak'), findsOneWidget);
    expect(find.byTooltip('Mark done today'), findsOneWidget);

    await tester.tap(find.byKey(const Key('habitCheck-devotional')));
    await tester.pumpAndSettle();

    expect(habits.byId('devotional')!.isDoneOn(DateTime.now()), isTrue);
    expect(find.text('2-day streak'), findsOneWidget);
    expect(find.byTooltip('Undo today'), findsOneWidget);

    await tester.tap(find.byKey(const Key('habitCheck-devotional')));
    await tester.pumpAndSettle();

    expect(habits.byId('devotional')!.isDoneOn(DateTime.now()), isFalse);
    expect(find.text('1-day streak'), findsOneWidget);
  });

  testWidgets('weekly habits show weeks in a row and this week so far', (
    tester,
  ) async {
    await habits.addHabit(habit(id: 'walk', title: 'Walk', targetPerWeek: 3));
    await tester.pumpWidget(createTestWidget());

    expect(find.text('No streak yet\n0 of 3 this week'), findsOneWidget);
  });

  testWidgets('searching hides habits that do not match', (tester) async {
    await habits.addHabit(habit());
    await habits.addHabit(habit(id: 'walk', title: 'Walk'));
    await tester.pumpWidget(createTestWidget(searchQuery: 'walk'));

    expect(find.text('Walk'), findsOneWidget);
    expect(find.text('Daily devotional'), findsNothing);

    await tester.pumpWidget(createTestWidget(searchQuery: 'gym'));
    expect(find.text('Building'), findsNothing);
  });

  testWidgets('adds a new weekly fitness habit from the editor', (
    tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byTooltip('Add a good habit'));
    await tester.pumpAndSettle();
    expect(find.text('New habit'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('habitTitleField')), 'Gym');
    await tester.tap(find.text('Fitness'));
    await tester.tap(find.text('Every day'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('3 days a week').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(habits.habits, hasLength(1));
    final saved = habits.habits.single;
    expect(saved.title, 'Gym');
    expect(saved.category, HabitCategory.fitness);
    expect(saved.targetPerWeek, 3);
    expect(saved.icon, Icons.directions_run);
    expect(find.text('Gym'), findsOneWidget);
  });

  testWidgets('the editor will not save a habit without a title', (
    tester,
  ) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byTooltip('Add a good habit'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter a title'), findsOneWidget);
    expect(habits.habits, isEmpty);
  });

  testWidgets('deletes a habit after confirming', (tester) async {
    await habits.addHabit(habit());
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Daily devotional'));
    await tester.pumpAndSettle();
    expect(find.text('Edit habit'), findsOneWidget);

    await tester.tap(find.byTooltip('Delete habit'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();

    expect(habits.habits, isEmpty);
    expect(find.text('Daily devotional'), findsNothing);
  });

  testWidgets('a suggestion fills in the habit and saves it', (tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byTooltip('Add a good habit'));
    await tester.pumpAndSettle();
    expect(find.text('Ideas to start with'), findsOneWidget);
    expect(find.text('Daily devotional'), findsOneWidget);
    expect(find.text('Date night'), findsNothing);

    await tester.tap(find.text('Relationship'));
    await tester.pumpAndSettle();
    expect(find.text('Daily devotional'), findsNothing);

    await tester.tap(find.text('Date night'));
    await tester.pumpAndSettle();
    expect(find.text('1 day a week'), findsOneWidget);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    final saved = habits.habits.single;
    expect(saved.title, 'Date night');
    expect(saved.category, HabitCategory.relationship);
    expect(saved.targetPerWeek, 1);
    expect(saved.icon, Icons.restaurant);
  });

  testWidgets('suggestions are hidden when editing a habit', (tester) async {
    await habits.addHabit(habit());
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Daily devotional'));
    await tester.pumpAndSettle();

    expect(find.text('Ideas to start with'), findsNothing);
  });

  testWidgets('Other has no suggestions', (tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byTooltip('Add a good habit'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Other'));
    await tester.pumpAndSettle();

    expect(find.text('Ideas to start with'), findsNothing);
  });
}
