import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/verses.dart';
import 'package:share_plus/share_plus.dart';

/// The verse of the day, shown at the top of the home screen.
class VerseOfTheDayCard extends StatefulWidget {
  /// Overrides the bundled verses, for tests.
  final Future<List<Verse>>? verses;

  const VerseOfTheDayCard({super.key, this.verses});

  @override
  State<VerseOfTheDayCard> createState() => _VerseOfTheDayCardState();
}

class _VerseOfTheDayCardState extends State<VerseOfTheDayCard> {
  static Future<List<Verse>>? _bundledVerses;
  late final Future<List<Verse>> _verses;

  @override
  void initState() {
    super.initState();
    _verses = widget.verses ?? (_bundledVerses ??= loadVerses());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return FutureBuilder<List<Verse>>(
      future: _verses,
      builder: (context, snapshot) {
        final verses = snapshot.data;
        if (verses == null || verses.isEmpty) return const SizedBox.shrink();
        final verse = verseForDay(verses, DateTime.now());
        return Card(
          color: theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_stories,
                      size: 20,
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.verseOfTheDay,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: l10n.verseShare,
                      color: theme.colorScheme.onSecondaryContainer,
                      onPressed: () => SharePlus.instance.share(
                        ShareParams(
                          text: l10n.verseShareMessage(
                            verse.text,
                            verse.reference,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        verse.text,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.verseReference(verse.reference),
                        textAlign: TextAlign.end,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
