import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/empty_state.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/smokeless_tobacco_page.dart';

class _AddictionOption {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final Widget destination;
  final List<String> aliases;

  const _AddictionOption({
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.destination,
    this.aliases = const [],
  });

  bool matches(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase();
    if (title.toLowerCase().contains(q)) return true;
    return aliases.any((a) => a.contains(q));
  }
}

class AddAddictionPage extends StatefulWidget {
  const AddAddictionPage({super.key, this.initialQuery = ''});

  final String initialQuery;

  @override
  State<AddAddictionPage> createState() => _AddAddictionPageState();
}

class _AddAddictionPageState extends State<AddAddictionPage> {
  late final TextEditingController _searchController;
  late String _query;

  @override
  void initState() {
    super.initState();
    _query = widget.initialQuery;
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final addictions = context.watch<AddictionProvider>();

    final options = <_AddictionOption>[];

    if (addictions.quitAlcohol == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionAlcohol,
          icon: Icons.local_bar,
          gradientColors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
          destination: const AlcoholPage(started: false),
          aliases: const [
            'booze',
            'drinking',
            'beer',
            'wine',
            'spirits',
            'liquor',
            'whiskey',
            'vodka',
            'drunk',
          ],
        ),
      );
    }
    if (addictions.quitMarijuana == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionMarijuana,
          icon: Icons.grass,
          gradientColors: [
            const Color.fromARGB(255, 132, 230, 128),
            const Color.fromARGB(255, 30, 87, 3),
          ],
          destination: const MarijuanaPage(started: false),
          aliases: const [
            'weed',
            'cannabis',
            'pot',
            'ganja',
            'reefer',
            'mary jane',
            'bud',
            'herb',
            'dope',
            'hash',
            'thc',
            'edibles',
            'joint',
            'blunt',
          ],
        ),
      );
    }
    if (addictions.quitPouches == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionNicotinePouches,
          icon: Icons.scatter_plot,
          gradientColors: [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
          destination: const NicotinePouchesPage(started: false),
          aliases: const ['zyn', 'on!', 'nicotine pouch', 'snus', 'nicotine'],
        ),
      );
    }
    if (addictions.quitPornography == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionAdultContent,
          icon: Icons.block,
          gradientColors: [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
          destination: const PornographyPage(started: false),
          aliases: const [
            'porn',
            'pornography',
            'adult content',
            'xxx',
            'nofap',
            'adult',
          ],
        ),
      );
    }
    if (addictions.quitSmoking == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSmoking,
          icon: Icons.eco,
          gradientColors: [const Color(0xFF10B981), const Color(0xFF059669)],
          destination: const SmokingPage(started: false),
          aliases: const [
            'cigarette',
            'cigs',
            'tobacco',
            'smokes',
            'nicotine',
            'cigar',
            'pipe',
          ],
        ),
      );
    }
    if (addictions.quitSocialMedia == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSocialMedia,
          icon: Icons.public,
          gradientColors: [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
          destination: const SocialMediaPage(started: false),
          aliases: const [
            'instagram',
            'twitter',
            'tiktok',
            'facebook',
            'reddit',
            'snapchat',
            'youtube',
            'phone',
            'scrolling',
            'x',
          ],
        ),
      );
    }
    if (addictions.quitVaping == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionVaping,
          icon: Icons.air,
          gradientColors: [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
          destination: const VapingPage(started: false),
          aliases: const [
            'juul',
            'e-cig',
            'ecig',
            'e cigarette',
            'nicotine',
            'pod',
            'puff bar',
            'vape',
          ],
        ),
      );
    }

    if (addictions.quitSmokelessTobacco == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSmokelessTobacco,
          icon: Icons.grass,
          gradientColors: [const Color(0xFF78350F), const Color(0xFF451A03)],
          destination: const SmokelessTobaccoPage(started: false),
          aliases: const [
            'dip',
            'chew',
            'chewing tobacco',
            'snuff',
            'snus',
            'tobacco',
            'nicotine',
            'dipping',
          ],
        ),
      );
    }

    options.sort(
      (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
    );

    final filtered = options.where((o) => o.matches(_query)).toList();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addAddictionTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  isDense: true,
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? AppEmptyState(
                      icon: options.isEmpty
                          ? Icons.check_circle_outline_rounded
                          : Icons.search_off_rounded,
                      title: options.isEmpty
                          ? l10n.addAddictionNoneAvailable
                          : l10n.noSearchResults,
                      message: l10n.addAddictionCustomSubtitle,
                      actionLabel: l10n.homeTrackAnyway,
                      actionIcon: Icons.add_rounded,
                      onAction: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const EditEntryPage(),
                        ),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        ...filtered.map(
                          (option) => _AddictionTile(
                            option: option,
                            onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => option.destination,
                              ),
                            ),
                          ),
                        ),
                        const Divider(height: 32),
                        ListTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                          title: Text(l10n.addAddictionCustom),
                          subtitle: Text(l10n.addAddictionCustomSubtitle),
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const EditEntryPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddictionTile extends StatelessWidget {
  final _AddictionOption option;
  final VoidCallback onTap;

  const _AddictionTile({required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: option.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(option.icon, color: Colors.white, size: 24),
        ),
        title: Text(option.title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
