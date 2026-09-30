import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/reading_plans.dart';
import 'package:quitter/reading_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final psalms = readingPlanById('psalms_proverbs_30')!;
  final gospels = readingPlanById('gospels')!;

  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<ReadingProvider> loaded() async {
    final provider = ReadingProvider();
    await provider.load();
    return provider;
  }

  test('starts with no plan and nothing to read', () async {
    final reading = await loaded();
    expect(reading.plan, isNull);
    expect(reading.nextReading, isNull);
    expect(reading.isFinished, isFalse);
  });

  test('finishing a reading moves on and is remembered', () async {
    final reading = await loaded();
    await reading.startPlan(gospels);
    expect(reading.nextReading, [const ChapterRef('Matthew', 1)]);

    final today = DateTime(2026, 9, 30, 21);
    await reading.finishReading(today);
    expect(reading.daysDone, 1);
    expect(reading.nextReading, [const ChapterRef('Matthew', 2)]);
    expect(reading.readOn(today), isTrue);
    expect(reading.readOn(DateTime(2026, 10, 1)), isFalse);

    final reloaded = await loaded();
    expect(reloaded.plan, gospels);
    expect(reloaded.daysDone, 1);
    expect(reloaded.readOn(today), isTrue);
  });

  test('switching plans keeps progress in each', () async {
    final reading = await loaded();
    await reading.startPlan(gospels);
    await reading.finishReading(DateTime(2026, 9, 30));
    await reading.startPlan(psalms);
    expect(reading.daysDone, 0);
    await reading.startPlan(gospels);
    expect(reading.daysDone, 1);
  });

  test('starting over and stopping', () async {
    final reading = await loaded();
    await reading.startPlan(gospels);
    await reading.finishReading(DateTime(2026, 9, 30));
    await reading.restartPlan();
    expect(reading.daysDone, 0);

    await reading.stopPlan();
    expect(reading.plan, isNull);
    expect((await loaded()).plan, isNull);
  });

  test('a plan is finished after its last day', () async {
    SharedPreferences.setMockInitialValues({
      'reading_plan': 'psalms_proverbs_30',
      'reading_progress_psalms_proverbs_30': 29,
    });
    final reading = await loaded();
    expect(reading.nextReading, psalms.days.last);
    await reading.finishReading(DateTime(2026, 9, 30));
    expect(reading.isFinished, isTrue);
    expect(reading.nextReading, isNull);

    await reading.finishReading(DateTime(2026, 10, 1));
    expect(reading.daysDone, 30);
  });
}
