import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

const _quickMinutes = [15, 30, 45, 60];

/// Asks how many minutes an activity took, starting from [initial]. Returns
/// null if cancelled, or 0 to clear the minutes.
Future<int?> showMinutesDialog(BuildContext context, {int initial = 0}) {
  return showDialog<int>(
    context: context,
    builder: (context) => _MinutesDialog(initial: initial),
  );
}

class _MinutesDialog extends StatefulWidget {
  final int initial;

  const _MinutesDialog({required this.initial});

  @override
  State<_MinutesDialog> createState() => _MinutesDialogState();
}

class _MinutesDialogState extends State<_MinutesDialog> {
  late final _controller = TextEditingController(
    text: widget.initial > 0 ? '${widget.initial}' : '',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() =>
      Navigator.of(context).pop(int.tryParse(_controller.text.trim()) ?? 0);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.habitMinutesTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            key: const Key('minutesField'),
            controller: _controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              labelText: l10n.habitMinutesLabel,
              border: const OutlineInputBorder(),
            ),
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              for (final minutes in _quickMinutes)
                ActionChip(
                  label: Text('$minutes'),
                  onPressed: () => _controller.text = '$minutes',
                ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(onPressed: _save, child: Text(l10n.editEntrySave)),
      ],
    );
  }
}
