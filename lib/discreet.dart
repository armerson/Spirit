import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

/// The icon a built-in journey shows in discreet mode.
const discreetIcon = Icons.spa;

/// Names built-in journeys for the home and stats screens. In discreet mode
/// a journey's built-in name and icon, which say what the struggle is, give
/// way to "Journey", "Journey 2" and so on, unless the user has chosen a
/// private name or icon of their own. Journeys the user named themselves
/// always keep their names.
class JourneyNamer {
  final AppLocalizations l10n;
  final bool discreet;
  var _hidden = 0;

  JourneyNamer(this.l10n, {required this.discreet});

  /// The name to show for a built-in journey called [builtInName], or
  /// [customName] if the user renamed it. Call once per journey, in display
  /// order, so the neutral names are numbered consistently.
  String name(String builtInName, {String? customName}) {
    if (customName != null) return customName;
    if (!discreet) return builtInName;
    _hidden++;
    return _hidden == 1
        ? l10n.discreetJourney
        : l10n.discreetJourneyNumbered(_hidden);
  }

  /// The icon to show for a built-in journey whose own icon is [builtInIcon].
  IconData icon(IconData builtInIcon, {IconData? customIcon}) =>
      customIcon ?? (discreet ? discreetIcon : builtInIcon);
}
