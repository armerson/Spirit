import 'dart:convert';
import 'package:flutter/services.dart';

/// A Bible passage from the bundled World English Bible selection, tagged
/// with the themes it speaks to so encouragement can pick a fitting one.
class Verse {
  final String reference;
  final String text;
  final Set<String> themes;

  const Verse({
    required this.reference,
    required this.text,
    this.themes = const {},
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    reference: json['reference'] as String,
    text: json['text'] as String,
    themes: (json['themes'] as List<dynamic>? ?? const [])
        .whereType<String>()
        .toSet(),
  );
}

/// Loads the verses bundled in `assets/verses.json`, a hand-picked set of
/// encouraging passages from the public-domain World English Bible.
Future<List<Verse>> loadVerses([AssetBundle? bundle]) async {
  final raw = await (bundle ?? rootBundle).loadString('assets/verses.json');
  final data = json.decode(raw) as Map<String, dynamic>;
  return (data['verses'] as List<dynamic>)
      .whereType<Map<String, dynamic>>()
      .map(Verse.fromJson)
      .toList();
}

/// The verse shown on [day]: the same all day, and a different one each
/// day, cycling through every verse before any repeats.
Verse verseForDay(List<Verse> verses, DateTime day) {
  final dayNumber = DateTime.utc(
    day.year,
    day.month,
    day.day,
  ).difference(DateTime.utc(2026)).inDays;
  return verses[dayNumber % verses.length];
}
