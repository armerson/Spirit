import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/fresh_start.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/main.dart' show rootScaffoldMessenger;
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsProvider settings;
  late AddictionProvider addictions;
  late List<int> resets;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    settings = SettingsProvider();
    await settings.loadPreferences();
    addictions = AddictionProvider();
    await addictions.loadAddictions();
    resets = [];
  });

  Widget page() => MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingsProvider>.value(value: settings),
      ChangeNotifierProvider<AddictionProvider>.value(value: addictions),
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
      home: QuitMilestonesPage(
        title: 'Journey',
        storageKey: 'journey',
        milestones: const [],
        headerStarted: 'Keep going',
        headerNotStarted: 'Ready?',
        subtitleStarted: 'You are free',
        subtitleNotStarted: 'Start today',
        initialStarted: true,
        quitDateOverride: DateTime(2026, 9, 1).toIso8601String(),
        onResetPressed: (days) async => resets.add(days),
      ),
    ),
  );

  final button = find.byKey(const Key('freshStartButton'));

  testWidgets('a quick tap explains the hold and does not start again', (
    tester,
  ) async {
    await tester.pumpWidget(page());
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(resets, isEmpty);
    expect(find.text('Press and hold to start again'), findsOneWidget);
  });

  testWidgets('letting go before the ring fills does not start again', (
    tester,
  ) async {
    await tester.pumpWidget(page());
    final gesture = await tester.startGesture(tester.getCenter(button));
    await tester.pump();
    await tester.pump(freshStartHoldDuration ~/ 2);
    await gesture.up();
    await tester.pumpAndSettle();

    expect(resets, isEmpty);
    expect(find.text('A clean slate'), findsNothing);
  });

  testWidgets('holding starts again on a clean slate with an undo', (
    tester,
  ) async {
    await tester.pumpWidget(page());
    final gesture = await tester.startGesture(tester.getCenter(button));
    await tester.pump();
    await tester.pump(freshStartHoldDuration);
    await tester.pump(const Duration(milliseconds: 50));
    await gesture.up();
    await tester.pumpAndSettle();

    expect(resets, hasLength(1));
    expect(find.text('A clean slate'), findsOneWidget);
    expect(find.text("With God's help, I begin again today."), findsOneWidget);

    await tester.tap(find.text('Tap to continue'));
    await tester.pumpAndSettle();

    expect(find.text('A clean slate'), findsNothing);
    expect(find.text('Undo'), findsOneWidget);
  });
}
