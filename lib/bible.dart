import 'dart:convert';

import 'package:flutter/services.dart';

/// One chapter of the bundled World English Bible text.
class BibleChapter {
  /// The superscription some Psalms open with, such as "A Psalm by David."
  final String? heading;
  final List<String> verses;

  const BibleChapter({required this.verses, this.heading});

  factory BibleChapter.fromJson(Map<String, dynamic> json) => BibleChapter(
    heading: json['heading'] as String?,
    verses: (json['verses'] as List<dynamic>).cast<String>(),
  );
}

/// The books bundled for the reading plans, keyed by name, each a list of
/// chapters in order.
typedef Bible = Map<String, List<BibleChapter>>;

/// Loads `assets/bible_web.json`: Psalms, Proverbs and the four Gospels
/// from the public-domain World English Bible, so plans work offline.
Future<Bible> loadBible([AssetBundle? bundle]) async {
  final raw = await (bundle ?? rootBundle).loadString('assets/bible_web.json');
  final books =
      (json.decode(raw) as Map<String, dynamic>)['books']
          as Map<String, dynamic>;
  return {
    for (final MapEntry(key: name, value: chapters) in books.entries)
      name: (chapters as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(BibleChapter.fromJson)
          .toList(),
  };
}

Bible? _bundledBible;

/// The bundled Bible text, loaded once and shared by every caller.
Future<Bible> bundledBible() async => _bundledBible ??= await loadBible();
