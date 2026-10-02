import 'package:flutter/material.dart';
import 'package:quitter/discreet.dart';
import 'package:quitter/add_addiction_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/edit_preset_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/habit_provider.dart';
import 'package:quitter/habit_section.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/quit_card.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/struggling_sheet.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/smokeless_tobacco_page.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/verse_card.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/whats_new.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _CardData {
  const _CardData({
    required this.key,
    required this.title,
    required this.icon,
    required this.gradientColors,
    this.quitDate,
    required this.onTap,
    required this.onDelete,
    required this.onRename,
  });

  final String key;
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final String? quitDate;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onRename;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _loadQuitDays();
    _whatsNew();
    WidgetsBinding.instance.addObserver(this);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _loadQuitDays();
    }
  }

  void _whatsNew() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLastVersion = prefs.get('last_build_number');
    final lastVersion = storedLastVersion is int ? storedLastVersion : 0;
    final info = await PackageInfo.fromPlatform();
    final currentVersion = int.tryParse(info.buildNumber) ?? 0;
    await prefs.setInt('last_build_number', currentVersion);
    if (lastVersion == 0) return;

    if (currentVersion > lastVersion && mounted) {
      final l10n = AppLocalizations.of(context)!;
      toast(
        l10n.newVersionToast(info.version),
        action: SnackBarAction(
          label: l10n.changesAction,
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const WhatsNew())),
        ),
      );
    }
  }

  void _loadQuitDays() async {
    final settings = context.read<SettingsProvider>();
    final addictions = context.read<AddictionProvider>();
    final habits = context.read<HabitProvider>();
    await settings.loadPreferences();
    await addictions.loadAddictions();
    await habits.loadHabits();
  }

  void _showStopTrackingBottomSheet(
    String title,
    Future<void> Function() onConfirm,
  ) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error.withAlpha(26),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 32,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.stopTrackingDialogTitle(title),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.stopTrackingDialogMessage(title),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(179),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(l10n.cancel),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await onConfirm();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(l10n.stopTracking),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _matchesSearch(String title) {
    if (_searchQuery.isEmpty) return true;
    return title.toLowerCase().contains(_searchQuery);
  }

  List<_CardData> _buildAllCards(
    BuildContext context,
    AddictionProvider addictions,
    AppLocalizations l10n,
  ) {
    final cards = <_CardData>[];
    final namer = JourneyNamer(
      l10n,
      discreet: context.watch<SettingsProvider>().discreet,
    );

    void addPreset(
      String key,
      String defaultTitle,
      IconData icon,
      List<Color> colors,
      String? quitDate,
      Widget Function(BuildContext) page,
    ) {
      if (quitDate == null) return;
      final title = namer.name(
        defaultTitle,
        customName: addictions.customNames[key],
      );
      if (!_matchesSearch(title)) return;
      final effectiveIcon = namer.icon(
        icon,
        customIcon: addictions.customIcons[key],
      );
      final customColor = addictions.customColors[key];
      final gradientColors = customColor != null
          ? [customColor, customColor.withValues(alpha: 0.7)]
          : colors;
      cards.add(
        _CardData(
          key: key,
          title: title,
          icon: effectiveIcon,
          gradientColors: gradientColors,
          quitDate: quitDate,
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(builder: page));
            if (mounted) _loadQuitDays();
          },
          onDelete: () => _showStopTrackingBottomSheet(
            title,
            () => addictions.setAddiction(key, null),
          ),
          onRename: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditPresetPage(
                  presetKey: key,
                  title: title,
                  icon: effectiveIcon,
                  color: gradientColors.first,
                ),
              ),
            );
            if (mounted) _loadQuitDays();
          },
        ),
      );
    }

    addPreset(
      'alcohol',
      l10n.addictionAlcohol,
      Icons.local_bar,
      [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
      addictions.quitAlcohol,
      (context) => const AlcoholPage(started: true),
    );
    addPreset(
      'nicotine_pouches',
      l10n.addictionNicotinePouches,
      Icons.scatter_plot,
      [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
      addictions.quitPouches,
      (context) => const NicotinePouchesPage(started: true),
    );
    addPreset(
      'pornography',
      l10n.addictionAdultContent,
      Icons.block,
      [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
      addictions.quitPornography,
      (context) => const PornographyPage(started: true),
    );
    addPreset(
      'smoking',
      l10n.addictionSmoking,
      Icons.eco,
      [const Color(0xFF10B981), const Color(0xFF059669)],
      addictions.quitSmoking,
      (context) => const SmokingPage(started: true),
    );
    addPreset(
      'smokeless_tobacco',
      l10n.addictionSmokelessTobacco,
      Icons.grass,
      [const Color(0xFF78350F), const Color(0xFF451A03)],
      addictions.quitSmokelessTobacco,
      (context) => const SmokelessTobaccoPage(started: true),
    );
    addPreset(
      'social_media',
      l10n.addictionSocialMedia,
      Icons.public,
      [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
      addictions.quitSocialMedia,
      (context) => const SocialMediaPage(started: true),
    );
    addPreset(
      'vaping',
      l10n.addictionVaping,
      Icons.air,
      [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
      addictions.quitVaping,
      (context) => const VapingPage(started: true),
    );

    for (final Entry entry in addictions.entries) {
      if (!_matchesSearch(entry.title)) continue;
      cards.add(
        _CardData(
          key: entry.id,
          title: entry.title,
          icon: entry.icon ?? Icons.star,
          gradientColors: [entry.color, entry.color.withValues(alpha: 0.7)],
          quitDate: entry.quitDate.toIso8601String(),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EntryPage(entry: entry)),
            );
            if (mounted) _loadQuitDays();
          },
          onDelete: () => _showStopTrackingBottomSheet(
            entry.title,
            () => addictions.deleteEntry(entry.id),
          ),
          onRename: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditEntryPage(entry: entry),
              ),
            );
            if (mounted) _loadQuitDays();
          },
        ),
      );
    }

    return cards;
  }

  List<_CardData> _sortByOrder(List<_CardData> cards, List<String> order) {
    if (order.isEmpty) return cards;
    final indexMap = {for (var i = 0; i < order.length; i++) order[i]: i};
    return [...cards]..sort((a, b) {
      final ai = indexMap[a.key] ?? cards.length;
      final bi = indexMap[b.key] ?? cards.length;
      return ai.compareTo(bi);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PopScope(
      canPop: !_isEditMode,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_isEditMode) setState(() => _isEditMode = false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              primary: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 64,
              flexibleSpace: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                alignment: Alignment.topCenter,
                child: SearchBar(
                  controller: _searchController,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(Icons.search),
                  ),
                  hintText: l10n.homeSearchHint,
                  trailing: [
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_searchQuery.isEmpty)
              const SliverPadding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(child: VerseOfTheDayCard()),
              ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              sliver: SliverToBoxAdapter(
                child: HabitSection(searchQuery: _searchQuery),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 0,
                bottom: 56 + MediaQuery.of(context).padding.bottom,
              ),
              sliver: Consumer<AddictionProvider>(
                builder: (context, addictions, child) {
                  final allCards = _buildAllCards(context, addictions, l10n);
                  final cards = _sortByOrder(allCards, addictions.cardOrder);

                  if (cards.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _searchQuery.isNotEmpty
                                  ? Icons.search_off
                                  : Icons.track_changes,
                              size: 64,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(128),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _searchQuery.isNotEmpty
                                  ? l10n.noSearchResults
                                  : l10n.homeEmptyTitle,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withAlpha(128),
                                  ),
                            ),
                            if (_searchQuery.isEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                l10n.homeEmptySubtitle,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withAlpha(102),
                                    ),
                              ),
                            ],
                            if (_searchQuery.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              FilledButton.icon(
                                onPressed: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddAddictionPage(
                                        initialQuery: _searchQuery,
                                      ),
                                    ),
                                  );
                                  _loadQuitDays();
                                },
                                icon: const Icon(Icons.add),
                                label: Text(l10n.homeTrackAnyway),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final columnCount =
                            MediaQuery.of(context).size.width > 600 ? 3 : 2;
                        const spacing = 16.0;
                        final cardWidth =
                            (constraints.maxWidth -
                                spacing * (columnCount - 1)) /
                            columnCount;
                        // 216dp fits QuitCard: icon(48) + gaps + titleMedium(24) +
                        // headlineSmall(32) + date-chip(24) + 40dp padding = 204dp.
                        // Extra 12dp gives breathing room for varying font metrics.
                        const cardHeight = 216.0;

                        return ReorderableGridView.count(
                          crossAxisCount: columnCount,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          childAspectRatio: cardWidth / cardHeight,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          dragEnabled: _searchQuery.isEmpty,
                          onDragStart: (_) {
                            setState(() => _isEditMode = true);
                          },
                          onReorder: (oldIndex, newIndex) {
                            if (_searchQuery.isNotEmpty) return;
                            final newOrder = cards.map((c) => c.key).toList();
                            final item = newOrder.removeAt(oldIndex);
                            newOrder.insert(newIndex, item);
                            addictions.saveCardOrder(newOrder);
                          },
                          children: cards.map((data) {
                            return SizedBox(
                              key: ValueKey(data.key),
                              child: QuitCard(
                                context: context,
                                title: data.title,
                                heroTag: data.key,
                                icon: data.icon,
                                gradientColors: data.gradientColors,
                                quitDate: data.quitDate,
                                onTap: _isEditMode
                                    ? () => setState(() => _isEditMode = false)
                                    : data.onTap,
                                onDelete: _isEditMode ? data.onDelete : null,
                                onRename: _isEditMode ? data.onRename : null,
                                onStruggling:
                                    _isEditMode || data.quitDate == null
                                    ? null
                                    : () => showStrugglingSheet(context),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: _isEditMode
            ? FloatingActionButton.extended(
                onPressed: () => setState(() => _isEditMode = false),
                label: Text(l10n.done),
                icon: const Icon(Icons.check),
              )
            : FloatingActionButton.extended(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AddAddictionPage(initialQuery: _searchQuery),
                    ),
                  );
                  _loadQuitDays();
                },
                label: Text(l10n.homeAddButton),
                icon: const Icon(Icons.add),
                tooltip: l10n.homeAddTooltip,
              ),
      ),
    );
  }

  bool isNewerVersion(String lastVersion, currentVersion) {
    final lastParts = lastVersion.split('.').map(int.parse).toList();
    final currentParts = currentVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      if (currentParts[i] > lastParts[i]) return true;
      if (currentParts[i] < lastParts[i]) return false;
    }
    return false;
  }
}
