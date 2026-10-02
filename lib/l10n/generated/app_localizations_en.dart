// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get addictionSyntheticCannabinoids => 'Synthetic Cannabinoids';

  @override
  String get appTitle => 'Spirit';

  @override
  String get start => 'Start';

  @override
  String get tabQuitter => 'Spirit';

  @override
  String get showAllItems => 'Show all items';

  @override
  String get showAllSubtitle => 'Enable or disable all main screen items';

  @override
  String get enableNotifications => 'Enable all notifications';

  @override
  String get enableNotificationsSubtitle => 'Turn on or off all notifications';

  @override
  String get tabJournal => 'Journal';

  @override
  String get tabStats => 'Stats';

  @override
  String get statsTitle => 'Recovery Stats';

  @override
  String get statsNoAddictions => 'Start tracking addictions to see your stats';

  @override
  String get statsJourneyTitle => 'Your Journey';

  @override
  String statsTotalDays(int days) {
    return '$days total days';
  }

  @override
  String statsAddictionsTracked(int count) {
    return '$count tracked';
  }

  @override
  String get statsMoneySavedTitle => 'Money Saved';

  @override
  String get statsMoneySavedEstimate => 'Estimated based on average usage';

  @override
  String statsEquivalentCoffees(int count) {
    return 'That\'s about $count coffees';
  }

  @override
  String statsEquivalentMeals(int count) {
    return 'That\'s about $count restaurant meals';
  }

  @override
  String get statsEquivalentFlight => 'That\'s a flight somewhere new';

  @override
  String get statsEquivalentVacation => 'That\'s a vacation abroad';

  @override
  String get statsTimeSavedTitle => 'Time Reclaimed';

  @override
  String statsHoursSaved(int hours) {
    return '$hours hours';
  }

  @override
  String statsEquivalentBooks(int count) {
    return 'Enough to read about $count books';
  }

  @override
  String statsEquivalentMovies(int count) {
    return 'Enough to watch about $count movies';
  }

  @override
  String get statsStreaksTitle => 'Your Streaks';

  @override
  String statsDaysSuffix(int days) {
    return '${days}d';
  }

  @override
  String statsDayUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return '$_temp0';
  }

  @override
  String statsHoursSuffix(int hours) {
    return '${hours}h';
  }

  @override
  String get statsResilienceTitle => 'Resilience';

  @override
  String statsTimesBouncedBack(int count) {
    return '$count times you\'ve reset and kept going';
  }

  @override
  String statsDaysBeforeRelapse(int days) {
    return '$days days of progress each time';
  }

  @override
  String get tabSettings => 'Settings';

  @override
  String get homeAddButton => 'Add';

  @override
  String get homeAddTooltip => 'Create your own custom addiction to quit';

  @override
  String get quitStartButton => 'Start';

  @override
  String get quitCardSubtitle => 'Tap to start';

  @override
  String quitCardKeepDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: ' days',
      one: ' day',
    );
    return '$_temp0';
  }

  @override
  String newVersionToast(String version) {
    return 'New version $version';
  }

  @override
  String get changesAction => 'Changes';

  @override
  String hideDialogTitle(String title) {
    return 'Hide $title?';
  }

  @override
  String hideDialogMessage(String title) {
    return 'This will hide the $title option from your home screen. You can show it again in Settings.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get hide => 'Hide';

  @override
  String stopTrackingDialogTitle(String title) {
    return 'Stop tracking $title?';
  }

  @override
  String stopTrackingDialogMessage(String title) {
    return 'This will remove $title from your home screen. Your milestone history will be preserved.';
  }

  @override
  String get stopTracking => 'Remove';

  @override
  String get addAddictionTitle => 'Track an Addiction';

  @override
  String get addAddictionCustom => 'Custom';

  @override
  String get addAddictionCustomSubtitle => 'Track anything you want to quit';

  @override
  String get homeEmptyTitle => 'Nothing tracked yet';

  @override
  String get homeEmptySubtitle => 'Tap + to start tracking an addiction';

  @override
  String get addAddictionNoneAvailable =>
      'All available addictions are already being tracked';

  @override
  String get addictionAlcohol => 'Alcohol';

  @override
  String get addictionVaping => 'Vaping';

  @override
  String get addictionSmoking => 'Smoking';

  @override
  String get addictionMarijuana => 'Marijuana';

  @override
  String get addictionNicotinePouches => 'Nicotine pouches';

  @override
  String get addictionSmokelessTobacco => 'Dip / Chewing Tobacco';

  @override
  String get smokelessTobaccoPageTitle => 'Tobacco-Free';

  @override
  String get smokelessTobaccoHeaderStarted => 'Nicotine-free journey';

  @override
  String get smokelessTobaccoHeaderNotStarted => 'Quit dip & chewing tobacco';

  @override
  String get smokelessTobaccoSubtitleStarted =>
      'Track your progress and celebrate each milestone';

  @override
  String get smokelessTobaccoSubtitleNotStarted =>
      'See what happens when you quit';

  @override
  String get addictionSocialMedia => 'Social Media';

  @override
  String get addictionAdultContent => 'Adult Content';

  @override
  String get search => 'Search...';

  @override
  String get noSearchResults => 'No results found';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get homeSearchHint => 'Search';

  @override
  String get homeTrackAnyway => 'Track it anyway';

  @override
  String get iconSearchHint => 'Search icons...';

  @override
  String get iconNoResults => 'No icons found';

  @override
  String get milestoneOpenOriginalSource => 'Open Original Source';

  @override
  String get settingsExportSaveDialog => 'Save data to';

  @override
  String get settingsSearchHint => 'Search settings...';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionSecurity => 'Security';

  @override
  String get settingsSectionMainScreenItems => 'Main Screen Items';

  @override
  String get settingsSectionNotifications => 'Notifications';

  @override
  String get settingsSectionSystem => 'System';

  @override
  String get settingsPinLock => 'PIN lock';

  @override
  String get settingsPinLockSubtitle => 'Require PIN to open app';

  @override
  String get settingsPinTimeout => 'PIN timeout (seconds)';

  @override
  String get settingsPinTimeoutHint => '15';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsColorScheme => 'Color scheme';

  @override
  String get settingsDynamicColorScheme => 'Dynamic colors';

  @override
  String get settingsBlueColorScheme => 'Blue';

  @override
  String get settingsGreenColorScheme => 'Green';

  @override
  String get settingsRedColorScheme => 'Red';

  @override
  String get settingsPurpleColorScheme => 'Purple';

  @override
  String get settingsOrangeColorScheme => 'Orange';

  @override
  String get settingsResetButtons => 'Reset buttons';

  @override
  String get settingsResetButtonsSubtitle => 'Show reset buttons on quit pages';

  @override
  String get settingsShowJournal => 'Show journal';

  @override
  String get settingsShowJournalSubtitle =>
      'Enable the journal tab for logging your thoughts';

  @override
  String get settingsWeekStartsMonday => 'Week starts on Monday';

  @override
  String get settingsWeekStartsMondaySubtitle =>
      'Calendar week begins on Monday instead of Sunday';

  @override
  String get settingsSwipeBetweenTabs => 'Swipe between tabs';

  @override
  String get settingsSwipeBetweenTabsSubtitle =>
      'Dragging your finger moves between Journal, Homepage & Settings';

  @override
  String get settingsShowAlcoholTracking => 'Show alcohol tracking';

  @override
  String get settingsShowVapingTracking => 'Show vaping tracking';

  @override
  String get settingsShowSmokingTracking => 'Show smoking tracking';

  @override
  String get settingsShowNicotinePouchesTracking =>
      'Show nicotine pouches tracking';

  @override
  String get settingsShowSocialMediaTracking => 'Show social media tracking';

  @override
  String get settingsShowAdultContentTracking => 'Show adult content tracking';

  @override
  String get settingsNotificationFrequency => 'Notification frequency';

  @override
  String settingsNotificationFrequencySubtitle(int days, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return 'Every $_temp0 at $time';
  }

  @override
  String get settingsNotifyAlcohol => 'Notify alcohol quitting progress';

  @override
  String get settingsNotifyVaping => 'Notify vaping quitting progress';

  @override
  String get settingsNotifySmoking => 'Notify smoking quitting progress';

  @override
  String get settingsNotifyMarijuana => 'Notify marijuana quitting progress';

  @override
  String get settingsNotifyNicotinePouches =>
      'Notify nicotine pouches quitting progress';

  @override
  String get settingsNotifySocialMedia =>
      'Notify social media quitting progress';

  @override
  String get settingsNotifyAdultContent =>
      'Notify adult content quitting progress';

  @override
  String settingsNotifyCustomEntry(String name) {
    return 'Notify $name quitting progress';
  }

  @override
  String get settingsResetMessages => 'Reset messages';

  @override
  String get settingsResetMessagesSubtitle =>
      'Show positive reinforcement after relapses';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsWhatsNew => 'What\'s new';

  @override
  String get settingsEnjoyingApp => 'Enjoying the app?';

  @override
  String get settingsReportBug => 'Report a bug';

  @override
  String get settingsExportData => 'Export data';

  @override
  String get settingsImportData => 'Import data';

  @override
  String get settingsDeleteEverything => 'Delete everything';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get themePureBlack => 'Pure black';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get pinDialogSetTitle => 'Set PIN';

  @override
  String get pinDialogEnterPIN => 'Enter PIN';

  @override
  String get pinDialogConfirmPIN => 'Confirm PIN';

  @override
  String get pinDialogSet => 'Set';

  @override
  String get pinDialogPINsDoNotMatch => 'PINs do not match';

  @override
  String get pinDialogPIN => 'PIN';

  @override
  String get pinDialogOK => 'OK';

  @override
  String get notificationFrequencyDialogTitle => 'Notification frequency';

  @override
  String get notificationFrequencyNotifyEvery => 'Notify every';

  @override
  String get notificationFrequencyDays => 'day(s)';

  @override
  String get notificationFrequencyAt => 'At';

  @override
  String get notificationFrequencySave => 'Save';

  @override
  String get notificationTestTitle => 'Positive affirmation';

  @override
  String notificationTestBody(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return 'You will see a notification like this every $_temp0 congratulating you on your progress!';
  }

  @override
  String get deleteEverythingDialogTitle => 'Delete everything';

  @override
  String get deleteEverythingDialogMessage =>
      'Are you sure you delete everything? This action cannot be undone.';

  @override
  String get deleteEverythingConfirm => 'DELETE!';

  @override
  String get dataExported => 'Data exported!';

  @override
  String get dataImported => 'Data imported successfully!';

  @override
  String get dataImportFailed => 'Import failed';

  @override
  String get dataImportFailedMessage =>
      'The selected file could not be imported. Check that it is a valid Quitter backup and try again.';

  @override
  String get journalHowWasYourDay => 'How was your day?';

  @override
  String get journalPlaceholder =>
      'Write about your day, thoughts, feelings, or anything you want to remember...';

  @override
  String journalWordCount(int count) {
    return '$count words';
  }

  @override
  String get journalPreviousMonth => 'Previous Month';

  @override
  String get journalNextMonth => 'Next Month';

  @override
  String get quitMilestonesStart => 'Start';

  @override
  String get quitMilestonesReset => 'Reset';

  @override
  String get quitMilestonesQuitDate => 'Quit date';

  @override
  String quitMilestonesClearTitle(int days) {
    return 'Clear milestone for $days days?';
  }

  @override
  String quitMilestonesClearMessage(int days) {
    return 'This will clear all past times you achieved the $days day milestone.';
  }

  @override
  String get quitMilestonesClear => 'Clear';

  @override
  String quitMilestonesShareMessage(int days, String title) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return 'I\'m $_temp0 clean from $title!';
  }

  @override
  String timelineMilestoneDay(int days) {
    return 'Day $days';
  }

  @override
  String timelineMilestoneYears(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years Years',
      one: '$years Year',
    );
    return '$_temp0';
  }

  @override
  String get entryPageHeaderStarted => 'One step stronger';

  @override
  String get entryPageHeaderNotStarted => 'Not started';

  @override
  String get entryPageSubtitleStarted => 'You are doing great!';

  @override
  String get entryPageSubtitleNotStarted =>
      'Tap \"Start\" to begin your journey';

  @override
  String get editEntryAddTitle => 'Add entry';

  @override
  String get editEntryEditTitle => 'Edit entry';

  @override
  String get editEntryTitle => 'Title';

  @override
  String get editEntryTitleError => 'Please enter a title';

  @override
  String get editEntryColor => 'Color';

  @override
  String get editEntryIcon => 'Icon';

  @override
  String get editEntrySave => 'Save';

  @override
  String get editEntryDeleteDialogTitle => 'Are you sure?';

  @override
  String get editEntryDeleteDialogMessage =>
      'Do you really want to delete this entry?';

  @override
  String get editEntryDeleteNo => 'No';

  @override
  String get editEntryDeleteYes => 'Yes';

  @override
  String get pinPageEnterPIN => 'Enter PIN';

  @override
  String get pinPageIncorrectPIN => 'Incorrect PIN';

  @override
  String pinPageTooManyAttempts(int seconds) {
    return 'Too many attempts. Try again in ${seconds}s.';
  }

  @override
  String get aboutPageTitle => 'About';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutAuthor => 'Author';

  @override
  String get aboutAuthorName => 'Brandon Dick';

  @override
  String get aboutLicense => 'License';

  @override
  String get aboutLicenseMIT => 'MIT';

  @override
  String get aboutDonate => 'Donate';

  @override
  String get aboutDonateSubtitle => 'Help support this project';

  @override
  String get aboutSourceCode => 'Source code';

  @override
  String get whatsNewTitle => 'What\'s new?';

  @override
  String get whatsNewSearchHint => 'Search...';

  @override
  String get whatsNewEnjoyingButton => 'Enjoying the app?';

  @override
  String get enjoyingPageTitle => 'Enjoying the app?';

  @override
  String get enjoyingLeaveReview => 'Leave a review';

  @override
  String get enjoyingLeaveReviewSubtitle => 'Let me know what you think!';

  @override
  String get enjoyingGiveStar => 'Give us a star';

  @override
  String get enjoyingGiveStarSubtitle => 'Show your support on GitHub';

  @override
  String get enjoyingDonate => 'Donate';

  @override
  String get enjoyingDonateSubtitle => 'Support development';

  @override
  String get alcoholPageTitle => 'Sober & sparkling';

  @override
  String alcoholPageQuitDateDisplay(DateTime quitDate, int days) {
    final intl.DateFormat quitDateDateFormat = intl.DateFormat.yMMMd(
      localeName,
    );
    final String quitDateString = quitDateDateFormat.format(quitDate);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    return '$quitDateString ($_temp0)';
  }

  @override
  String get alcoholHeaderStarted => 'Cheers to you!';

  @override
  String get alcoholHeaderNotStarted => 'Sober journey ahead!';

  @override
  String get alcoholSubtitleStarted => 'Every day is a win 🥳';

  @override
  String get alcoholSubtitleNotStarted => 'Ready for a brighter you? ✨';

  @override
  String get vapingPageTitle => 'Vape-free victory';

  @override
  String get vapingHeaderStarted => 'Clear skies ahead!';

  @override
  String get vapingHeaderNotStarted => 'Vape-free living!';

  @override
  String get vapingSubtitleStarted => 'Breathing easy, living free 🌬️';

  @override
  String get vapingSubtitleNotStarted => 'Ready to ditch the vape? ✨';

  @override
  String get smokingPageTitle => 'Smoke-free & soaring';

  @override
  String get smokingHeaderStarted => 'Breathe easy!';

  @override
  String get smokingHeaderNotStarted => 'Smoke-free journey!';

  @override
  String get smokingSubtitleStarted => 'Every puff-free day is a win 🚭';

  @override
  String get smokingSubtitleNotStarted => 'Ready to reclaim your health? ✨';

  @override
  String get marijuanaPageTitle => 'Cannabis-free journey';

  @override
  String get marijuanaHeaderStarted => 'Clear mind rising!';

  @override
  String get marijuanaHeaderNotStarted => 'Cannabis-free living!';

  @override
  String get marijuanaSubtitleStarted =>
      'Building mental clarity, one day at a time 🧠';

  @override
  String get marijuanaSubtitleNotStarted => 'Ready for a clearer tomorrow? 🌱';

  @override
  String get nicotinePouchesPageTitle => 'Pouch-free Power';

  @override
  String get nicotinePouchesHeaderStarted => 'Fresh & free!';

  @override
  String get nicotinePouchesHeaderNotStarted => 'Pouch-free progress!';

  @override
  String get nicotinePouchesSubtitleStarted =>
      'Embrace a brighter, healthier you ✨';

  @override
  String get nicotinePouchesSubtitleNotStarted =>
      'Ready to ditch the pouches? 🚀';

  @override
  String get socialMediaPageTitle => 'Digital detox delight';

  @override
  String get socialMediaHeaderStarted => 'Unplug & play!';

  @override
  String get socialMediaHeaderNotStarted => 'Digital detox journey!';

  @override
  String get socialMediaSubtitleStarted => 'Real life is the best feed 💖';

  @override
  String get socialMediaSubtitleNotStarted => 'Ready to reclaim your time? 🚀';

  @override
  String get pornographyPageTitle => 'Pornography Recovery';

  @override
  String get pornographyHeaderStarted => 'Building lasting control';

  @override
  String get pornographyHeaderNotStarted =>
      'Change problematic pornography use';

  @override
  String get pornographySubtitleStarted =>
      'Track triggers, control, and evidence-based milestones';

  @override
  String get pornographySubtitleNotStarted =>
      'See what research supports and measure your own progress';

  @override
  String get relapseMessage1 =>
      'Recovery isn\'t linear. Every step forward matters, including this one.';

  @override
  String get relapseMessage2 =>
      'You\'re here, you\'re trying, and that takes real courage.';

  @override
  String get relapseMessage3 =>
      'Setbacks don\'t erase your progress. You\'re learning and growing.';

  @override
  String get relapseMessage4 =>
      'Each restart is proof of your strength, not a sign of weakness.';

  @override
  String get relapseMessage5 => 'Tomorrow is a fresh start. You\'ve got this.';

  @override
  String get relapseMessage6 =>
      'Your worth isn\'t defined by perfect streaks. You matter.';

  @override
  String get relapseMessage7 =>
      'Recovery is a journey with hills and valleys. Keep walking.';

  @override
  String get relapseMessage8 =>
      'You had the strength to start before, and you have it again now.';

  @override
  String get relapseMessage9 =>
      'One moment doesn\'t define your entire journey forward.';

  @override
  String get relapseMessage10 =>
      'Being here shows you haven\'t given up. That\'s powerful.';

  @override
  String get relapseMessage11 =>
      'Progress isn\'t about perfection—it\'s about persistence.';

  @override
  String get relapseMessage12 =>
      'You\'re building resilience with every attempt. Keep building.';

  @override
  String get relapseMessage13 =>
      'Your commitment to trying again is already a victory.';

  @override
  String get relapseMessage14 =>
      'Healing isn\'t instant, but it\'s happening with each choice you make.';

  @override
  String get relapseMessage15 =>
      'You\'re not starting over—you\'re continuing with more wisdom.';

  @override
  String get relapseMessage16 =>
      'Every expert was once a beginner. Every pro was once an amateur.';

  @override
  String get relapseMessage17 =>
      'Recovery happens one day at a time, sometimes one hour at a time.';

  @override
  String get relapseMessage18 =>
      'You\'re writing a comeback story. This is just one chapter.';

  @override
  String get relapseMessage19 =>
      'The fact that you\'re here means you care about yourself. Hold onto that.';

  @override
  String get relapseMessage20 =>
      'Small steps in the right direction are still steps forward.';

  @override
  String get undo => 'Undo';

  @override
  String get ok => 'OK';

  @override
  String get alcoholMilestone1Title => 'Sleep Quality Begins to Improve';

  @override
  String get alcoholMilestone1Description =>
      'Your REM sleep cycles start to normalize within the first day. While alcohol might help you fall asleep initially, it disrupts deep sleep and REM cycles throughout the night, causing fragmented sleep.';

  @override
  String get alcoholMilestone3Title => 'Hydration Levels Restore';

  @override
  String get alcoholMilestone3Description =>
      'Your kidneys are recovering from alcohol\'s diuretic effects. Alcohol suppresses antidiuretic hormone, leading to increased urination and dehydration. By day 3, your body\'s fluid balance is improving significantly.';

  @override
  String get alcoholMilestone7Title => 'Immune System Strengthens';

  @override
  String get alcoholMilestone7Description =>
      'Your white blood cells are recovering their function. Even a single bout of heavy drinking can impair immune function for up to 24 hours, and chronic drinking significantly weakens your body\'s ability to fight infections.';

  @override
  String get alcoholMilestone14Title => 'Brain Volume Recovery Begins';

  @override
  String get alcoholMilestone14Description =>
      'Brain volume begins recovering within the first two weeks. Thinking and memory keep improving over the following months.';

  @override
  String get alcoholMilestone30Title => 'Blood Pressure Normalizes';

  @override
  String get alcoholMilestone30Description =>
      'Your cardiovascular system shows significant improvement. Regular alcohol consumption elevates blood pressure, but abstinence for about a month can help bring blood pressure back to healthier levels.';

  @override
  String get alcoholMilestone60Title => 'Liver Function Improves';

  @override
  String get alcoholMilestone60Description =>
      'Your liver shows measurable improvement in function. This regenerative organ can recover significantly from alcohol-induced damage, with liver enzymes and fat accumulation showing improvement within 2 months of abstinence.';

  @override
  String get alcoholMilestone90Title =>
      'Thinking and Memory Improve Substantially';

  @override
  String get alcoholMilestone90Description =>
      'The first three months bring major gains in memory, concentration, and decision-making, with recovery continuing across the following months.';

  @override
  String get alcoholMilestone180Title =>
      'Brain Volume and Function Continue Recovery';

  @override
  String get alcoholMilestone180Description =>
      'Six months sober gives the brain sustained time to recover. Brain volume and thinking skills continue to improve.';

  @override
  String get alcoholMilestone365Title => 'Cancer Risk Reduction May Begin';

  @override
  String get alcoholMilestone365Description =>
      'One year of abstinence may begin to reduce cancer risk. While alcohol clearly increases risk for several cancers (liver, breast, colorectal, esophageal), research on risk reduction timeline is still emerging and varies by cancer type.';

  @override
  String get smokingMilestone1Title => 'Carbon Monoxide Clears';

  @override
  String get smokingMilestone1Description =>
      'Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn\'t have to work overtime anymore to pump poisoned blood around your body.';

  @override
  String get smokingMilestone3Title => 'Nicotine Withdrawal Peaks';

  @override
  String get smokingMilestone3Description =>
      'The nicotine monster is at its angriest, but you\'re winning the battle! All nicotine has left your system. The worst cravings happen now, but they\'re also your ticket to freedom on the other side.';

  @override
  String get smokingMilestone7Title => 'Taste & Smell Dramatically Improve';

  @override
  String get smokingMilestone7Description =>
      'Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you\'re rediscovering flavors you forgot existed. Prepare for some serious food appreciation!';

  @override
  String get smokingMilestone14Title => 'Circulation & Walking Improve';

  @override
  String get smokingMilestone14Description =>
      'Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren\'t looking so intimidating anymore, are they?';

  @override
  String get smokingMilestone30Title => 'Lung Function Increases';

  @override
  String get smokingMilestone30Description =>
      'Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases significantly, and that smoker\'s cough is history.';

  @override
  String get smokingMilestone90Title => 'Heart Attack Risk Drops Significantly';

  @override
  String get smokingMilestone90Description =>
      'Your heart is sending love letters! Three months smoke-free and your cardiovascular risk has already dropped substantially. Your cardiovascular system is healing faster than you might think possible.';

  @override
  String get smokingMilestone180Title => 'Immune System Strengthens';

  @override
  String get smokingMilestone180Description =>
      'Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.';

  @override
  String get smokingMilestone365Title => 'Stroke Risk Reduces Significantly';

  @override
  String get smokingMilestone365Description =>
      'One full year of freedom! Your stroke risk has decreased substantially, and your blood vessels are healing beautifully. You\'ve officially given your brain the gift of better circulation and protection.';

  @override
  String get smokingMilestone1825Title => 'Cancer Risk Plummets (5 Years)';

  @override
  String get smokingMilestone1825Description =>
      'Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.';

  @override
  String get vapingMilestone1Title => 'Nicotine Cravings Peak';

  @override
  String get vapingMilestone1Description =>
      'Your brain is throwing a nicotine tantrum, but you\'re already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they\'re also the most important to push through.';

  @override
  String get vapingMilestone3Title => 'Breathing Improves';

  @override
  String get vapingMilestone3Description =>
      'Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.';

  @override
  String get vapingMilestone7Title => 'Taste & Smell Return';

  @override
  String get vapingMilestone7Description =>
      'Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.';

  @override
  String get vapingMilestone14Title => 'Circulation Improves';

  @override
  String get vapingMilestone14Description =>
      'Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!';

  @override
  String get vapingMilestone30Title => 'Lung Function Recovery';

  @override
  String get vapingMilestone30Description =>
      'Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!';

  @override
  String get vapingMilestone60Title => 'Anxiety Levels Normalize';

  @override
  String get vapingMilestone60Description =>
      'Plot twist: vaping was making anxiety worse, not better! Two months in, your usual anxiety level is lower and your nervous system is settling.';

  @override
  String get vapingMilestone90Title => 'Focus and Memory Sharpen';

  @override
  String get vapingMilestone90Description =>
      'Brain fog has left the building! Three months without nicotine and your focus, memory, and clear thinking are markedly better. It\'s like upgrading your mental RAM.';

  @override
  String get vapingMilestone180Title => 'Oral Health Recovery';

  @override
  String get vapingMilestone180Description =>
      'Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.';

  @override
  String get vapingMilestone365Title => 'Cardiovascular Risk Reduction';

  @override
  String get vapingMilestone365Description =>
      'Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine\'s daily assault course.';

  @override
  String get marijuanaMilestone1Title => 'Withdrawal Symptoms Begin';

  @override
  String get marijuanaMilestone1Description =>
      'Your brain is adjusting to life without THC! Within 24-48 hours, you might experience irritability, anxiety, or sleep difficulties. This is completely normal - your cannabinoid receptors are starting to reset.';

  @override
  String get marijuanaMilestone3Title => 'Physical Symptoms Peak';

  @override
  String get marijuanaMilestone3Description =>
      'You\'re at the toughest point, but it\'s all uphill from here! Days 2-6 typically see peak withdrawal symptoms including headaches, sweating, and mood changes. Your body is working hard to rebalance itself.';

  @override
  String get marijuanaMilestone7Title => 'Sleep Patterns Improve';

  @override
  String get marijuanaMilestone7Description =>
      'Sweet dreams are making a comeback! After a week without cannabis, your natural sleep architecture begins to normalize. REM sleep rebounds, leading to more vivid dreams and better rest quality.';

  @override
  String get marijuanaMilestone14Title => 'Acute Withdrawal Ends';

  @override
  String get marijuanaMilestone14Description =>
      'The storm has passed! Most physical withdrawal symptoms significantly decrease after two weeks. Your mood is stabilizing and daily functioning becomes much easier. The hardest part is behind you.';

  @override
  String get marijuanaMilestone30Title => 'Memory Function Improves';

  @override
  String get marijuanaMilestone30Description =>
      'Your brain fog is clearing! Research shows that verbal learning and memory begin improving significantly after stopping cannabis use. The hippocampus, crucial for memory formation, starts functioning better.';

  @override
  String get marijuanaMilestone60Title => 'Concentration Sharpens';

  @override
  String get marijuanaMilestone60Description =>
      'Focus mode: activated! Two months without cannabis and your ability to concentrate and maintain attention shows marked improvement. Work tasks and studying become noticeably easier to manage.';

  @override
  String get marijuanaMilestone90Title => 'Mood Stability Returns';

  @override
  String get marijuanaMilestone90Description =>
      'Three months without cannabis brings steadier mood, less anxiety, and better stress control. Your emotional state is settling into a healthier normal.';

  @override
  String get marijuanaMilestone180Title =>
      'Planning and Decision-Making Recover';

  @override
  String get marijuanaMilestone180Description =>
      'Your mental CEO is back in charge! Six months without cannabis brings major gains in planning, decision-making, and problem-solving.';

  @override
  String get marijuanaMilestone365Title => 'Brain Structure Restoration';

  @override
  String get marijuanaMilestone365Description =>
      'One year without cannabis gives memory-related brain areas substantial time to recover. Learning and memory improvements are now part of your new normal.';

  @override
  String get socialMediaMilestone1Title => 'Digital Detox Day One! 🎯';

  @override
  String get socialMediaMilestone1Description =>
      'You\'ve officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you\'re already breaking the cycle - go you!';

  @override
  String get socialMediaMilestone3Title => 'FOMO? More Like FO-NO! 😎';

  @override
  String get socialMediaMilestone3Description =>
      'Three days in and those anxious \'what am I missing?\' thoughts are already fading. You\'re training your brain that real life is way more interesting than curated feeds!';

  @override
  String get socialMediaMilestone7Title =>
      'Attention Span: Goldfish → Human 🧠';

  @override
  String get socialMediaMilestone7Description =>
      'Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you\'re teaching yours to find rewards elsewhere!';

  @override
  String get socialMediaMilestone14Title =>
      'Sleep Like a Baby (Not a Zombie) 😴';

  @override
  String get socialMediaMilestone14Description =>
      'Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.';

  @override
  String get socialMediaMilestone30Title => 'Real Friends > Fake Likes 💝';

  @override
  String get socialMediaMilestone30Description =>
      'One month offline = significant reductions in loneliness and depression! Research proves that limiting social media creates major mental health improvements. You\'ve gone even further!';

  @override
  String get socialMediaMilestone60Title => 'Comparison Trap: ESCAPED! ✨';

  @override
  String get socialMediaMilestone60Description =>
      'Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You\'ve broken free from the comparison trap!';

  @override
  String get socialMediaMilestone90Title => 'Hobby Collector Level: Expert 🎨';

  @override
  String get socialMediaMilestone90Description =>
      'Three months = roughly 270+ hours reclaimed! That\'s enough time to learn a skill, read 15+ books, or get deep into a hobby. Your brain strengthens the habits you repeat, so those offline routines are becoming easier and more automatic.';

  @override
  String get socialMediaMilestone180Title =>
      'Mental Health Glow-Up Complete 🌟';

  @override
  String get socialMediaMilestone180Description =>
      'Six months offline and you\'re officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You\'re living proof that life\'s better in the real world!';

  @override
  String get socialMediaMilestone365Title => 'Digital Zen Master Achieved 🏆';

  @override
  String get socialMediaMilestone365Description =>
      'One full year of intentional living! You\'ve reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren\'t meant for sharing - they\'re meant for experiencing. You\'re officially a digital wellness legend!';

  @override
  String get nicotinePouchesMilestone1Title => 'Taste & Smell Begin Recovery';

  @override
  String get nicotinePouchesMilestone1Description =>
      'Nicotine dulls your taste buds and smell receptors. After just 24 hours without pouches, these senses start their comeback tour! Food is about to taste amazing again.';

  @override
  String get nicotinePouchesMilestone3Title => 'Nicotine Completely Cleared';

  @override
  String get nicotinePouchesMilestone3Description =>
      'Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.';

  @override
  String get nicotinePouchesMilestone7Title => 'Oral Health Improves';

  @override
  String get nicotinePouchesMilestone7Description =>
      'Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.';

  @override
  String get nicotinePouchesMilestone14Title => 'Circulation Enhancement';

  @override
  String get nicotinePouchesMilestone14Description =>
      'Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!';

  @override
  String get nicotinePouchesMilestone30Title => 'Stress Response Normalizes';

  @override
  String get nicotinePouchesMilestone30Description =>
      'Plot twist: nicotine actually increases stress between uses! Your cortisol and stress response are returning to normal. Real relaxation, not the nicotine fake-out.';

  @override
  String get nicotinePouchesMilestone60Title => 'Sleep Quality Improves';

  @override
  String get nicotinePouchesMilestone60Description =>
      'Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.';

  @override
  String get nicotinePouchesMilestone90Title => 'Dopamine Receptors Recover';

  @override
  String get nicotinePouchesMilestone90Description =>
      'Your brain\'s reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life\'s natural joys are vibrant again.';

  @override
  String get nicotinePouchesMilestone180Title => 'Cardiovascular Risk Drops';

  @override
  String get nicotinePouchesMilestone180Description =>
      'Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.';

  @override
  String get nicotinePouchesMilestone365Title => 'Long-term Health Secured';

  @override
  String get nicotinePouchesMilestone365Description =>
      'One year of freedom! Your risk of nicotine-related health issues continues to plummet. You\'ve broken the addiction cycle and reclaimed your autonomy. That\'s genuinely heroic! 🏆';

  @override
  String get pornographyMilestone1Title => 'Taking Back Control';

  @override
  String get pornographyMilestone1Description =>
      'Problematic pornography use is defined by impaired control and resulting distress or impairment. One day matters because you have already interrupted the old pattern once and started identifying what triggers it.';

  @override
  String get pornographyMilestone3Title => 'Know Your Urges';

  @override
  String get pornographyMilestone3Description =>
      'People with more severe problematic use commonly report intrusive sexual thoughts, difficult-to-control desire, irritability, mood shifts, and sleep problems. Day three is a useful point to name which of those are actually happening for you.';

  @override
  String get pornographyMilestone7Title => 'One Week: Trial Evidence';

  @override
  String get pornographyMilestone7Description =>
      'In a randomized 7-day abstinence study, regular users showed no overall withdrawal syndrome. An exploratory subgroup with both high problematic use and daily viewing had more craving, so a rough first week is possible but not inevitable.';

  @override
  String get pornographyMilestone14Title => 'Map Your Triggers';

  @override
  String get pornographyMilestone14Description =>
      'Two weeks gives you repeated exposure to the situations that used to cue pornography. Research links problematic use with factors including craving, stress, avoidance, loneliness, and coping style; knowing your own pattern gives you something concrete to change.';

  @override
  String get pornographyMilestone30Title => 'A Month of Control';

  @override
  String get pornographyMilestone30Description =>
      'A month is a meaningful test of control. In a 14,581-person study, sexual-function problems were associated more strongly with problematic use than with simple viewing frequency, so regaining control is the more evidence-based target.';

  @override
  String get pornographyMilestone90Title => 'Change Can Hold';

  @override
  String get pornographyMilestone90Description =>
      'A randomized ACT trial for problematic pornography use found large reductions in viewing after 12 sessions, with substantial reductions still present at 3-month follow-up. Durable change is realistic, especially when you build structured skills instead of relying only on willpower.';

  @override
  String get pornographyMilestone180Title => 'Six-Month Stability';

  @override
  String get pornographyMilestone180Description =>
      'A randomized CBT study for out-of-control sexual behaviour found improvements in symptoms, sexual compulsivity, and well-being that remained stable at 3- and 6-month follow-up. Long-term control can be maintained.';

  @override
  String get pornographyMilestone365Title => 'One Year: Durable Change';

  @override
  String get pornographyMilestone365Description =>
      'One-year follow-up data from an acceptance-based treatment study found participants did not return to pretreatment hypersexuality levels. A year of maintained change is credible evidence of a durable pattern, not a magical brain-reset date.';

  @override
  String get pornographyMilestone1825Title => 'Five Years of Control';

  @override
  String get pornographyMilestone1825Description =>
      'Five years is long-term maintenance. CSBD is clinically defined by persistent loss of control with distress or impairment, so maintaining control and functioning well over years is a meaningful outcome in its own right.';

  @override
  String get customMilestone1Title => 'Initial Recovery Phase Begins';

  @override
  String get customMilestone1Description =>
      'Your body starts the healing process! Within 24 hours of quitting, your system begins to clear toxins and adjust to functioning without addictive substances. Sleep disturbances are common but part of the recovery process.';

  @override
  String get customMilestone3Title => 'Withdrawal Symptoms Peak';

  @override
  String get customMilestone3Description =>
      'You\'re facing the storm head-on! Physical withdrawal symptoms typically peak around day 3 for many substances, including anxiety, mood swings, and physical discomfort. This means you\'re getting through the hardest part.';

  @override
  String get customMilestone7Title => 'Acute Withdrawal Phase Ending';

  @override
  String get customMilestone7Description =>
      'The worst is behind you! After one week, acute withdrawal symptoms begin to subside for most substances. Your body is adjusting to its new normal and starting to stabilize.';

  @override
  String get customMilestone14Title => 'Early Recovery Stabilization';

  @override
  String get customMilestone14Description =>
      'Your mind is clearing! Two weeks of sobriety often brings improved mental clarity and reduced cravings as your brain begins to adapt to functioning without addictive substances.';

  @override
  String get customMilestone30Title => 'One Month Milestone';

  @override
  String get customMilestone30Description =>
      'A major victory! Thirty days of sobriety represents significant progress. Many people find that sleep patterns, mood, and energy levels continue to improve during this period.';

  @override
  String get customMilestone90Title => 'Three Month Recovery Milestone';

  @override
  String get customMilestone90Description =>
      'Your commitment is paying off! Three months of recovery represents a significant achievement. Post-acute withdrawal symptoms typically begin to fade, and many people report feeling more like themselves again.';

  @override
  String get customMilestone180Title => 'Six Month Recovery Achievement';

  @override
  String get customMilestone180Description =>
      'You\'re building lasting change! Six months of sobriety often brings continued improvements in physical health, emotional stability, and overall quality of life as your body continues healing.';

  @override
  String get customMilestone365Title => 'One Year of Recovery';

  @override
  String get customMilestone365Description =>
      'An incredible achievement! One year of sobriety represents a major life milestone. Many people experience significant improvements in physical health, relationships, and overall well-being by this point.';

  @override
  String get customMilestone730Title => 'Two Years of Sustained Recovery';

  @override
  String get customMilestone730Description =>
      'You\'ve built a new life! Two years of recovery demonstrates remarkable resilience and commitment. Long-term sobriety often brings profound positive changes in all areas of life and significantly reduced risk of relapse.';

  @override
  String milestoneRetrieved(String date) {
    return 'Retrieved $date';
  }

  @override
  String notificationProgressTitle(String name) {
    return 'No $name';
  }

  @override
  String notificationProgressBody(int days, String message) {
    return '$days days clean — $message';
  }

  @override
  String get notificationProgressMessage1 => 'Keep up the amazing work!';

  @override
  String get notificationProgressMessage2 => 'You\'re doing great!';

  @override
  String get notificationProgressMessage3 => 'Incredible dedication!';

  @override
  String get notificationProgressMessage4 => 'Celebrating your strength!';

  @override
  String get notificationProgressMessage5 => 'Keep shining!';

  @override
  String get notificationProgressMessage6 => 'Awesome job!';

  @override
  String get notificationProgressMessage7 => 'Way to go!';

  @override
  String get notificationProgressMessage8 => 'You\'re a true champion!';

  @override
  String get notificationProgressMessage9 => 'Remarkable effort!';

  @override
  String get notificationProgressMessage10 => 'Stay strong!';

  @override
  String get notificationChannelName => 'Reminders';

  @override
  String get notificationChannelDescription =>
      'Notifications for daily progress reminders';

  @override
  String get notificationOpenAction => 'Open notification';

  @override
  String get done => 'Done';

  @override
  String get rename => 'Rename';

  @override
  String get alcoholReferenceDay1 =>
      'What Happens to Your Sleep When You Stop Drinking?\n\nSource: \"Alcohol and the Sleeping Brain\" (Colrain, Nicholas & Baker), Handbook of Clinical Neurology — peer-reviewed, NIH-hosted\n\nAlcohol and Sleep Architecture\nAlcohol is sedating, so it shortens the time it takes to fall asleep and increases deep slow-wave sleep in the first half of the night. But it comes at a cost: alcohol suppresses REM (rapid eye movement) sleep — the restorative stage tied to memory consolidation and emotional regulation — and fragments sleep in the second half of the night as it is metabolised.\n\nThe First Night Off Alcohol\nBecause alcohol suppresses REM dream sleep, the first nights without it often bring a REM rebound: vivid dreams and lighter, broken sleep while normal sleep patterns return. This is a normal, temporary part of recovery.\n\nRecovery Begins\nAs the brain readjusts over the following days and weeks, REM and overall sleep quality improve. Sleep disturbance is one of the most persistent withdrawal-related symptoms, but it trends toward normal with sustained abstinence.\n\nA Note on Heavy Drinking\nFor heavy or long-term daily drinkers, the first 24 hours can also bring withdrawal symptoms (anxiety, sweating, tremor, nausea). Severe withdrawal can be dangerous — if you have been drinking heavily every day, talk to a doctor before stopping abruptly.';

  @override
  String get alcoholReferenceDay3 =>
      'The Acute Phase and Early Recovery\n\nSource: \"Alcohol Withdrawal,\" StatPearls — peer-reviewed, NIH National Library of Medicine\n\nThe First 24–72 Hours\nStatPearls documents that withdrawal symptoms appear within hours of the last drink — tremor, insomnia, agitation, sweating, raised heart rate and blood pressure — and that symptoms typically peak around 72 hours. Most people are over the worst of the acute phase by the end of day three. Severe withdrawal (seizures, or delirium tremens, which StatPearls notes can occur at any point up to 3 to 5 days after stopping or cutting down) is a medical emergency: heavy daily drinkers should not stop abruptly without medical advice.\n\nCravings Come in Waves\nCravings often intensify across the first several days, but an individual craving is short-lived — usually passing within minutes. Recognising that each wave subsides on its own makes them easier to ride out.\n\nHydration Recovers\nAlcohol suppresses antidiuretic hormone (ADH), making the kidneys excrete more water and leaving regular drinkers chronically dehydrated. Once drinking stops, this diuretic effect ends and fluid balance begins to recover over the first few days — often noticed as clearer skin and steadier energy.\n\nMind and Sleep Begin to Settle\nAs the acute phase passes, the brain chemistry that alcohol disrupted (GABA and glutamate) starts to rebalance. Mental clarity improves and sleep — badly fragmented during early withdrawal — begins trending toward better quality over the first week.';

  @override
  String get alcoholReferenceDay7 =>
      'How the Immune System Recovers\n\nSource: \"Alcohol and the Immune System\" (Sarkar, Jung & Wang), Alcohol Research: Current Reviews — peer-reviewed, NIH-hosted\n\nHow Alcohol Weakens Immunity\nAlcohol weakens the immune system in several ways. Even one heavy drinking session can reduce infection-fighting ability for up to 24 hours. Long-term use reduces white blood cells, disrupts immune signals, and damages gut and lung defences, increasing the risk of infections and slow wound healing.\n\nRemoving the Insult\nMany of these effects improve once alcohol is gone. White blood cells and immune signalling begin to recover, while the gut and airway defences start repairing. Within the first week, your immune system is no longer being knocked down daily and resistance to common infections begins to improve.\n\nA Gradual Process\nFull immune recovery takes longer than a week, and the degree of repair depends on how heavy and prolonged the drinking was — but the first week off alcohol is where the rebuilding begins.';

  @override
  String get alcoholReferenceDay14 =>
      'Early Brain Recovery in Abstinence\n\nSource: Bartsch AJ et al., \"Manifestations of early brain recovery associated with abstinence from alcoholism,\" Brain (2007) — peer-reviewed\n\nMeasuring Recovery\nThis study used MRI to follow recently detoxified people with alcohol dependence through the first weeks of abstinence, comparing them with healthy controls. It captured the brain physically rebuilding once drinking stopped.\n\nBrain Volume Rebounds\nChronic alcohol use shrinks the brain — partly through reversible reduction in cell size, not only permanent cell loss. With abstinence, the researchers measured an average global brain-volume gain of nearly 2%, concentrated around the cerebellum, midbrain, ventricles and frontal regions. Much of this regrowth happens early, in the first couple of weeks off alcohol.\n\nCerebellum and Attention\nRecovery was especially clear in brain areas used for movement and attention. A marker of brain-cell health rose alongside measurable improvements in attention, so the physical healing came with real gains in thinking.\n\nA Foundation, Not the Finish\nHigher functions such as complex reasoning recover more gradually, but the first two weeks establish that the brain begins healing quickly once alcohol is removed.';

  @override
  String get alcoholReferenceDay30 =>
      'Blood Pressure Falls When You Cut Out Alcohol\n\nSource: Roerecke et al., \"The effect of a reduction in alcohol consumption on blood pressure: a systematic review and meta-analysis,\" Lancet Public Health (2017) — peer-reviewed\n\nThe Evidence\nThis meta-analysis pooled 36 randomised trials (about 2,865 participants) testing what happens to blood pressure when people drink less. It found a clear, dose-dependent effect: the more someone cut back, the more their blood pressure dropped.\n\nHow Big Is the Effect?\nPeople who drank two or fewer drinks a day saw no significant blood-pressure change from cutting back. Above that threshold, the effect was dose-dependent: it was strongest in people drinking six or more drinks a day who cut their intake by about half, where systolic blood pressure fell by about 5.5 mmHg and diastolic by about 4.0 mmHg on average. A reduction of that size is clinically meaningful — comparable to some blood-pressure medications and enough to lower long-term stroke and heart-disease risk.\n\nWhy One Month Matters\nAlcohol raises blood pressure by activating the stress response, raising cortisol and stiffening blood vessels. The trials in this review show the benefit emerges over weeks of sustained reduction — so by around a month of abstinence, a heavier drinker\'s blood pressure has had time to settle toward a healthier level.\n\nA Threshold Effect\nThe review found a clear threshold: benefit was concentrated in people drinking more than two drinks a day, and grew progressively larger the heavier the prior drinking. If you were a lighter drinker, don\'t expect this specific blood-pressure benefit — but heavier drinkers get a real, measurable cardiovascular payoff from stopping.';

  @override
  String get alcoholReferenceDay60 =>
      'Liver Recovery After You Stop Drinking\n\nSource: National Institute on Alcohol Abuse and Alcoholism (NIAAA), \"Alcohol\'s Effects on the Body\"\n\nHow Alcohol Damages the Liver\nThe liver processes most of the alcohol you drink, and it takes the brunt of the damage. NIAAA describes a progression of alcohol-related liver injury: it begins with fatty liver (steatosis — fat building up in liver cells), can advance to alcoholic hepatitis (inflammation), and with prolonged heavy use to fibrosis and cirrhosis (scarring).\n\nThe Earlier Stages Are Reversible\nThe crucial point is that the liver is highly regenerative, and the early stages of this damage can improve when drinking stops. Fatty liver in particular often resolves with sustained abstinence. By around two months alcohol-free, the liver has had real time to clear fat deposits, calm inflammation, and restore healthier function — typically reflected in falling liver-enzyme levels (ALT and AST).\n\nBeyond the Liver\nNIAAA notes alcohol also strains the heart, pancreas and immune system. Giving the body a sustained break from alcohol lets these systems recover too — contributing to the steadier energy and better overall health many people notice by this stage.';

  @override
  String get alcoholReferenceDay90 =>
      'Thinking and Memory After Three Months Sober\n\nSource: Systematic review of neuropsychological recovery following abstinence from alcohol (PubMed Central, 2024) — peer-reviewed\n\nWhat the Evidence Shows\nThis review combined studies that tracked how thinking and memory recover after people stop drinking. Most skills move toward normal within roughly six to twelve months, and some improve earlier.\n\nWhat Improves First\nTwo specific abilities stand out as recovering earlier than the rest: basic processing speed (the review found this typically recovers by about one month, though accuracy on more complex tasks lags behind) and working memory updating. By around the three-month mark, many people already notice these lifting.\n\nWhat Takes Longer\nAttention, planning, decision-making, impulse control, perception, and memory keep improving across the six-to-twelve-month recovery window.\n\nWhat Influences Recovery\nThe review notes recovery is shaped by factors such as age, smoking status and premorbid ability — but, encouragingly, not consistently by the total amount previously drunk. Recovery is the expected trajectory.\n\nWhy It Matters\nClearer thinking is practical recovery: better attention and decision-making help people stay in treatment and avoid relapse.';

  @override
  String get alcoholReferenceDay180 =>
      'Brain Recovery at Six Months of Sobriety\n\nSource: Peer-reviewed review of structural and functional brain recovery during abstinence from substance use (PubMed Central)\n\nRecovery Keeps Going\nThe early brain-volume rebound of the first weeks is only the beginning. This review documents that with sustained abstinence the brain continues to recover structurally and functionally — grey matter recovers and damaged white-matter pathways that coordinate communication between brain regions repair over months.\n\nThe Front of the Brain\nRecovery is especially important in the front of the brain, which handles judgment, planning, and self-control. As it heals, decision-making and impulse control strengthen.\n\nBrain Rewiring and Function\nAlongside physical repair, brain function and connections recover too. The brain can rewire and relearn, which makes sustained abstinence a powerful time for therapy and new habits.\n\nRecovery Signal\nBy six months, brain structure and function are clearly moving toward a healthier normal. Staying abstinent gives that recovery more time to build.';

  @override
  String get alcoholReferenceDay365 =>
      'Alcohol, Cancer Risk, and Stopping\n\nSource: National Cancer Institute (NCI), \"Alcohol and Cancer Risk\"\n\nAlcohol Causes Cancer\nThe NCI states there is a strong scientific consensus that drinking alcohol can cause cancer. Alcohol is linked to cancers of the mouth (oral cavity), pharynx (throat), larynx (voice box), oesophagus, liver, breast, and colon and rectum. The more a person drinks — and the longer they drink — the higher the risk.\n\nHow Alcohol Drives Cancer\nMechanisms include acetaldehyde, a toxic breakdown product of alcohol that damages DNA; oxidative stress and inflammation; impaired absorption of protective nutrients; and, for breast cancer, raised oestrogen levels.\n\nRisk Falls After You Stop\nImportantly, the NCI reports that quitting drinking is associated with lower risk over time — studies show the elevated risk of cancers of the oral cavity and oesophagus declines after stopping, though it can take years to approach the risk of someone who never drank. One year alcohol-free is a meaningful step on that path.\n\nCompounding Benefits\nReaching a year also locks in the cardiovascular and liver gains of abstinence — lower blood pressure, reduced arrhythmia risk, and continued liver healing — alongside the falling cancer risk.';

  @override
  String get marijuanaReferenceDay1 =>
      'Marijuana Withdrawal: Day One\n\nSource: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\nCannabis Withdrawal Is Real\nThis peer-reviewed review establishes that Cannabis Withdrawal Syndrome (CWS) is a well-validated clinical condition, occurring in roughly 90% of people diagnosed with cannabis dependence after they stop. Its average peak severity is comparable to that of a tobacco withdrawal syndrome.\n\nWhy Withdrawal Happens\nTHC acts on the endocannabinoid system — CB1 receptors involved in mood, appetite, sleep, memory, and stress. With chronic use the brain downregulates this system; when cannabis stops, it is temporarily underactive. The review notes CB1 receptors return to normal functioning within about four weeks of abstinence.\n\nOnset on Day One\nThe review documents that physical symptoms tend to appear first — within 1–3 days of the last use — while psychological symptoms emerge over 2–10 days. Early symptoms include:\n• Irritability, anxiety, and restlessness\n• Difficulty sleeping\n• Decreased appetite\n• Physical tension, sweating, or chills\n• Depressed mood\n\nSeverity\nCWS is not medically dangerous and symptoms are typically mild to moderate, but the review notes they can be distressing enough to drive relapse — which is why understanding the timeline matters.';

  @override
  String get marijuanaReferenceDay3 =>
      'Cannabis Withdrawal Timeline: The Early Days\n\nSource: \"Time-course of the DSM-5 cannabis withdrawal symptoms in poly-substance abusers,\" BMC Psychiatry (2013), on PubMed Central\n\nA Measured Time-Course\nThis study tracked DSM-5 cannabis withdrawal symptoms in 90 patients over four weeks, producing one of the clearest pictures of how symptoms rise and fall. Overall severity followed a curve: rising, then declining over the following weeks.\n\nWhat Peaks Early\nSeveral of the most physically disruptive symptoms peak within the first few days of stopping:\n• Insomnia — peaks around day 1\n• Nervousness — peaks around day 4\n• Depressed mood and physical symptoms — peak around day 5\n• Restlessness — peaks around day 6\n\nWhat Peaks Later\nThe study found that some symptoms emerge and peak later than the first week:\n• Vivid, unpleasant dreams — peak around day 11\n• Irritability and anger — peak around day 14\n\nSleep and Cannabis\nThe delayed, vivid dreams reflect REM rebound: cannabis suppresses REM sleep during use, and the brain overcompensates once it stops. The authors argue this symptom is common enough to belong among formal withdrawal criteria.\n\nThe Takeaway for Day Three\nBy day three you are in the thick of the early physical peak — insomnia, nervousness, and restlessness are near their worst. The consistent, predictable curve is itself reassuring: these symptoms have a known course and they decline from here.';

  @override
  String get marijuanaReferenceDay7 =>
      'One Week Without Cannabis: Through the Worst\n\nSource: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\nWhere One Week Sits in the Syndrome\nThis review documents that the cannabis withdrawal syndrome usually lasts up to about three weeks, with the most distressing period falling between the first and third week. At one week, the earliest physical symptoms — insomnia, appetite loss, restlessness — have typically passed their peak and are easing.\n\nWhat Is Still Settling\nThe review distinguishes early-peaking physical symptoms from later-peaking psychological ones. At one week:\n• Physical discomfort and appetite are largely improving\n• Sleep is still disrupted for many, with vivid dreams (REM rebound) often peaking around now\n• Irritability and mood can remain elevated, as these tend to peak later in the first two weeks\n\nThe Neurobiology of Recovery\nUnderlying these changes, the review notes that downregulated CB1 receptors return toward normal functioning within about four weeks of abstinence. One week in, that re-regulation is well underway — the system is recovering even while some symptoms linger.\n\nThe Takeaway\nReaching one week means the acute physical peak is behind you. The remaining sleep and mood symptoms are part of a syndrome with a known, finite course that continues to resolve over the next couple of weeks.';

  @override
  String get marijuanaReferenceDay14 =>
      'Two Weeks Without Cannabis: Acute Withdrawal Ends\n\nSource: Budney, AJ et al. (2003) — peer-reviewed study on cannabis withdrawal time course\n\nResearch Findings\nThis peer-reviewed study systematically documented the time course of cannabis withdrawal symptoms in regular users. The findings showed that the acute withdrawal syndrome peaks within the first week and largely resolves within 2 weeks of stopping for most symptoms.\n\nWhat Resolves by 2 Weeks\nThe study documented that by 14 days, the following symptoms had largely resolved in study participants:\n• Physical discomfort and bodily symptoms\n• Appetite disturbance\n• Most sleep disruption\n• Peak irritability and anxiety\n\nWhat May Persist Beyond 2 Weeks\nThe research also identified symptoms that persisted beyond the two-week mark in some users:\n• Depressed mood\n• Concentration difficulties\n• Sleep quality (though improving)\n\nThe Significance of the 2-Week Mark\nPassing the two-week mark is significant because it means the acute withdrawal syndrome is largely complete. The challenges beyond this point are primarily related to longer-term brain recovery and managing the underlying reasons for cannabis use, rather than the acute physiological response to stopping.';

  @override
  String get marijuanaReferenceDay30 =>
      'One Month Without Cannabis: Memory Function Improves\n\nSource: Pope et al. (2001), Archives of General Psychiatry\n\nCannabis and Memory: The Problem\nThis study followed heavy, long-term cannabis users through 28 days of confirmed abstinence and compared their thinking and memory test results with light users and non-users. At the start of abstinence, and again at days 1 and 7, heavy users performed worse than controls on recall of word lists — a deficit that tracked with their urinary THC metabolite levels, reflecting recent drug exposure rather than lifetime use.\n\nThe Good News: Recovery by Day 28\nBy day 28, heavy users, light users, and non-users performed virtually the same across the study\'s thinking and memory tests. There was also no significant relationship between total lifetime cannabis use and test performance at that point.\n\nWhat This Means at 30 Days\n• Verbal learning and recall have returned to control-group levels\n• The residual deficits seen in the first week have resolved\n• The remaining deficit earlier on was tied to recent exposure, not permanent damage\n\nWhat the Evidence Shows\nBy day 28, heavy users were virtually indistinguishable from light users and non-users across the study\'s full set of thinking and memory tests. Verbal-learning and recall deficits seen in the first week had recovered to control-group levels.';

  @override
  String get marijuanaReferenceDay60 =>
      'Two Months Without Cannabis: Concentration Sharpens\n\nSource: Roten et al. (2015), Addictive Behaviors\n\nThe Research Question\nThis youth cannabis-cessation study tracked memory and thinking test scores alongside urine tests over about two months, comparing continued users with people who stopped recently or stayed abstinent.\n\nKey Findings\nConsistent abstinence was associated with significant improvement in:\n• Composite memory score\n• Verbal memory specifically — the most affected domain\n• Movement and reaction-speed performance\n\nAt Two Months\nBy roughly eight weeks of consistent abstinence, memory and movement and reaction-speed performance scores had climbed measurably above where they sat during active use, tracking closely with confirmed non-use rather than time alone.\n\nWhat the Study Shows\nIn adolescents and young adults with cannabis dependence, consistent abstinence produced significant gains in composite memory, verbal memory, and movement and reaction-speed performance across the roughly two-month treatment window.';

  @override
  String get marijuanaReferenceDay90 =>
      'Three Months Without Cannabis: Mood Stability Returns\n\nSource: Connor et al. (2022), Addiction — a clinical review of cannabis withdrawal\n\nWhat the Withdrawal Timeline Actually Looked Like\nThis review describes cannabis withdrawal symptoms typically starting 24–48 hours after cessation and peaking around days 2–6. Anger, aggression, and depressed mood can appear as early as one week but typically peak after about two weeks of abstinence; sleep disturbance in particular can persist longer than other symptoms.\n\nWhere Three Months Sits\nBy three months, you are far beyond the documented withdrawal course: symptoms typically start within 24–48 hours, peak around days 2–6, and even slower mood and sleep symptoms peak within the following weeks. Ninety days gives those withdrawal-driven mood and sleep effects months to settle.\n\nA Note on the Endocannabinoid System\nCannabis-withdrawal research also shows downregulated CB1 receptors returning toward normal functioning within about four weeks of abstinence. At 90 days, you are well beyond that receptor-recovery window.\n\nLooking Ahead\nThe review also discusses post-detoxification prognosis and relapse prevention, underlining that ongoing support and coping strategies matter well beyond the acute withdrawal window.';

  @override
  String get marijuanaReferenceDay180 =>
      'Six Months Without Cannabis: Planning and Decision-Making Recover\n\nSource: Crean, Crane & Mason (2011), Journal of Addiction Medicine\n\nPlanning and Decision-Making After Cannabis\nThis review examined attention, decision-making, self-control, working memory, and verbal fluency from the first hours after use through long-term abstinence. By six months, you are far beyond the short-term effects and deep into the recovery period.\n\nWhat the Research Found\nSeveral problems linked to heavy use recede with sustained abstinence, with some studies finding recovery by 28 days. The slowest areas to recover after heavy, early-onset use include:\n• Decision-making and risk-taking — specifically flagged as domains where deficits can persist long-term in heavy, chronic users\n• Abstract reasoning and verbal skills — particularly impaired in adults who began using before age 17\n\nEarly-Onset Recovery\nSix months is far beyond the short-term effects in this review. Planning, decision-making, and reasoning keep improving with sustained abstinence, making continued abstinence the strongest route to further recovery.\n\nThe Broader Picture\nFor adult-onset, lighter use, the outlook is more favourable — many people at six months report clearer thinking, steadier decision-making, and a stronger sense of self-direction. The biggest gains come from staying abstinent, especially after heavy or early-onset use.';

  @override
  String get marijuanaReferenceDay365 =>
      'One Year Without Cannabis: Brain Structure Recovers\n\nSource: \"Hippocampal harms, protection and recovery following regular cannabis use,\" Translational Psychiatry (2016), on PubMed Central\n\nStructural Changes from Cannabis\nThis brain-scan study examined the hippocampus, a brain area central to memory, in current users, former users, and non-users. Current users not exposed to CBD had a hippocampus about 11% smaller and a brain-cell health marker about 15% lower than controls.\n\nThe Key Finding: Recovery With Abstinence\nCurve-fitting analyses supported a \"protection and recovery\" model. Crucially, former users — abstinent for an average of around 29 months — did not differ from non-using controls on any integrity measure. The authors conclude that THC-related memory-area harms \"can be recovered with extended periods of abstinence.\"\n\nBrain Recovery Over a Year and Beyond\nAt one year cannabis-free, the brain\'s memory system is well into recovery: hippocampus size and brain-cell health are moving back toward normal, supporting memory and emotional control.\n\nRecovery Signal\nFormer users abstinent for about 29 months matched non-users on the study\'s hippocampus health measures. At one year, the memory system is already moving along that documented recovery path toward normal.';

  @override
  String get pornographyReferenceDay1 =>
      'Day One: Taking Back Control\n\nSource: Kraus et al., Compulsive sexual behaviour disorder in the ICD-11, World Psychiatry (2018).\n\nThe clinically important problem is not pornography use by itself. Compulsive Sexual Behaviour Disorder is defined around persistent difficulty controlling repetitive sexual behaviour when that pattern causes significant distress or impairment. Problematic pornography use can be one presentation of that broader problem.\n\nThat makes day one concrete rather than mystical: you have interrupted a behaviour you had decided was out of control. One completed day does not prove a brain and nerve reset, but it does give you the first real observation of when urges appear, what situations trigger them, and what you can do instead.\n\nIf your use was not distressing, impairing, or difficult to control, the clinical CSBD framework may not apply to you. These milestones are aimed at people who are deliberately changing problematic or compulsive use.';

  @override
  String get pornographyReferenceDay3 =>
      'Day Three: Know What an Urge Can Look Like\n\nSource: Lewczuk et al., Withdrawal and tolerance as related to compulsive sexual behavior disorder and problematic pornography use, Journal of Behavioral Addictions (2022).\n\nIn a preregistered nationally representative Polish sample of 1,541 adults, stronger self-reported withdrawal-like experiences were associated with greater CSBD and problematic-pornography-use severity. Among participants with problematic pornography use, commonly reported experiences included difficult-to-stop sexual thoughts, difficult-to-control desire, increased arousal, irritability, mood changes, and sleep problems.\n\nRestlessness, intrusive sexual thoughts, strong urges, and irritability are documented in people with more severe problematic use. If they show up around day three, treat them as a real withdrawal-like pattern and manage the triggers.\n\nWrite down which urges are actually happening, what preceded them, and what response helped. Recovery gets easier to steer when the trigger is named rather than treated as a mysterious brain event.';

  @override
  String get pornographyReferenceDay7 =>
      'One Week: What a Randomized Abstinence Study Found\n\nSource: Effects of a 7-Day Pornography Abstinence Period on Withdrawal-Related Symptoms in Regular Pornography Users, Archives of Sexual Behavior (2023).\n\nResearchers randomized 176 regular pornography users either to attempt seven days of abstinence or to continue as usual. Across the full sample, abstinence did not produce a significant overall increase in craving, negative mood, or withdrawal symptoms.\n\nAn exploratory analysis did find increased craving among people who combined high problematic-use scores with daily pornography use before the study. That result needs replication, but it is useful: a difficult first week can be real for heavier problematic users, while a universal pornography withdrawal syndrome is not supported by this trial.\n\nIf you have made it through a week, you now have better evidence about your own pattern than any generic internet timeline can provide.';

  @override
  String get pornographyReferenceDay14 =>
      'Two Weeks: Map the Triggers That Actually Matter\n\nSource: Biopsychosocial Determinants of Problematic Pornography Use: A Systematic Review (2023).\n\nThis review synthesized 66 studies and found that problematic pornography use is associated with a mix of factors rather than one simple dopamine mechanism. Repeatedly identified psychological and social factors included craving, stress, avoidance, loneliness, self-esteem, negative beliefs, and coping style.\n\nTwo weeks gives you repeated exposure to weekdays, weekends, boredom, stress, privacy, devices, and other contexts that may have cued the old behaviour. Use that data. If stress is the trigger, design a stress response. If loneliness is the trigger, add contact. If easy access is the trigger, change the environment.\n\nThe evidence supports working on the drivers of problematic use; it does not require pretending that every person follows the same biological countdown.';

  @override
  String get pornographyReferenceDay30 =>
      'One Month: Control Matters More Than a Simple Frequency Count\n\nSource: Bőthe et al., Are sexual functioning problems associated with frequent pornography use and/or problematic pornography use?, Addictive Behaviors (2021).\n\nIn a community sample of 14,581 adults, problematic pornography use had a moderate positive association with sexual-functioning problems in both men and women. Pornography-use frequency by itself showed a weak negative association with those problems.\n\nThat distinction matters. The evidence does not support telling every pornography user that viewing frequency alone damages sexual function. The more clinically relevant target is loss of control and the problems surrounding that pattern.\n\nAt one month, compare life now with when you started: preoccupation, time lost, ability to stop, sexual functioning, relationship conflict, and distress. Those changes matter more than waiting for a mythical day-30 brain reset.';

  @override
  String get pornographyReferenceDay90 =>
      'Three Months: Durable Change Is Possible\n\nSource: Crosby & Twohig, Acceptance and Commitment Therapy for Problematic Internet Pornography Use: A Randomized Trial, Behavior Therapy (2016).\n\nThis small randomized trial compared a 12-session ACT program with a waitlist in 28 adult men. Pornography viewing fell much more in the ACT group at the end of treatment, and substantial reductions remained at the three-month follow-up.\n\nThe study does not prove that 90 days of abstinence alone causes the same result, and its sample was small and demographically narrow. What it does demonstrate is important: problematic pornography use is modifiable, and structured skills can produce changes that persist beyond the immediate treatment period.\n\nIf your progress still depends mostly on white-knuckling, three months is a good point to strengthen the system around it: trigger plans, acceptance of urges without acting, environmental friction, accountability, and therapy when needed.';

  @override
  String get pornographyReferenceDay180 =>
      'Six Months: Long-Term Symptom Control Can Hold\n\nSource: Hallberg et al., A Randomized Controlled Study of Group-Administered Cognitive Behavioral Therapy for Hypersexual Disorder in Men, Journal of Sexual Medicine (2019).\n\nIn 137 men with out-of-control sexual behaviour, seven weeks of group CBT produced greater reductions in hypersexual symptoms and sexual compulsivity than a waitlist, along with improved psychiatric well-being. The treatment gains remained stable at both three- and six-month follow-up.\n\nThis study covered hypersexual disorder more broadly rather than pornography abstinence alone, so it should not be turned into a claim that every person is biologically recovered at six months. It does support a stronger and more useful statement: sustained improvement in compulsive sexual behaviour can remain stable over this length of time.\n\nSix months is therefore a maintenance milestone. Keep the routines that made control easier instead of treating the date as permission to dismantle them.';

  @override
  String get pornographyReferenceDay365 =>
      'One Year: Evidence for Durable Behaviour Change\n\nSource: One-year follow-up effects of an acceptance-based treatment for hypersexuality (2026).\n\nAt one-year follow-up, participants in this acceptance-based treatment study had not returned to their pretreatment levels of hypersexuality. The authors described the findings as preliminary evidence of durable, clinically meaningful benefits, with perceived control over craving among the processes followed over time.\n\nThis is treatment follow-up evidence, not proof of a one-year brain reset. The meaningful claim is better anyway: clinically relevant control can persist for a year rather than disappearing as soon as the initial intervention ends.\n\nA year of your own maintained change is also a large personal dataset. Compare current control, distress, functioning, relationships, and time use with where you started; those are the outcomes that matter clinically.';

  @override
  String get pornographyReferenceDay1825 =>
      'Five Years: Long-Term Control Is the Outcome\n\nSource: Compulsive sexual behavior disorder and problematic pornography use: a comprehensive interdisciplinary expert-informed review (2026).\n\nModern reviews treat CSBD and problematic pornography use as complex problems involving control, distress, functioning, context, and individual differences. There is no validated five-year brain and nerve reset threshold.\n\nBut five years is not an empty milestone. It is 1,825 days of maintaining the behavioural direction you chose. Because the clinical problem is persistent loss of control with distress or impairment, sustained control and restored functioning over years are meaningful outcomes in their own right.\n\nAt this stage, the useful question is no longer whether your brain has reached a fictional percentage of rewiring. It is whether the old pattern still controls your choices or disrupts the life you want. If it does not, that is a substantive long-term success.';

  @override
  String get smokingReferenceDay1 =>
      'Day One: Benefits Start Now\n\nSource: NHS Better Health\n\nBenefits begin within minutes — not days. The body starts to normalise as soon as the smoke stops.\n\nWhat happens today\n• 20 minutes: pulse rate begins returning to normal\n• 8 hours: carbon monoxide in the blood falls by half; oxygen levels are recovering\n• 48 hours: carbon monoxide has dropped to the level of a non-smoker\n\nCarbon monoxide binds to red blood cells more strongly than oxygen, displacing it from your blood. Every organ was getting less oxygen than it should. That reverses within two days.\n\nWithdrawal begins on day one\n• Cravings — each typically lasting 3–5 minutes\n• Irritability and difficulty concentrating\n• Increased appetite\n\nThese are temporary and manageable. The NHS Better Health programme offers free support including apps and pharmacist advice.';

  @override
  String get smokingReferenceDay3 =>
      'Day Three: Peak Withdrawal\n\nSource: McLaughlin, Dani & De Biasi\n\nBy 72 hours, nicotine is gone from your body. The brain built extra nicotine receptors during your smoking years; now they\'re understimulated, causing the withdrawal syndrome.\n\nPeak symptoms\n• Cravings — most intense right now\n• Irritability, frustration, restlessness\n• Difficulty concentrating\n• Anxiety\n• Headaches\n• Increased appetite\n• Coughing (the airways are clearing — a good sign)\n\nThis is the hardest day. It doesn\'t get worse than this — from here the symptoms steadily ease as your brain readjusts.\n\nNRT, varenicline, and bupropion all significantly reduce withdrawal severity at this stage.';

  @override
  String get smokingReferenceDay7 =>
      'One Week: Taste and Smell Return\n\nSource: NHS Better Health\n\nReaching one week smoke-free is a strong predictor of long-term success — people who get through the first week are far more likely to quit for good.\n\nWhat\'s recovered\n• Food tastes more flavourful\n• Smells are more vivid\n• Breathing is easier — airways are clearing\n• Circulation is improving\n• Skin is better hydrated\n\nSmoking damages taste and smell receptors directly; within days of stopping, they begin to recover.\n\nThe acute nicotine withdrawal is easing. Physical cravings are shorter and less frequent. Trigger-based cravings may still be present, but the worst of the physical urgency is behind you.';

  @override
  String get smokingReferenceDay14 =>
      'Two Weeks: Circulation Improves\n\nSource: NHS Better Health\n\nWithin 2–12 weeks of stopping, blood circulation improves. Nicotine narrows blood vessels with every cigarette; without it, the vessels relax and blood flows more freely.\n\nWhat this means\n• Blood flow to hands, feet, and peripheral tissues improves\n• Many people notice warmer hands and feet\n• Walking and climbing stairs starts to feel easier\n\nWith carbon monoxide already cleared from the blood in the first day and circulation improving now, oxygen reaches muscles more effectively.\n\nThe cilia lining the airways are recovering and pushing out built-up mucus. If you\'re coughing more than usual, it\'s a sign of recovery, not a setback.';

  @override
  String get smokingReferenceDay30 =>
      'One Month: Lung Function Climbs\n\nSource: NHS Better Health\n\nBreathing becomes easier and lung function improves — increasing by up to 10% over the 3-to-9-month window. At one month, you\'re well into that recovery curve.\n\nWhat\'s happening in the lungs\n• Cilia have regrown and are clearing mucus more effectively\n• Airway inflammation is settling\n• The persistent smoker\'s cough is fading\n• Exercise tolerance is improving\n\nAny coughs, wheezing and breathing problems improve as lung function increases. One month is a meaningful point on that recovery curve.';

  @override
  String get smokingReferenceDay90 =>
      'Three Months: Heart Attack Risk Drops\n\nSource: PMC — Cardiovascular Effects of Smoking and Cessation (2024)\n\nSmoking damages the heart and arteries in multiple ways: it accelerates artery plaque buildup, promotes blood clotting, raises blood pressure, and damages the arterial lining. The procoagulant, clot-promoting effects reverse within days of stopping, and this review reports a notable decline in heart attacks and strokes within the first year of quitting.\n\nWhat\'s improved by now\n• Blood clotting factors are normalising\n• Blood pressure and heart rate are stabilising\n• The sharpest early drop in acute cardiovascular event risk is well underway\n\nThe slower-acting benefits — reversing years of arterial plaque buildup — take longer and are covered in later milestones. Every smoke-free month adds to the recovery.';

  @override
  String get smokingReferenceDay180 =>
      'Six Months: Immune Defences Recover\n\nSource: Smoke-free period and recovery of alveolar immune-cell function (PubMed)\n\nSmoking suppresses the immune cells deep in the lungs, impairing their ability to engulf and kill bacteria. Recovery is gradual — those only 2 months abstinent show the most impairment, while function improves steadily with longer abstinence. By 6 months, pulmonary immune defences have substantially recovered.\n\nWhat this means\nThe lungs can clear inhaled bacteria and particles more effectively, reducing susceptibility to colds, flu, and pneumonia.\n\nImmune defences keep improving beyond six months — but by now the body\'s protection is markedly stronger than it was in those early weeks.';

  @override
  String get smokingReferenceDay365 =>
      'One Year: Heart Attack Risk Falls Sharply\n\nSource: PMC — Smoking Cessation and Stroke Outcome; CDC, Benefits of Quitting Smoking\n\nSmoking roughly doubles stroke risk by promoting artery plaque buildup, increasing blood clotting, raising blood pressure, and damaging cerebral blood vessels. The CDC\'s own quitting-benefits timeline puts the sharp drop in heart attack risk at the 1-to-2-year mark — you\'re at the front edge of that window.\n\nRecovery Timeline\nFull stroke-risk normalisation takes longer: the cited stroke study followed quitters for a median of nearly five years to show a meaningfully lower stroke rate than continued smokers, and CDC data puts halved coronary heart disease risk at 3 to 6 years, with stroke risk decreasing over the 5-to-10-year mark.\n\nOne year is still a genuine medical milestone — the steepest part of the acute-risk decline is behind you, even though the longer-term cardiovascular and cancer benefits continue to build for years.';

  @override
  String get smokingReferenceDay1825 =>
      'Five Years: Cancer Risk Falls\n\nSource: CDC, Benefits of Quitting Smoking\n\nAt five years, some of the most dramatic cancer benefits arrive.\n\nFive-to-ten-year milestones\n• Added risk of cancers of the mouth, throat, and voice box: halved\n• Stroke risk: decreasing\n\nStill ahead\n• Ten years: lung cancer death risk roughly halved (after 10–15 years); risk of bladder, oesophagus, and kidney cancers decreasing\n• Fifteen years: coronary heart disease risk close to that of a non-smoker\n• Twenty years: mouth, throat, and voice box cancer risk close to non-smoker levels; added cervical cancer risk about halved\n\nFive years of not smoking is a genuine achievement — you\'re now inside the window where some of the most significant cancer-risk reductions take hold, even though several benefits (like coronary heart disease risk fully normalising) are still years away.';

  @override
  String get socialMediaReferenceDay1 =>
      'Stepping Back From Social Media: Day One\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhat the Evidence Shows\nIn this strong controlled study, people were randomly assigned either to take a one-week break from Facebook, Instagram, Twitter, and TikTok or to keep using them as usual. The break group showed significant improvements in well-being and reductions in depression and anxiety. That is real, controlled evidence that stepping back helps.\n\nWhat the Evidence Shows\nCompulsive social-media use is strongly linked to lower mood and higher anxiety, and randomized trials show that deliberately cutting back can improve well-being while reducing depression and anxiety within a week.\n\nDay One: What to Expect\n• Restlessness and an urge to check\n• \'Phantom\' notifications — feeling a buzz that didn\'t happen\n• Boredom as you adjust to less constant stimulation\nThese are normal habit-related sensations, and they are temporary. Recognising the pattern is the first step in changing it.';

  @override
  String get socialMediaReferenceDay3 =>
      'Three Days Without Social Media: Anxiety and Mood\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhy a Break Helps Mood\nIn this controlled trial, people randomly assigned to a one-week break from social media ended the week with lower anxiety and depression and higher well-being than those who kept scrolling. Much of the day-to-day distress of heavy use comes from social comparison — measuring your real life against others\' curated highlight reels — and from the low-grade pull of fear-of-missing-out.\n\nWhat Happens Around 72 Hours\nEarly in a break, the habit is still loud:\n• Strong urges to check, often triggered by routine moments (waking, waiting in line)\n• Some irritability and restlessness\n• For some people, the first easing of comparison-driven anxiety\n• The pre-sleep scroll habit starting to loosen\n\nThe Comparison Trap Loosens\nWithout a constant feed of other people\'s highlights, the comparison that fuels much social-media anxiety has less fuel. The trial\'s results suggest that by the end of the first week these early shifts add up to a measurable improvement in mood — so the discomfort at three days is the hard part of a change that pays off.';

  @override
  String get socialMediaReferenceDay7 =>
      'One Week Without Social Media: The Measured Payoff\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nExactly One Week — and It Worked\nThis is the milestone the research speaks to most directly: the trial\'s intervention was a one-week break. Compared with people who kept using social media, the break group showed significantly higher well-being and significantly lower depression and anxiety after just seven days. Reaching one week is reaching the point at which a controlled study found real benefit.\n\nWhat People Commonly Notice\nAlongside the measured mood gains, people often report:\n• More reclaimed time — many are surprised how much they had been spending\n• Easier focus, as the habit of constant attention-switching loosens\n• Calmer evenings and easier sleep without the pre-bed scroll\nThese gains fit the broader improvement in well-being measured in the trial.\n\nKeep Going\nOne week is a genuine, evidence-backed milestone. The mood, time, and attention benefits tend to deepen the longer the healthier pattern holds.';

  @override
  String get socialMediaReferenceDay14 =>
      'Two Weeks Without Social Media: Two-Week Gains\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nAbout This Study\nYoung adults limited social media to about 30 minutes a day for two weeks, with usage tracked objectively on their phones (it fell by roughly 78%). Participants cut social-media use by roughly 78%, giving this milestone a direct real-world test of what happens when use is sharply reduced for two weeks.\n\nWhat Improved\nOver the two weeks, participants showed improvements in:\n• Sleep — both duration and quality\n• Satisfaction with life\n• Stress\n• Perceived wellness\n• Scores on smartphone and social-media addiction scales\nThe measured gains were concrete: longer and better sleep, lower stress, higher life satisfaction and perceived wellness, and lower smartphone/social-media addiction scores.\n\nWatch for Backsliding\nThe researchers also noticed use creeping back toward previous levels afterwards. Two weeks is a real gain, but it highlights why an intentional plan — not just a temporary break — is what keeps the benefits.';

  @override
  String get socialMediaReferenceDay30 =>
      'One Month Without Social Media: Real Connection Deepens\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nConnection Can Improve When You Step Back\nIt sounds paradoxical — but in this study, cutting social media right back was associated with improvement in supportive relationships, along with better life satisfaction and lower stress. Time and attention that went to the feed became available for the people actually in your life.\n\nWhat One Month Tends to Bring\nBy 30 days, with the automatic pull of checking much weaker, many people find:\n• Conversations are more present and less interrupted\n• More interest in real-world activities and hobbies\n• Self-image leaning less on likes, comments, and follower counts\n\nRecovery Signal\nBy one month, you have sustained the healthier pattern for twice the study\'s intervention window. The sleep, stress, life-satisfaction, wellness, and relationship gains measured at two weeks have had another two weeks to consolidate into routine.\n\nMake the Time Count\nAim to fill freed time with activities that build genuine connection and fulfilment, rather than simply swapping one screen for another.';

  @override
  String get socialMediaReferenceDay60 =>
      'Two Months Without Social Media: What the Evidence Supports\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nThe Most Reliable Picture\nResearchers combined results from 10 studies, including seven controlled trials. The clearest result was a meaningful reduction in depressive symptoms after people stepped back from social media.\n\nThe Strongest Result\nThe combined research found a clear reduction in depressive symptoms. By two months, you are sustaining the same kind of lower digital exposure that produced that mental-health benefit.\n\nWhat Two Months Can Look Like\nWith less daily comparison and less feed-driven reinforcement, self-image has far less reason to depend on likes, comments, or follower counts, while the strongest pooled evidence points to lower depressive symptoms.\n\nThe Practical Takeaway\nThe evidence rewards intentional, sustained change. Use the two-month point to keep deliberate limits in place rather than drifting back, and to invest in offline sources of meaning and connection.';

  @override
  String get socialMediaReferenceDay90 =>
      'Three Months Without Social Media: A New Normal\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nSleep Is the Standout\nAmong this study\'s clearest findings was improved sleep — both duration and quality — when participants cut social media right back. By three months of a sustained healthier pattern, the late-night scroll that used to eat into sleep has long stopped competing with rest, and better sleep tends to lift mood, focus, and energy with it.\n\nWhat Else Improved\nThe same study found gains in stress, life satisfaction, perceived wellness, and supportive relationships. At three months these are no longer novelties — they have had time to settle into a new normal.\n\nRecovery Signal on Mechanism\nCutting social media sharply improved both sleep duration and sleep quality in the intervention study. Three months of sustaining that pattern turns the late-night-scroll reduction into a durable sleep habit.\n\nPresence and Relationships\nWith the reflex to fill every quiet moment with the phone much weaker, being present — in conversations, meals, and downtime — comes more naturally, and the relationships you have invested in over three months tend to feel stronger for it.';

  @override
  String get socialMediaReferenceDay180 =>
      'Six Months Without Social Media: Measured Recovery\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nWhat Meta-Analysis Adds\nCombining 10 studies, including seven controlled trials, researchers found a clear reduction in depressive symptoms after people reduced or paused social media.\n\nWhat It Actually Found\n• Depression: a statistically significant reduction (the clearest, most consistent benefit)\n• Life satisfaction: no significant effect\n• Stress: no significant effect\n• Overall mental well-being: no significant effect\nThe strongest pooled result is clear: digital detox significantly reduces depressive symptoms.\n\nWhy You May Still Feel Broad Benefits\nSix months of reduced feed exposure compounds the practical gains seen in shorter interventions: more available time, less compulsive checking, and a sustained reduction in the digital exposure associated with depressive symptoms.\n\nKeep Control of the Feed\nThe biggest gains come from breaking heavy, passive, compulsive use. By six months, intentional control over social media is the new default rather than the feed controlling your attention.';

  @override
  String get socialMediaReferenceDay365 =>
      'One Year Without Social Media: A Renegotiated Relationship\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nOne Year of Sustained Change\nThe strongest combined research shows that stepping back from social media reduces depressive symptoms. A full year means that lower-exposure pattern has become your normal rather than a short break.\n\nWhat a Year Builds\nA full year gives you hundreds of hours back for real relationships, hobbies, skills, reflection, and creativity. Automatic checking has had a full year to weaken while those offline routines have had a full year to strengthen.\n\nSustained Benefits\nThe clearest measured mental-health gain is lower depressive symptoms. The practical gains — more time, fewer interruptions, and less compulsive checking — compound every day you keep control of the feed.\n\nWhat Comes Next\nA year of deliberate change has reset the relationship. Whether you return to limited, intentional use or stay off entirely, the compulsive loop has been broken — and that is the durable win.';

  @override
  String get homeSectionBuilding => 'Building';

  @override
  String get homeSectionQuitting => 'Breaking free';

  @override
  String get habitAddButton => 'Add a good habit';

  @override
  String get habitEmptyHint =>
      'Start a good habit, like a daily devotional, a walk, or time with your partner.';

  @override
  String get habitDoneToday => 'Mark done today';

  @override
  String get habitUndoToday => 'Undo today';

  @override
  String habitStreakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-day streak',
      one: '1-day streak',
      zero: 'No streak yet',
    );
    return '$_temp0';
  }

  @override
  String habitStreakWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-week streak',
      one: '1-week streak',
      zero: 'No streak yet',
    );
    return '$_temp0';
  }

  @override
  String habitWeekProgress(int done, int target) {
    return '$done of $target this week';
  }

  @override
  String get editHabitAddTitle => 'New habit';

  @override
  String get editHabitTitle => 'Edit habit';

  @override
  String get habitDelete => 'Delete habit';

  @override
  String get habitCategoryLabel => 'Area';

  @override
  String get habitCategoryFaith => 'Faith';

  @override
  String get habitCategoryFitness => 'Fitness';

  @override
  String get habitCategoryRelationship => 'Relationship';

  @override
  String get habitCategoryOther => 'Other';

  @override
  String get habitTargetLabel => 'Days per week';

  @override
  String get habitTargetDaily => 'Every day';

  @override
  String habitTargetWeekly(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days a week',
      one: '1 day a week',
    );
    return '$_temp0';
  }

  @override
  String get habitSuggestionsLabel => 'Ideas to start with';

  @override
  String get presetDevotional => 'Daily devotional';

  @override
  String get presetPray => 'Pray';

  @override
  String get presetPsalm => 'Read a Psalm';

  @override
  String get presetChurch => 'Go to church';

  @override
  String get presetWalk => 'Walk 30 minutes';

  @override
  String get presetWorkout => 'Work out';

  @override
  String get presetStretch => 'Stretch';

  @override
  String get presetWater => 'Drink enough water';

  @override
  String get presetBedtime => 'Go to bed on time';

  @override
  String get presetPrayTogether => 'Pray together';

  @override
  String get presetDateNight => 'Date night';

  @override
  String get presetEncourage => 'Encourage my partner';

  @override
  String get presetPhonesAway => 'Phones away at dinner';

  @override
  String get presetAskAboutDay => 'Ask about their day';

  @override
  String get verseOfTheDay => 'Verse of the day';

  @override
  String get verseShare => 'Share verse';

  @override
  String verseReference(String reference) {
    return '$reference (WEB)';
  }

  @override
  String verseShareMessage(String text, String reference) {
    return '“$text” $reference (WEB)';
  }

  @override
  String get encourageCheckIn1 => 'Well done. Small, faithful steps add up.';

  @override
  String get encourageCheckIn2 =>
      'You showed up today. Keep in step with the Spirit.';

  @override
  String get encourageCheckIn3 =>
      'Done. Grace for today, strength for tomorrow.';

  @override
  String get encourageCheckIn4 => 'Another seed sown. Growth takes time.';

  @override
  String get encourageCheckIn5 =>
      'Good work. You\'re becoming who you were made to be.';

  @override
  String get encourageCheckIn6 => 'One more step toward being more like Jesus.';

  @override
  String encourageMilestoneDays(int count) {
    return '$count days in a row! Keep walking in step with the Spirit.';
  }

  @override
  String encourageMilestoneWeeks(int count) {
    return '$count weeks in a row! Faithful in the small things.';
  }

  @override
  String get encourageMissedTitle => 'Missed yesterday?';

  @override
  String get encourageMissedBody =>
      'That\'s okay. His mercies are new every morning, so start again today.';

  @override
  String get habitOpensReading => 'Open today\'s reading';

  @override
  String get habitOpensReadingHint =>
      'Read the day\'s passage from your plan, then this habit is ticked off for you.';

  @override
  String get readingTitle => 'Today\'s reading';

  @override
  String get readingChoosePlan => 'Choose a reading plan';

  @override
  String get readingChoosePlanHint =>
      'Go at your own pace. If you miss a day, your next reading simply waits for you.';

  @override
  String readingPlanDays(int count) {
    return '$count days';
  }

  @override
  String get readingStart => 'Start';

  @override
  String readingDayOf(int day, int total) {
    return 'Day $day of $total';
  }

  @override
  String get readingPrayerPrompt =>
      'Before you read, ask the Holy Spirit to guide you into the truth (John 16:13).';

  @override
  String get readingDoneToday =>
      'Today\'s reading is done. Read ahead if you like.';

  @override
  String get readingNoteLabel => 'A prayer or thought (optional)';

  @override
  String get readingNoteHint => 'Saved to your journal';

  @override
  String get readingFinish => 'Finish reading';

  @override
  String get readingFinishedMessage =>
      'Well done. Let the word of Christ dwell in you richly.';

  @override
  String readingPlanComplete(String plan) {
    return 'You finished $plan!';
  }

  @override
  String get readingPlanCompleteBody =>
      'What a faithful journey. Choose another plan when you\'re ready.';

  @override
  String get readingChoosePlanAgain => 'Choose another plan';

  @override
  String get readingChangePlan => 'Change plan';

  @override
  String get readingStartOver => 'Start over';

  @override
  String get planPsalmsProverbsTitle => 'Psalms & Proverbs in 30 days';

  @override
  String get planPsalmsProverbsDescription =>
      'Five Psalms and a chapter of Proverbs each day, for prayer and wisdom.';

  @override
  String get planGospelsTitle => 'The four Gospels';

  @override
  String get planGospelsDescription =>
      'A chapter a day through Matthew, Mark, Luke and John, walking with Jesus.';

  @override
  String get strugglingButton => 'I\'m struggling';

  @override
  String get strugglingTitle => 'Hold on. You\'re not alone.';

  @override
  String get strugglingBody =>
      'This feeling will pass. God is faithful, and He will make a way through it.';

  @override
  String get strugglingAnotherVerse => 'Another verse';

  @override
  String get strugglingPrayTitle => 'Pray';

  @override
  String get strugglingPrayer =>
      'Holy Spirit, I\'m struggling right now. Please give me strength to say no and show me the way out. Fill me with Your peace. In Jesus\' name, amen.';

  @override
  String get strugglingStepsTitle => 'For the next ten minutes';

  @override
  String get strugglingStepBreathe =>
      'Breathe slowly and step away from the situation.';

  @override
  String get strugglingStepMove =>
      'Go for a walk, drink some water or keep your hands busy.';

  @override
  String get strugglingStepWait =>
      'Wait it out. Urges rise and fall like a wave.';

  @override
  String get strugglingReachOut => 'Reach out to someone';

  @override
  String get strugglingShareMessage =>
      'I\'m struggling right now. Could you pray for me or give me a call?';

  @override
  String get strugglingMadeIt => 'I made it through';

  @override
  String get strugglingMadeItMessage =>
      'Well done. God is faithful, and you stood firm. Thank Him for this win.';

  @override
  String get habitLogMinutes => 'Log minutes';

  @override
  String get habitMinutesTitle => 'How many minutes?';

  @override
  String get habitMinutesLabel => 'Minutes';

  @override
  String habitMinutesToday(int minutes) {
    return '$minutes min today';
  }

  @override
  String get statsHabitsTitle => 'Good habits';

  @override
  String statsHabitThisWeek(int done, int target) {
    return 'This week: $done of $target';
  }

  @override
  String statsHabitRecent(int percent) {
    return 'Last 4 weeks: $percent%';
  }

  @override
  String statsHabitBestDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Best: $count days',
      one: 'Best: 1 day',
    );
    return '$_temp0';
  }

  @override
  String statsHabitBestWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Best: $count weeks',
      one: 'Best: 1 week',
    );
    return '$_temp0';
  }

  @override
  String get statsExerciseTitle => 'Exercise';

  @override
  String statsExerciseThisWeek(int minutes) {
    return '$minutes minutes this week';
  }

  @override
  String statsExerciseAverage(int minutes) {
    return 'About $minutes minutes a week lately';
  }

  @override
  String get statsExerciseHint =>
      'Log minutes on a fitness habit after ticking it off to see them here.';

  @override
  String get freshStartHold => 'Hold to start again';

  @override
  String get freshStartHoldHint => 'Press and hold to start again';

  @override
  String get freshStartTitle => 'A clean slate';

  @override
  String get freshStartPledge => 'With God\'s help, I begin again today.';

  @override
  String get freshStartContinue => 'Tap to continue';

  @override
  String get discreetJourney => 'Journey';

  @override
  String discreetJourneyNumbered(int number) {
    return 'Journey $number';
  }

  @override
  String get settingsDiscreet => 'Discreet mode';

  @override
  String get settingsDiscreetSubtitle =>
      'Show journeys under neutral names and icons, and keep them out of notifications. Rename a journey to give it a private name.';

  @override
  String get notificationDiscreetTitle => 'Keep going';

  @override
  String notificationDiscreetBody(int days, String message) {
    return 'Day $days of your journey. $message';
  }
}
