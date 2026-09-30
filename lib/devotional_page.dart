import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quitter/bible.dart';
import 'package:quitter/encouragement.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/reading_plans.dart';
import 'package:quitter/reading_provider.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/verses.dart';

/// The daily devotional: the next reading from the user's plan, an
/// optional prayer note for the journal, and a button that ticks off every
/// habit linked to the reading.
class DevotionalPage extends StatefulWidget {
  /// Overrides the bundled Bible text, for tests.
  final Future<Bible>? bible;

  const DevotionalPage({super.key, this.bible});

  @override
  State<DevotionalPage> createState() => _DevotionalPageState();
}

class _DevotionalPageState extends State<DevotionalPage> {
  late final Future<Bible> _bible;
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bible = widget.bible ?? bundledBible();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _finish(List<ChapterRef> chapters) async {
    HapticFeedback.mediumImpact();
    final l10n = AppLocalizations.of(context)!;
    final reading = context.read<ReadingProvider>();
    final habits = context.read<HabitProvider>();
    final now = DateTime.now();
    final note = _noteController.text.trim();

    await reading.finishReading(now);
    if (note.isNotEmpty) {
      await addToJournal(now, '${readingLabel(chapters)}\n$note');
    }
    for (final habit in habits.habits.where((habit) => habit.opensReading)) {
      await habits.markDone(habit.id, now);
    }
    _noteController.clear();

    final verse = verseFor(EncouragementMoment.checkIn, await bundledVerses());
    toast(
      withVerse(l10n, l10n.readingFinishedMessage, verse),
      duration: encouragementToastDuration,
    );
    if (mounted && Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reading = context.watch<ReadingProvider>();
    final plan = reading.plan;
    final chapters = reading.nextReading;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.readingTitle),
        actions: [
          if (plan != null)
            PopupMenuButton<VoidCallback>(
              onSelected: (action) => action(),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: reading.stopPlan,
                  child: Text(l10n.readingChangePlan),
                ),
                PopupMenuItem(
                  value: reading.restartPlan,
                  child: Text(l10n.readingStartOver),
                ),
              ],
            ),
        ],
      ),
      body: switch ((plan, chapters)) {
        (null, _) => const _PlanPicker(),
        (final plan?, null) => _PlanComplete(plan: plan),
        (final plan?, final chapters?) => FutureBuilder<Bible>(
          future: _bible,
          builder: (context, snapshot) {
            final bible = snapshot.data;
            if (bible == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return _Reading(
              plan: plan,
              day: reading.daysDone + 1,
              readToday: reading.readOn(DateTime.now()),
              chapters: chapters,
              bible: bible,
              noteController: _noteController,
              onFinish: () => _finish(chapters),
            );
          },
        ),
      },
    );
  }
}

class _PlanPicker extends StatelessWidget {
  const _PlanPicker();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.readingChoosePlan, style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(l10n.readingChoosePlanHint),
        const SizedBox(height: 16),
        for (final plan in readingPlans)
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              title: Text(plan.title(l10n)),
              subtitle: Text(
                '${plan.description(l10n)}\n'
                '${l10n.readingPlanDays(plan.days.length)}',
              ),
              isThreeLine: true,
              trailing: FilledButton.tonal(
                key: Key('startPlan-${plan.id}'),
                onPressed: () =>
                    context.read<ReadingProvider>().startPlan(plan),
                child: Text(l10n.readingStart),
              ),
            ),
          ),
      ],
    );
  }
}

class _PlanComplete extends StatelessWidget {
  final ReadingPlan plan;

  const _PlanComplete({required this.plan});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.celebration, size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              l10n.readingPlanComplete(plan.title(l10n)),
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(l10n.readingPlanCompleteBody, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: context.read<ReadingProvider>().stopPlan,
              child: Text(l10n.readingChoosePlanAgain),
            ),
          ],
        ),
      ),
    );
  }
}

class _Reading extends StatelessWidget {
  final ReadingPlan plan;
  final int day;
  final bool readToday;
  final List<ChapterRef> chapters;
  final Bible bible;
  final TextEditingController noteController;
  final VoidCallback onFinish;

  const _Reading({
    required this.plan,
    required this.day,
    required this.readToday,
    required this.chapters,
    required this.bible,
    required this.noteController,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        Text(
          '${plan.title(l10n)} · ${l10n.readingDayOf(day, plan.days.length)}',
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 4),
        Text(readingLabel(chapters), style: theme.textTheme.headlineSmall),
        const SizedBox(height: 12),
        Card(
          color: readToday
              ? theme.colorScheme.tertiaryContainer
              : theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              readToday ? l10n.readingDoneToday : l10n.readingPrayerPrompt,
            ),
          ),
        ),
        for (final ref in chapters) _ChapterText(ref: ref, bible: bible),
        const SizedBox(height: 24),
        TextField(
          key: const Key('readingNote'),
          controller: noteController,
          minLines: 3,
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: l10n.readingNoteLabel,
            helperText: l10n.readingNoteHint,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          key: const Key('finishReading'),
          onPressed: onFinish,
          icon: const Icon(Icons.check),
          label: Text(l10n.readingFinish),
        ),
      ],
    );
  }
}

class _ChapterText extends StatelessWidget {
  final ChapterRef ref;
  final Bible bible;

  const _ChapterText({required this.ref, required this.bible});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chapters = bible[ref.book];
    if (chapters == null || ref.chapter > chapters.length) {
      return const SizedBox.shrink();
    }
    final chapter = chapters[ref.chapter - 1];
    final verseNumberStyle = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.primary,
      fontFeatures: const [FontFeature.superscripts()],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ref.label, style: theme.textTheme.titleLarge),
          if (chapter.heading != null) ...[
            const SizedBox(height: 4),
            Text(
              chapter.heading!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
              children: [
                for (final (index, verse) in chapter.verses.indexed)
                  if (verse.isNotEmpty) ...[
                    TextSpan(text: '${index + 1} ', style: verseNumberStyle),
                    TextSpan(text: '$verse '),
                  ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
