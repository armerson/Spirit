import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/app_icons.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/logging.dart';

class AddictionProvider extends ChangeNotifier {
  SharedPreferences? _pref;

  String? _smoking;
  String? _vaping;
  String? _alcohol;
  String? _pouches;
  String? _socialMedia;
  String? _pornography;
  String? _marijuana;
  String? _smokelessTobacco;

  List<Entry> entries = [];
  List<String> cardOrder = [];
  Map<String, String> customNames = {};
  Map<String, IconData> customIcons = {};
  Map<String, Color> customColors = {};
  Map<String, List<int>> _days = {};

  Future<void> loadAddictions() async {
    _pref = await SharedPreferences.getInstance();

    String? readDate(String key) {
      final value = _pref!.get(key);
      return value is String && DateTime.tryParse(value) != null ? value : null;
    }

    dynamic decodeJson(String key) {
      final value = _pref!.get(key);
      if (value is! String) return null;
      final raw = value;
      try {
        return json.decode(raw);
      } catch (error, stackTrace) {
        talker.handle(error, stackTrace, 'Ignored invalid recovery data: $key');
        return null;
      }
    }

    _smoking = readDate('smoking');
    _vaping = readDate('vaping');
    _alcohol = readDate('alcohol');
    _pouches = readDate('nicotine_pouches');
    _socialMedia = readDate('social_media');
    _pornography = readDate('pornography');
    _marijuana = readDate('marijuana');
    _smokelessTobacco = readDate('smokeless_tobacco');

    entries = [];
    final entriesData = decodeJson('entries');
    if (entriesData is List) {
      for (final item in entriesData) {
        if (item is! Map<String, dynamic>) continue;
        try {
          entries.add(Entry.fromJson(item));
        } catch (error, stackTrace) {
          talker.handle(
            error,
            stackTrace,
            'Ignored invalid custom recovery entry',
          );
        }
      }
    }

    cardOrder = [];
    final orderData = decodeJson('card_order');
    if (orderData is List) {
      cardOrder = orderData.whereType<String>().toList();
    }

    customNames = {};
    final namesData = decodeJson('custom_names');
    if (namesData is Map<String, dynamic>) {
      customNames = {
        for (final entry in namesData.entries)
          if (entry.value is String) entry.key: entry.value as String,
      };
    }

    customIcons = {};
    final iconsData = decodeJson('custom_icons');
    if (iconsData is Map<String, dynamic>) {
      customIcons = {
        for (final entry in iconsData.entries)
          if (entry.value is String && allIcons[entry.value as String] != null)
            entry.key: allIcons[entry.value as String]!,
      };
    }

    customColors = {};
    final colorsData = decodeJson('custom_colors');
    if (colorsData is Map<String, dynamic>) {
      customColors = {
        for (final entry in colorsData.entries)
          if (entry.value is int) entry.key: Color(entry.value as int),
      };
    }

    _days = {};
    final daysData = decodeJson('days');
    if (daysData is Map<String, dynamic>) {
      _days = {
        for (final entry in daysData.entries)
          if (entry.value is List)
            entry.key: (entry.value as List).whereType<int>().toList(),
      };
    }

    await _writeActiveAddictionKeysForWidget();

    notifyListeners();
    talker.debug('Loaded recovery data: ${entries.length} custom entries');
  }

  Future<void> _writeActiveAddictionKeysForWidget() async {
    final allAddictions = <String, String?>{
      'smoking': _smoking,
      'vaping': _vaping,
      'alcohol': _alcohol,
      'nicotine_pouches': _pouches,
      'social_media': _socialMedia,
      'pornography': _pornography,
      'marijuana': _marijuana,
      'smokeless_tobacco': _smokelessTobacco,
    };
    final activeKeys = allAddictions.entries
        .where((e) => e.value != null)
        .map((e) => e.key)
        .toList();
    await _pref?.setString('active_addiction_keys', json.encode(activeKeys));
  }

  String? getAddiction(String key) {
    final value = _pref?.get(key);
    return value is String && DateTime.tryParse(value) != null ? value : null;
  }

  Future<void> setAddiction(String key, String? value) async {
    if (value == null) {
      await _pref?.remove(key);
    } else {
      await _pref?.setString(key, value);
    }
    await loadAddictions();
    talker.info(
      value == null ? 'Removed a tracked journey' : 'Updated a tracked journey',
    );
    if (defaultTargetPlatform == TargetPlatform.android) {
      await HomeWidget.updateWidget(name: 'QuitTrackerWidget');
    }
  }

