import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitter/encouragement.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/verses.dart';
import 'package:share_plus/share_plus.dart';

/// Room for a full passage like 1 Corinthians 10:13, which a snackbar
/// could not fit.
const _sheetVerseLength = 400;

/// Opens help for a moment of temptation: a verse, a short prayer, a few
/// practical steps and a way to ask someone for prayer.
Future<void> showStrugglingSheet(
  BuildContext context, {
  Future<List<Verse>>? verses,
}) {
  HapticFeedback.mediumImpact();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    builder: (context) => StrugglingSheet(verses: verses),
  );
}

/// The content of [showStrugglingSheet].
class StrugglingSheet extends StatefulWidget {
  /// Overrides the bundled verses, for tests.
  final Future<List<Verse>>? verses;

  const StrugglingSheet({super.key, this.verses});

  @override
  State<StrugglingSheet> createState() => _StrugglingSheetState();
}

class _StrugglingSheetState extends State<StrugglingSheet> {
  final _random = Random();
  List<Verse> _verses = const [];
  Verse? _verse;

  @override
  void initState() {
    super.initState();
    (widget.verses ?? bundledVerses()).then((verses) {
      if (!mounted) return;
      setState(() {
        _verses = verses;
        _verse = _pickVerse();
      });
    });
  }

  Verse? _pickVerse() {
    final previous = _verse;
    final others = previous == null
        ? _verses
        : _verses.where((verse) => verse != previous).toList();
    return verseFor(
      EncouragementMoment.struggling,
      others,
      _random,
      _sheetVerseLength,
    );
  }

  void _madeIt(AppLocalizations l10n) {
    HapticFeedback.heavyImpact();
    Navigator.of(context).pop();
    toast(l10n.strugglingMadeItMessage, duration: encouragementToastDuration);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final verse = _verse;

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      children: [
        Text(l10n.strugglingTitle, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(l10n.strugglingBody, style: theme.textTheme.bodyLarge),
        if (verse != null) ...[
          const SizedBox(height: 16),
          Card(
            color: theme.colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 4),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => setState(() => _verse = _pickVerse()),
                      icon: const Icon(Icons.refresh),
                      label: Text(l10n.strugglingAnotherVerse),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        Text(l10n.strugglingPrayTitle, style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          l10n.strugglingPrayer,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16),
        Text(l10n.strugglingStepsTitle, style: theme.textTheme.titleMedium),
        for (final (icon, step) in [
          (Icons.air, l10n.strugglingStepBreathe),
          (Icons.directions_walk, l10n.strugglingStepMove),
          (Icons.waves, l10n.strugglingStepWait),
        ])
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon),
            title: Text(step),
          ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () => SharePlus.instance.share(
            ShareParams(text: l10n.strugglingShareMessage),
          ),
          icon: const Icon(Icons.people),
          label: Text(l10n.strugglingReachOut),
        ),
        const SizedBox(height: 8),
        FilledButton.icon(
          key: const Key('strugglingMadeIt'),
          onPressed: () => _madeIt(l10n),
          icon: const Icon(Icons.check),
          label: Text(l10n.strugglingMadeIt),
        ),
      ],
    );
  }
}
