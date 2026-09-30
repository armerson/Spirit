import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quitter/bible.dart';
import 'package:quitter/devotional_page.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/main.dart' show rootScaffoldMessenger;
import 'package:quitter/reading_plans.dart';
import 'package:quitter/reading_provider.dart';
import 'package:quitter/verses.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late HabitProvider habits;
  late ReadingProvider reading;

  final bible = <String, List<BibleChapter>>{
    'Psalms': List.generate(
      150,
      (i) => BibleChapter(
        heading: i == 0 ? null : 'A Psalm by David.',
        verses: ['Psalm ${i + 1} first verse.', 'Psalm ${i + 1} second.'],
      ),
    ),
    'Proverbs': List.generate(
      31,
      (i) => BibleChapter(verses: ['Proverbs ${i + 1} wisdom.']),
    ),
  };

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await bundledVerses();
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    habits = HabitProvider();
    await habits.loadHabits();
    reading = ReadingProvider();
    await reading.load();
  });

  Widget createTestWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HabitProvider>.value(value: habits),
        ChangeNotifierProvider<ReadingProvider>.value(value: reading),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        scaffoldMessengerKey: rootScaffoldMessenger,
        home: DevotionalPage(bible: Future.value(bible)),
      ),
    );
  }

  testWidgets('offers the reading plans until one is started', (tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('Choose a reading plan'), findsOneWidget);
    expect(find.text('Psalms & Proverbs in 30 days'), findsOneWidget);
    expect(find.text('The four Gospels'), findsOneWidget);

    await tester.tap(find.byKey(const Key('startPlan-psalms_proverbs_30')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Day 1 of 30'), findsOneWidget);
    expect(find.text('Psalms 1, 31, 61, 91, 121 · Proverbs 1'), findsOneWidget);
    expect(find.text('Psalm 1'), findsOneWidget);
    expect(find.textContaining('ask the Holy Spirit'), findsOneWidget);
  });

  testWidgets('finishing saves the note and ticks off linked habits', (
    tester,
  ) async {
    await habits.addHabit(
      Habit(
        id: 'devotional',
        title: 'Daily devotional',
        category: HabitCategory.faith,
        color: Colors.indigo,
        createdAt: DateTime(2026, 9, 1),
        opensReading: true,
      ),
    );
    await habits.addHabit(
      Habit(
        id: 'walk',
        title: 'Walk',
        category: HabitCategory.fitness,
        color: Colors.green,
        createdAt: DateTime(2026, 9, 1),
      ),
    );
    await reading.startPlan(readingPlanById('psalms_proverbs_30')!);
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('finishReading')),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.enterText(
      find.byKey(const Key('readingNote')),
      'Thank you for your word.',
    );
    await tester.tap(find.byKey(const Key('finishReading')));
    await tester.pumpAndSettle();

    final now = DateTime.now();
    expect(reading.daysDone, 1);
    expect(reading.readOn(now), isTrue);
    expect(habits.byId('devotional')!.isDoneOn(now), isTrue);
    expect(habits.byId('walk')!.isDoneOn(now), isFalse);

    final prefs = await SharedPreferences.getInstance();
    final key = 'journal_${DateFormat('yyyy-MM-dd').format(now)}';
    expect(
      prefs.getString(key),
      'Psalms 1, 31, 61, 91, 121 · Proverbs 1\nThank you for your word.',
    );
    expect(find.textContaining('Let the word of Christ'), findsOneWidget);
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 5000));
    await tester.pumpAndSettle();
    expect(find.textContaining('Day 2 of 30'), findsOneWidget);
    expect(find.textContaining("Today's reading is done"), findsOneWidget);
  });

  testWidgets('a finished plan is celebrated', (tester) async {
    SharedPreferences.setMockInitialValues({
      'reading_plan': 'gospels',
      'reading_progress_gospels': 89,
    });
    await reading.load();
    await tester.pumpWidget(createTestWidget());

    expect(find.text('You finished The four Gospels!'), findsOneWidget);
    await tester.tap(find.text('Choose another plan'));
    await tester.pumpAndSettle();
    expect(find.text('Choose a reading plan'), findsOneWidget);
  });
}
