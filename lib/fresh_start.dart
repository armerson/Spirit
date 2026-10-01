import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/verses.dart';

/// How long the start again button must be held before it fires.
const freshStartHoldDuration = Duration(milliseconds: 1600);

/// A button that must be pressed and held while a ring fills, so starting
/// a journey again is a deliberate pledge rather than an accidental tap.
/// [onConfirmed] receives the button's centre on screen, for the wash.
class HoldToStartAgainButton extends StatefulWidget {
  final void Function(Offset origin) onConfirmed;

  const HoldToStartAgainButton({super.key, required this.onConfirmed});

  @override
  State<HoldToStartAgainButton> createState() => _HoldToStartAgainButtonState();
}

class _HoldToStartAgainButtonState extends State<HoldToStartAgainButton>
    with SingleTickerProviderStateMixin {
  late final _hold = AnimationController(
    vsync: this,
    duration: freshStartHoldDuration,
    reverseDuration: const Duration(milliseconds: 300),
  )..addStatusListener(_onHoldStatus);

  @override
  void dispose() {
    _hold.dispose();
    super.dispose();
  }

  void _onHoldStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    HapticFeedback.heavyImpact();
    _hold.value = 0;
    _confirm();
  }

  void _confirm() {
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null || !box.hasSize
        ? Offset.zero
        : box.localToGlobal(box.size.center(Offset.zero));
    widget.onConfirmed(origin);
  }

  void _press() {
    HapticFeedback.selectionClick();
    _hold.forward();
  }

  void _release() {
    if (_hold.status != AnimationStatus.forward) return;
    if (_hold.value < 0.2) {
      toast(AppLocalizations.of(context)!.freshStartHoldHint);
    }
    _hold.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: l10n.freshStartHold,
      onLongPress: _confirm,
      excludeSemantics: true,
      child: Listener(
        onPointerDown: (_) => _press(),
        onPointerUp: (_) => _release(),
        onPointerCancel: (_) => _release(),
        child: Material(
          key: const Key('freshStartButton'),
          color: colorScheme.primaryContainer,
          elevation: 6,
          shape: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 20, 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 28,
                  child: AnimatedBuilder(
                    animation: _hold,
                    builder: (context, child) => Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: _hold.value,
                          strokeWidth: 3,
                          color: colorScheme.onPrimaryContainer,
                          backgroundColor: colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.15),
                        ),
                        child!,
                      ],
                    ),
                    child: Icon(
                      Icons.wb_sunny_outlined,
                      size: 16,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  l10n.freshStartHold,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Floods the screen with white from [origin], like a slate wiped clean,
/// then shows the pledge and [verse] until the user taps to carry on.
Future<void> showFreshStartWash(
  BuildContext context, {
  required Offset origin,
  Verse? verse,
}) {
  return Navigator.of(context).push(
    PageRouteBuilder<void>(
      opaque: false,
      transitionDuration: const Duration(milliseconds: 900),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          FreshStartPage(verse: verse),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (animation.status == AnimationStatus.reverse) {
          return FadeTransition(opacity: animation, child: child);
        }
        return ClipPath(
          clipper: _RadialWashClipper(
            origin: origin,
            progress: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInCubic,
            ),
          ),
          child: child,
        );
      },
    ),
  );
}

class _RadialWashClipper extends CustomClipper<Path> {
  final Offset origin;
  final Animation<double> progress;

  _RadialWashClipper({required this.origin, required this.progress})
    : super(reclip: progress);

  @override
  Path getClip(Size size) {
    final farthestCorner = [
      Offset.zero,
      Offset(size.width, 0),
      Offset(0, size.height),
      Offset(size.width, size.height),
    ].map((corner) => (corner - origin).distance).reduce(max);
    return Path()..addOval(
      Rect.fromCircle(center: origin, radius: farthestCorner * progress.value),
    );
  }

  @override
  bool shouldReclip(_RadialWashClipper oldClipper) =>
      oldClipper.origin != origin || oldClipper.progress != progress;
}

/// The white page shown after starting again: a clean slate, the pledge
/// and a verse of mercy that is new every morning.
class FreshStartPage extends StatelessWidget {
  final Verse? verse;

  const FreshStartPage({super.key, this.verse});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    const ink = Color(0xFF2B2B2B);
    final verse = this.verse;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wb_sunny_outlined, size: 48, color: ink),
                const SizedBox(height: 24),
                Text(
                  l10n.freshStartTitle,
                  style: textTheme.headlineMedium?.copyWith(color: ink),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.freshStartPledge,
                  style: textTheme.titleMedium?.copyWith(color: ink),
                  textAlign: TextAlign.center,
                ),
                if (verse != null) ...[
                  const SizedBox(height: 32),
                  Text(
                    verse.text,
                    style: textTheme.bodyLarge?.copyWith(
                      color: ink,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.verseReference(verse.reference),
                    style: textTheme.labelMedium?.copyWith(color: ink),
                  ),
                ],
                const SizedBox(height: 48),
                Text(
                  l10n.freshStartContinue,
                  style: textTheme.labelLarge?.copyWith(
                    color: ink.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
