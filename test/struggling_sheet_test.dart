import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/main.dart' show rootScaffoldMessenger;
import 'package:quitter/quit_card.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/struggling_sheet.dart';
import 'package:quitter/verses.dart';

void main() {
  const escape = Verse(
    reference: '1 Corinthians 10:13',
    text:
        'God is faithful, who will not allow you to be tempted above what '
        'you are able, but will with the temptation also make the way of '
        'escape, that you may be able to endure it.',
    themes: {'temptation'},
  );
  const resist = Verse(
    reference: 'James 4:7',
    text: 'Resist the devil, and he will flee from you.',
    themes: {'temptation'},
  );
  const rest = Verse(
    reference: 'Matthew 11:28',
    text: 'Come to me, all you who labor and are heavily burdened.',
    themes: {'rest'},
  );

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: rootScaffoldMessenger,
      home: Scaffold(body: child),
    );
  }

  Widget openButton() => Builder(
    builder: (context) => TextButton(
      onPressed: () => showStrugglingSheet(
        context,
        verses: Future.value([escape, resist, rest]),
      ),
      child: const Text('Open'),
    ),
  );

  testWidgets('offers a verse, a prayer and steps for the moment', (
    tester,
  ) async {
    await tester.pumpWidget(createTestWidget(openButton()));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text("Hold on. You're not alone."), findsOneWidget);
    expect(find.textContaining('Holy Spirit, I'), findsOneWidget);
    expect(find.text(rest.text), findsNothing);

    final shown = find.text(escape.text).evaluate().isNotEmpty
        ? escape
        : resist;
    expect(find.text(shown.text), findsOneWidget);

    await tester.tap(find.text('Another verse'));
    await tester.pump();
    expect(find.text(shown.text), findsNothing);
  });

  testWidgets('making it through closes the sheet with encouragement', (
    tester,
  ) async {
    await tester.pumpWidget(createTestWidget(openButton()));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('strugglingMadeIt')),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Reach out to someone'), findsOneWidget);
    await tester.tap(find.byKey(const Key('strugglingMadeIt')));
    await tester.pumpAndSettle();

    expect(find.text("Hold on. You're not alone."), findsNothing);
    expect(find.textContaining('you stood firm'), findsOneWidget);
  });

  testWidgets('quit cards show the struggling button only when asked', (
    tester,
  ) async {
    var pressed = false;
    Widget card({VoidCallback? onStruggling}) => SizedBox(
      width: 180,
      height: 216,
      child: Builder(
        builder: (context) => QuitCard(
          context: context,
          title: 'Smoking',
          heroTag: 'smoking',
          icon: Icons.smoke_free,
          gradientColors: const [Colors.blue, Colors.indigo],
          quitDate: DateTime(2026, 9, 1).toIso8601String(),
          onTap: () {},
          onStruggling: onStruggling,
        ),
      ),
    );

    await tester.pumpWidget(createTestWidget(card()));
    expect(find.byTooltip("I'm struggling"), findsNothing);

    await tester.pumpWidget(
      createTestWidget(card(onStruggling: () => pressed = true)),
    );
    await tester.tap(find.byTooltip("I'm struggling"));
    expect(pressed, isTrue);
  });

  testWidgets('a started quit page offers help when struggling', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();

    Widget page({required bool started}) => MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>.value(value: settings),
        ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
      ],
      child: createTestWidget(
        QuitMilestonesPage(
          key: ValueKey(started),
          title: 'Smoking',
          storageKey: 'smoking',
          milestones: const [],
          headerStarted: 'Keep going',
          headerNotStarted: 'Ready?',
          subtitleStarted: 'You are free',
          subtitleNotStarted: 'Start today',
          initialStarted: started,
          quitDateOverride: DateTime(2026, 9, 1).toIso8601String(),
        ),
      ),
    );

    await tester.pumpWidget(page(started: false));
    expect(find.byKey(const Key('strugglingButton')), findsNothing);

    await tester.pumpWidget(page(started: true));
    await tester.tap(find.byKey(const Key('strugglingButton')));
    await tester.pumpAndSettle();
    expect(find.text("Hold on. You're not alone."), findsOneWidget);
  });
}
