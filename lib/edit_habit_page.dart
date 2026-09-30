import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/color_picker.dart';
import 'package:quitter/habit.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/icon_picker.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:uuid/uuid.dart';

/// Default icon and colour for a new habit in each category.
const Map<HabitCategory, (IconData, Color)> habitCategoryDefaults = {
  HabitCategory.faith: (Icons.menu_book, Colors.indigo),
  HabitCategory.fitness: (Icons.directions_run, Colors.green),
  HabitCategory.relationship: (Icons.favorite, Colors.pink),
  HabitCategory.other: (Icons.star, Colors.amber),
};

/// The localized name of a habit [category].
String habitCategoryName(AppLocalizations l10n, HabitCategory category) {
  return switch (category) {
    HabitCategory.faith => l10n.habitCategoryFaith,
    HabitCategory.fitness => l10n.habitCategoryFitness,
    HabitCategory.relationship => l10n.habitCategoryRelationship,
    HabitCategory.other => l10n.habitCategoryOther,
  };
}

/// Creates a new good habit, or edits and deletes an existing [habit].
class EditHabitPage extends StatefulWidget {
  final Habit? habit;

  const EditHabitPage({super.key, this.habit});

  @override
  State<EditHabitPage> createState() => _EditHabitPageState();
}

class _EditHabitPageState extends State<EditHabitPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late HabitCategory _category;
  late int _targetPerWeek;
  late Color _color;
  late IconData _icon;

  @override
  void initState() {
    super.initState();
    final habit = widget.habit;
    _titleController = TextEditingController(text: habit?.title ?? '');
    _category = habit?.category ?? HabitCategory.faith;
    _targetPerWeek = habit?.targetPerWeek ?? 7;
    final (defaultIcon, defaultColor) = habitCategoryDefaults[_category]!;
    _color = habit?.color ?? defaultColor;
    _icon = habit?.icon ?? defaultIcon;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _selectCategory(HabitCategory category) {
    setState(() {
      final (oldIcon, oldColor) = habitCategoryDefaults[_category]!;
      final (newIcon, newColor) = habitCategoryDefaults[category]!;
      if (_icon == oldIcon) _icon = newIcon;
      if (_color == oldColor) _color = newColor;
      _category = category;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final habits = context.read<HabitProvider>();
    final title = _titleController.text.trim();
    final existing = widget.habit;
    if (existing == null) {
      await habits.addHabit(
        Habit(
          id: const Uuid().v4(),
          title: title,
          category: _category,
          targetPerWeek: _targetPerWeek,
          color: _color,
          icon: _icon,
          createdAt: DateTime.now(),
        ),
      );
    } else {
      existing
        ..title = title
        ..category = _category
        ..targetPerWeek = _targetPerWeek
        ..color = _color
        ..icon = _icon;
      await habits.updateHabit(existing);
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _delete() async {
    final habit = widget.habit;
    if (habit == null) return;
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.editEntryDeleteDialogTitle),
        content: Text(l10n.editEntryDeleteDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.editEntryDeleteNo),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.editEntryDeleteYes),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await context.read<HabitProvider>().deleteHabit(habit.id);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.habit == null ? l10n.editHabitAddTitle : l10n.editHabitTitle,
        ),
        actions: [
          if (widget.habit != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: l10n.habitDelete,
              onPressed: _delete,
            ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
            children: [
              TextFormField(
                key: const Key('habitTitleField'),
                controller: _titleController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: l10n.editEntryTitle,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? l10n.editEntryTitleError
                    : null,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.habitCategoryLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final category in HabitCategory.values)
                    ChoiceChip(
                      label: Text(habitCategoryName(l10n, category)),
                      selected: _category == category,
                      onSelected: (_) => _selectCategory(category),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<int>(
                initialValue: _targetPerWeek,
                decoration: InputDecoration(
                  labelText: l10n.habitTargetLabel,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  for (var days = 7; days >= 1; days--)
                    DropdownMenuItem(
                      value: days,
                      child: Text(
                        days == 7
                            ? l10n.habitTargetDaily
                            : l10n.habitTargetWeekly(days),
                      ),
                    ),
                ],
                onChanged: (days) {
                  if (days != null) setState(() => _targetPerWeek = days);
                },
              ),
              const SizedBox(height: 20),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.editEntryColor,
                  border: const OutlineInputBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ColorPickerWidget(
                    selectedColor: _color,
                    onColorSelected: (color) => setState(() => _color = color),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.editEntryIcon,
                  border: const OutlineInputBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconPickerWidget(
                    selectedIcon: _icon,
                    iconColor: _color,
                    onIconSelected: (icon) => setState(() => _icon = icon),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _save,
        label: Text(l10n.editEntrySave),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
