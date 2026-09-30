import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/bible.dart';
import 'package:quitter/reading_plans.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  List<int> chaptersOf(List<List<ChapterRef>> days, String book) => [
    for (final day in days)
      for (final ref in day)
        if (ref.book == book) ref.chapter,
  ];

  test('Psalms & Proverbs reads every chapter once in 30 days', () {
    final days = psalmsAndProverbsDays();
    expect(days, hasLength(30));
    expect(
      chaptersOf(days, 'Psalms')..sort(),
      List.generate(150, (i) => i + 1),
    );
    expect(chaptersOf(days, 'Proverbs'), List.generate(31, (i) => i + 1));
    expect(days.first, [
      for (final psalm in [1, 31, 61, 91, 121]) ChapterRef('Psalms', psalm),
      const ChapterRef('Proverbs', 1),
    ]);
  });

  test('the Gospels plan reads a chapter a day in order', () {
    final days = gospelsDays();
    expect(days, hasLength(89));
    expect(days.every((day) => day.length == 1), isTrue);
    expect(days.first.single, const ChapterRef('Matthew', 1));
    expect(days[28].single, const ChapterRef('Mark', 1));
    expect(days.last.single, const ChapterRef('John', 21));
  });

  test('plan ids are unique and can be looked up', () {
    expect(readingPlans.map((plan) => plan.id).toSet(), hasLength(2));
    expect(readingPlanById('gospels')?.days, hasLength(89));
    expect(readingPlanById('gone'), isNull);
    expect(readingPlanById(null), isNull);
  });

  test('labels group chapters by book', () {
    expect(const ChapterRef('Psalms', 23).label, 'Psalm 23');
    expect(readingLabel([const ChapterRef('John', 3)]), 'John 3');
    expect(
      readingLabel(psalmsAndProverbsDays().first),
      'Psalms 1, 31, 61, 91, 121 · Proverbs 1',
    );
  });

  group('bundled Bible text', () {
    late Bible bible;

    setUpAll(() async => bible = await loadBible());

    test('has every chapter and verse of the plan books', () {
      const verseCounts = {
        'Psalms': (150, 2461),
        'Proverbs': (31, 915),
        'Matthew': (28, 1071),
        'Mark': (16, 678),
        'Luke': (24, 1151),
        'John': (21, 879),
      };
      expect(bible.keys.toSet(), verseCounts.keys.toSet());
      for (final MapEntry(key: book, value: (chapters, verses))
          in verseCounts.entries) {
        expect(bible[book], hasLength(chapters), reason: book);
        final total = bible[book]!.fold(0, (sum, c) => sum + c.verses.length);
        expect(total, verses, reason: book);
        final blank = [
          for (final (c, chapter) in bible[book]!.indexed)
            for (final (v, verse) in chapter.verses.indexed)
              if (verse.trim().isEmpty) '$book ${c + 1}:${v + 1}',
        ];
        // The WEB leaves Luke 17:36 out, as most modern translations do.
        expect(blank, book == 'Luke' ? ['Luke 17:36'] : isEmpty);
      }
    });

    test('covers every chapter the plans read', () {
      for (final plan in readingPlans) {
        for (final ref in plan.days.expand((day) => day)) {
          expect(
            bible[ref.book]!.length,
            greaterThanOrEqualTo(ref.chapter),
            reason: ref.label,
          );
        }
      }
    });

    test('uses the World English Bible wording', () {
      expect(
        bible['John']![2].verses[15],
        startsWith(
          'For God so loved the world, that he gave his one and '
          'only Son',
        ),
      );
      expect(
        bible['Psalms']![22].verses.first,
        'Yahweh is my shepherd: I shall lack nothing.',
      );
      expect(bible['Psalms']![22].heading, 'A Psalm by David.');
    });
  });
}