  String? get quitAlcohol => _alcohol;
  String? get quitVaping => _vaping;
  String? get quitSmoking => _smoking;
  String? get quitPouches => _pouches;
  String? get quitSocialMedia => _socialMedia;
  String? get quitPornography => _pornography;
  String? get quitMarijuana => _marijuana;
  String? get quitSmokelessTobacco => _smokelessTobacco;

  bool get hasActivePresetJourney => [
    _smoking,
    _vaping,
    _alcohol,
    _pouches,
    _socialMedia,
    _pornography,
    _marijuana,
    _smokelessTobacco,
  ].any((value) => value != null);

  Future<void> saveCardOrder(List<String> order) async {
    cardOrder = order;
    await _pref?.setString('card_order', json.encode(order));
    notifyListeners();
  }

  Future<void> setCustomName(String key, String name) async {
    customNames[key] = name;
    await _pref?.setString('custom_names', json.encode(customNames));
    notifyListeners();
  }

  Future<void> setCustomIcon(String key, IconData icon) async {
    customIcons[key] = icon;
    final Map<String, String> serialized = {
      for (final entry in customIcons.entries)
        if (iconNames[entry.value] != null) entry.key: iconNames[entry.value]!,
    };
    await _pref?.setString('custom_icons', json.encode(serialized));
    notifyListeners();
  }

  Future<void> setCustomColor(String key, Color color) async {
    customColors[key] = color;
    await _pref?.setString(
      'custom_colors',
      json.encode(customColors.map((k, v) => MapEntry(k, v.toARGB32()))),
    );
    notifyListeners();
  }

  Future<void> _saveEntries() async {
    final List<Map<String, dynamic>> list = entries
        .map((e) => e.toJson())
        .toList();
    await _pref?.setString('entries', json.encode(list));
  }

  Future<void> addEntry(Entry e) async {
    entries.add(e);
    await _saveEntries();
    notifyListeners();
    talker.info('Added a custom recovery entry');
  }

  Future<void> updateEntry(Entry entry) async {
    final index = entries.indexWhere((e) => e.id == entry.id);
    if (index == -1) return;
    entries[index] = entry;
    await _saveEntries();
    notifyListeners();
    talker.info('Updated a custom recovery entry');
  }

  Future<void> deleteEntry(String id) async {
    entries.removeWhere((e) => e.id == id);
    await _saveEntries();
    notifyListeners();
    talker.info('Deleted a custom recovery entry');
  }

  Future<void> resetEntry(String id, int days) async {
    final index = entries.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final entry = entries[index];
    entry.daysAchieved.add(days);
    entry.quitDate = DateTime.now();
    await _saveEntries();
    notifyListeners();
    talker.info('Reset a custom recovery entry');
  }

  Future<void> _saveDays() async {
    await _pref?.setString('days', json.encode(_days));
  }

  List<int> getDays(String key) {
    return _days[key] ?? const [];
  }

  Future<void> popDays(String key) async {
    final values = _days[key];
    if (values == null || values.isEmpty) return;
    values.removeLast();
    if (values.isEmpty) _days.remove(key);
    await _saveDays();
    notifyListeners();
  }

  Future<void> resetAddiction(String key, int days) async {
    _days.update(key, (val) => [...val, days], ifAbsent: () => [days]);
    await _saveDays();
    await setAddiction(key, DateTime.now().toIso8601String());
    talker.info('Reset a tracked journey');
  }

  Future<void> clearMilestoneDays(String key, List<int> daysToClear) async {
    if (daysToClear.isEmpty) return;

    if (_days.containsKey(key)) {
      _days[key]?.removeWhere((day) => daysToClear.contains(day));
      await _saveDays();
    } else {
      final index = entries.indexWhere((entry) => entry.id == key);
      if (index == -1) return;
      entries[index].daysAchieved = entries[index].daysAchieved
          .where((day) => !daysToClear.contains(day))
          .toList();
      await _saveEntries();
    }

    notifyListeners();
  }

  Future<void> clearDays() async {
    await _pref?.remove('days');
    _days = {};
    notifyListeners();
  }
}
