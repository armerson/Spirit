import 'package:quitter/l10n/generated/app_localizations.dart';

/// A single chapter to read, such as Psalm 23 or John 3.
class ChapterRef {
  /// The book's name as stored in the bundled Bible text.
  final String book;
  final int chapter;

  const ChapterRef(this.book, this.chapter);

  /// "Psalm 23" rather than "Psalms 23", as the chapter is read aloud.
  String get label => '${book == 'Psalms' ? 'Psalm' : book} $chapter';

  @override
  bool operator ==(Object other) =>
      other is ChapterRef && other.book == book && other.chapter == chapter;

  @override
  int get hashCode => Object.hash(book, chapter);
}

/// A plan that walks through part of the Bible a day's reading at a time.
///
/// Plans are self-paced: the next reading is simply the first unfinished
/// day, so a busy week never leaves the reader "behind".
class ReadingPlan {
  final String id;
  final String Function(AppLocalizations l10n) title;
  final String Function(AppLocalizations l10n) description;
  final List<List<ChapterRef>> days;

  const ReadingPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.days,
  });
}

List<ChapterRef> _chapters(String book, Iterable<int> numbers) => [
  for (final number in numbers) ChapterRef(book, number),
];

/// The classic "five Psalms and a Proverb" plan: on day N, Psalms N, N+30,
/// N+60, N+90 and N+120 with Proverbs N, finishing both books in 30 days.
/// Proverbs has 31 chapters, so the last day also reads Proverbs 31.
List<List<ChapterRef>> psalmsAndProverbsDays() => [
  for (var day = 1; day <= 30; day++)
    [
      ..._chapters('Psalms', [for (var i = 0; i < 5; i++) day + i * 30]),
      ..._chapters('Proverbs', day == 30 ? [30, 31] : [day]),
    ],
];

const _gospels = {'Matthew': 28, 'Mark': 16, 'Luke': 24, 'John': 21};

/// One chapter a day through Matthew, Mark, Luke and John.
List<List<ChapterRef>> gospelsDays() => [
  for (final MapEntry(key: book, value: count) in _gospels.entries)
    for (var chapter = 1; chapter <= count; chapter++)
      [ChapterRef(book, chapter)],
];

/// The reading plans offered on the devotional page.
final List<ReadingPlan> readingPlans = [
  ReadingPlan(
    id: 'psalms_proverbs_30',
    title: (l10n) => l10n.planPsalmsProverbsTitle,
    description: (l10n) => l10n.planPsalmsProverbsDescription,
    days: psalmsAndProverbsDays(),
  ),
  ReadingPlan(
    id: 'gospels',
    title: (l10n) => l10n.planGospelsTitle,
    description: (l10n) => l10n.planGospelsDescription,
    days: gospelsDays(),
  ),
];

/// The plan with [id], or null if it no longer exists.
ReadingPlan? readingPlanById(String? id) {
  for (final plan in readingPlans) {
    if (plan.id == id) return plan;
  }
  return null;
}

/// A short title for a day's [chapters], grouping each book's chapters,
/// such as "Psalms 1, 31, 61 · Proverbs 1" or "John 3".
String readingLabel(List<ChapterRef> chapters) {
  final byBook = <String, List<int>>{};
  for (final ref in chapters) {
    byBook.putIfAbsent(ref.book, () => []).add(ref.chapter);
  }
  return byBook.entries
      .map(
        (entry) => entry.value.length == 1
            ? ChapterRef(entry.key, entry.value.single).label
            : '${entry.key} ${entry.value.join(', ')}',
      )
      .join(' · ');
}
