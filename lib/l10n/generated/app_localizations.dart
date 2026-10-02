import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @addictionSyntheticCannabinoids.
  ///
  /// In en, this message translates to:
  /// **'Synthetic Cannabinoids'**
  String get addictionSyntheticCannabinoids;

  /// The main application title
  ///
  /// In en, this message translates to:
  /// **'Spirit'**
  String get appTitle;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Tab label for the main tab with habits and journeys
  ///
  /// In en, this message translates to:
  /// **'Spirit'**
  String get tabQuitter;

  /// No description provided for @showAllItems.
  ///
  /// In en, this message translates to:
  /// **'Show all items'**
  String get showAllItems;

  /// No description provided for @showAllSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable all main screen items'**
  String get showAllSubtitle;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable all notifications'**
  String get enableNotifications;

  /// No description provided for @enableNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Turn on or off all notifications'**
  String get enableNotificationsSubtitle;

  /// Tab label for the Journal tab
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get tabJournal;

  /// Tab label for the Stats tab
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get tabStats;

  /// Heading on the stats page
  ///
  /// In en, this message translates to:
  /// **'Recovery Stats'**
  String get statsTitle;

  /// Empty state message on the stats page
  ///
  /// In en, this message translates to:
  /// **'Start tracking addictions to see your stats'**
  String get statsNoAddictions;

  /// Section title for the overview journey card on stats page
  ///
  /// In en, this message translates to:
  /// **'Your Journey'**
  String get statsJourneyTitle;

  /// Total days clean across all addictions
  ///
  /// In en, this message translates to:
  /// **'{days} total days'**
  String statsTotalDays(int days);

  /// Number of addictions being tracked
  ///
  /// In en, this message translates to:
  /// **'{count} tracked'**
  String statsAddictionsTracked(int count);

  /// Section title for the money saved card on stats page
  ///
  /// In en, this message translates to:
  /// **'Money Saved'**
  String get statsMoneySavedTitle;

  /// Disclaimer text on the money saved card
  ///
  /// In en, this message translates to:
  /// **'Estimated based on average usage'**
  String get statsMoneySavedEstimate;

  /// Fun equivalence for money saved — coffees
  ///
  /// In en, this message translates to:
  /// **'That\'s about {count} coffees'**
  String statsEquivalentCoffees(int count);

  /// Fun equivalence for money saved — restaurant meals
  ///
  /// In en, this message translates to:
  /// **'That\'s about {count} restaurant meals'**
  String statsEquivalentMeals(int count);

  /// Fun equivalence for money saved — a flight ticket
  ///
  /// In en, this message translates to:
  /// **'That\'s a flight somewhere new'**
  String get statsEquivalentFlight;

  /// Fun equivalence for money saved — a vacation
  ///
  /// In en, this message translates to:
  /// **'That\'s a vacation abroad'**
  String get statsEquivalentVacation;

  /// Section title for the time saved card on stats page
  ///
  /// In en, this message translates to:
  /// **'Time Reclaimed'**
  String get statsTimeSavedTitle;

  /// Hours of time saved
  ///
  /// In en, this message translates to:
  /// **'{hours} hours'**
  String statsHoursSaved(int hours);

  /// Fun equivalence for time saved — books read
  ///
  /// In en, this message translates to:
  /// **'Enough to read about {count} books'**
  String statsEquivalentBooks(int count);

  /// Fun equivalence for time saved — movies watched
  ///
  /// In en, this message translates to:
  /// **'Enough to watch about {count} movies'**
  String statsEquivalentMovies(int count);

  /// Section title for the streaks bar chart on stats page
  ///
  /// In en, this message translates to:
  /// **'Your Streaks'**
  String get statsStreaksTitle;

  /// Compact days label used in streak bars
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String statsDaysSuffix(int days);

  /// Day unit displayed beside the total journey count
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1 {day} other {days}}'**
  String statsDayUnit(int count);

  /// Compact hours label used in stats detail rows
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String statsHoursSuffix(int hours);

  /// Section title for the resilience/relapse history card on stats page
  ///
  /// In en, this message translates to:
  /// **'Resilience'**
  String get statsResilienceTitle;

  /// Motivational message about number of relapses
  ///
  /// In en, this message translates to:
  /// **'{count} times you\'ve reset and kept going'**
  String statsTimesBouncedBack(int count);

  /// Average days achieved before each relapse
  ///
  /// In en, this message translates to:
  /// **'{days} days of progress each time'**
  String statsDaysBeforeRelapse(int days);

  /// Tab label for the Settings tab
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// Floating action button label on home page
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get homeAddButton;

  /// Tooltip for the add custom addiction button
  ///
  /// In en, this message translates to:
  /// **'Create your own custom addiction to quit'**
  String get homeAddTooltip;

  /// Floating action button label on quit page (start button)
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get quitStartButton;

  /// Prompt displayed on the quit card
  ///
  /// In en, this message translates to:
  /// **'Tap to start'**
  String get quitCardSubtitle;

  /// Kepp days on Quit card
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1 { day} other { days}}'**
  String quitCardKeepDays(int days);

  /// Toast message shown when app is updated
  ///
  /// In en, this message translates to:
  /// **'New version {version}'**
  String newVersionToast(String version);

  /// Action button text to view changelog
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get changesAction;

  /// Title for hide addiction confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Hide {title}?'**
  String hideDialogTitle(String title);

  /// Message explaining what hiding an addiction does
  ///
  /// In en, this message translates to:
  /// **'This will hide the {title} option from your home screen. You can show it again in Settings.'**
  String hideDialogMessage(String title);

  /// Cancel button text used throughout the app
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Hide button text in hide addiction dialog
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// Title for stop tracking confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Stop tracking {title}?'**
  String stopTrackingDialogTitle(String title);

  /// Message for stop tracking confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'This will remove {title} from your home screen. Your milestone history will be preserved.'**
  String stopTrackingDialogMessage(String title);

  /// Remove button text in stop tracking dialog
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get stopTracking;

  /// Title for the add addiction picker page
  ///
  /// In en, this message translates to:
  /// **'Track an Addiction'**
  String get addAddictionTitle;

  /// Custom addiction option in addiction picker
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get addAddictionCustom;

  /// Subtitle for custom addiction option
  ///
  /// In en, this message translates to:
  /// **'Track anything you want to quit'**
  String get addAddictionCustomSubtitle;

  /// Title shown on home when no addictions are being tracked
  ///
  /// In en, this message translates to:
  /// **'Nothing tracked yet'**
  String get homeEmptyTitle;

  /// Subtitle shown on home when no addictions are being tracked
  ///
  /// In en, this message translates to:
  /// **'Tap + to start tracking an addiction'**
  String get homeEmptySubtitle;

  /// Message shown when all addictions are already tracked
  ///
  /// In en, this message translates to:
  /// **'All available addictions are already being tracked'**
  String get addAddictionNoneAvailable;

  /// Name of the alcohol addiction type
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get addictionAlcohol;

  /// Name of the vaping addiction type
  ///
  /// In en, this message translates to:
  /// **'Vaping'**
  String get addictionVaping;

  /// Name of the smoking addiction type
  ///
  /// In en, this message translates to:
  /// **'Smoking'**
  String get addictionSmoking;

  /// Name of the nicotine pouches addiction type
  ///
  /// In en, this message translates to:
  /// **'Nicotine pouches'**
  String get addictionNicotinePouches;

  /// Name of the smokeless tobacco addiction type
  ///
  /// In en, this message translates to:
  /// **'Dip / Chewing Tobacco'**
  String get addictionSmokelessTobacco;

  /// Page title for smokeless tobacco quit milestones
  ///
  /// In en, this message translates to:
  /// **'Tobacco-Free'**
  String get smokelessTobaccoPageTitle;

  /// Header shown when user has started quitting smokeless tobacco
  ///
  /// In en, this message translates to:
  /// **'Nicotine-free journey'**
  String get smokelessTobaccoHeaderStarted;

  /// Header shown when user has not started quitting smokeless tobacco
  ///
  /// In en, this message translates to:
  /// **'Quit dip & chewing tobacco'**
  String get smokelessTobaccoHeaderNotStarted;

  /// Subtitle when smokeless tobacco quit is in progress
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get smokelessTobaccoSubtitleStarted;

  /// Subtitle before smokeless tobacco quit starts
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get smokelessTobaccoSubtitleNotStarted;

  /// Name of the social media addiction type
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get addictionSocialMedia;

  /// Name of the adult content addiction type
  ///
  /// In en, this message translates to:
  /// **'Adult Content'**
  String get addictionAdultContent;

  /// Generic search hint text
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// Shown when a search yields no matches
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noSearchResults;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// Hint text for the home addiction search bar
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get homeSearchHint;

  /// Button to create a custom tracker from an unmatched search
  ///
  /// In en, this message translates to:
  /// **'Track it anyway'**
  String get homeTrackAnyway;

  /// Hint text for the icon picker search bar
  ///
  /// In en, this message translates to:
  /// **'Search icons...'**
  String get iconSearchHint;

  /// Shown when icon search yields no matches
  ///
  /// In en, this message translates to:
  /// **'No icons found'**
  String get iconNoResults;

  /// Button to open a milestone reference source
  ///
  /// In en, this message translates to:
  /// **'Open Original Source'**
  String get milestoneOpenOriginalSource;

  /// Title of the export file save dialog
  ///
  /// In en, this message translates to:
  /// **'Save data to'**
  String get settingsExportSaveDialog;

  /// Hint text for settings search bar
  ///
  /// In en, this message translates to:
  /// **'Search settings...'**
  String get settingsSearchHint;

  /// Section header for appearance settings
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsSectionAppearance;

  /// Section header for security settings
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSectionSecurity;

  /// Section header for main screen items settings
  ///
  /// In en, this message translates to:
  /// **'Main Screen Items'**
  String get settingsSectionMainScreenItems;

  /// Section header for notification settings
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsSectionNotifications;

  /// Section header for system settings
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsSectionSystem;

  /// Setting title for PIN lock feature
  ///
  /// In en, this message translates to:
  /// **'PIN lock'**
  String get settingsPinLock;

  /// Subtitle explaining PIN lock setting
  ///
  /// In en, this message translates to:
  /// **'Require PIN to open app'**
  String get settingsPinLockSubtitle;

  /// Label for PIN timeout setting
  ///
  /// In en, this message translates to:
  /// **'PIN timeout (seconds)'**
  String get settingsPinTimeout;

  /// Hint text for PIN timeout field
  ///
  /// In en, this message translates to:
  /// **'15'**
  String get settingsPinTimeoutHint;

  /// Setting title for theme selection
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Setting title for color scheme selection
  ///
  /// In en, this message translates to:
  /// **'Color scheme'**
  String get settingsColorScheme;

  /// Use the dynamic color scheme from Material 3
  ///
  /// In en, this message translates to:
  /// **'Dynamic colors'**
  String get settingsDynamicColorScheme;

  /// Use the blue-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get settingsBlueColorScheme;

  /// Use the green-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get settingsGreenColorScheme;

  /// Use the red-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get settingsRedColorScheme;

  /// Use the purple-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get settingsPurpleColorScheme;

  /// Use the orange-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get settingsOrangeColorScheme;

  /// Setting title for reset buttons visibility
  ///
  /// In en, this message translates to:
  /// **'Reset buttons'**
  String get settingsResetButtons;

  /// Subtitle explaining reset buttons setting
  ///
  /// In en, this message translates to:
  /// **'Show reset buttons on quit pages'**
  String get settingsResetButtonsSubtitle;

  /// Setting title for journal visibility
  ///
  /// In en, this message translates to:
  /// **'Show journal'**
  String get settingsShowJournal;

  /// Subtitle explaining show journal setting
  ///
  /// In en, this message translates to:
  /// **'Enable the journal tab for logging your thoughts'**
  String get settingsShowJournalSubtitle;

  /// Setting title for week start day preference
  ///
  /// In en, this message translates to:
  /// **'Week starts on Monday'**
  String get settingsWeekStartsMonday;

  /// Subtitle explaining week starts on Monday setting
  ///
  /// In en, this message translates to:
  /// **'Calendar week begins on Monday instead of Sunday'**
  String get settingsWeekStartsMondaySubtitle;

  /// Setting title for swipe between tabs feature
  ///
  /// In en, this message translates to:
  /// **'Swipe between tabs'**
  String get settingsSwipeBetweenTabs;

  /// Subtitle explaining swipe between tabs setting
  ///
  /// In en, this message translates to:
  /// **'Dragging your finger moves between Journal, Homepage & Settings'**
  String get settingsSwipeBetweenTabsSubtitle;

  /// Setting subtitle for showing alcohol tracking
  ///
  /// In en, this message translates to:
  /// **'Show alcohol tracking'**
  String get settingsShowAlcoholTracking;

  /// Setting subtitle for showing vaping tracking
  ///
  /// In en, this message translates to:
  /// **'Show vaping tracking'**
  String get settingsShowVapingTracking;

  /// Setting subtitle for showing smoking tracking
  ///
  /// In en, this message translates to:
  /// **'Show smoking tracking'**
  String get settingsShowSmokingTracking;

  /// Setting subtitle for showing nicotine pouches tracking
  ///
  /// In en, this message translates to:
  /// **'Show nicotine pouches tracking'**
  String get settingsShowNicotinePouchesTracking;

  /// Setting subtitle for showing social media tracking
  ///
  /// In en, this message translates to:
  /// **'Show social media tracking'**
  String get settingsShowSocialMediaTracking;

  /// Setting subtitle for showing adult content tracking
  ///
  /// In en, this message translates to:
  /// **'Show adult content tracking'**
  String get settingsShowAdultContentTracking;

  /// Setting title for notification frequency
  ///
  /// In en, this message translates to:
  /// **'Notification frequency'**
  String get settingsNotificationFrequency;

  /// Subtitle showing notification frequency
  ///
  /// In en, this message translates to:
  /// **'Every {days, plural, =1 {{days} day} other {{days} days}} at {time}'**
  String settingsNotificationFrequencySubtitle(int days, String time);

  /// Setting subtitle for alcohol notifications
  ///
  /// In en, this message translates to:
  /// **'Notify alcohol quitting progress'**
  String get settingsNotifyAlcohol;

  /// Setting subtitle for vaping notifications
  ///
  /// In en, this message translates to:
  /// **'Notify vaping quitting progress'**
  String get settingsNotifyVaping;

  /// Setting subtitle for smoking notifications
  ///
  /// In en, this message translates to:
  /// **'Notify smoking quitting progress'**
  String get settingsNotifySmoking;

  /// Setting subtitle for nicotine pouches notifications
  ///
  /// In en, this message translates to:
  /// **'Notify nicotine pouches quitting progress'**
  String get settingsNotifyNicotinePouches;

  /// Setting subtitle for social media notifications
  ///
  /// In en, this message translates to:
  /// **'Notify social media quitting progress'**
  String get settingsNotifySocialMedia;

  /// Setting subtitle for adult content notifications
  ///
  /// In en, this message translates to:
  /// **'Notify adult content quitting progress'**
  String get settingsNotifyAdultContent;

  /// Setting subtitle for custom entry notifications
  ///
  /// In en, this message translates to:
  /// **'Notify {name} quitting progress'**
  String settingsNotifyCustomEntry(String name);

  /// Setting title for reset messages
  ///
  /// In en, this message translates to:
  /// **'Reset messages'**
  String get settingsResetMessages;

  /// Subtitle explaining reset messages setting
  ///
  /// In en, this message translates to:
  /// **'Show positive reinforcement after relapses'**
  String get settingsResetMessagesSubtitle;

  /// Setting title for about page
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// Setting title for what's new page
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get settingsWhatsNew;

  /// Setting title for enjoying the app page
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get settingsEnjoyingApp;

  /// Setting title for reporting a bug
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get settingsReportBug;

  /// Setting title for exporting data
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get settingsExportData;

  /// Setting title for importing data
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get settingsImportData;

  /// Setting title for deleting all data
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get settingsDeleteEverything;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Pure black theme option for OLED displays
  ///
  /// In en, this message translates to:
  /// **'Pure black'**
  String get themePureBlack;

  /// Dialog title for theme mode selection
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// Dialog title for setting a PIN
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get pinDialogSetTitle;

  /// Label for PIN entry field
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinDialogEnterPIN;

  /// Label for PIN confirmation field
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get pinDialogConfirmPIN;

  /// Button to confirm setting PIN
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get pinDialogSet;

  /// Error message when PINs don't match
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinDialogPINsDoNotMatch;

  /// Label for PIN field in verification dialog
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pinDialogPIN;

  /// OK button in PIN dialog
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get pinDialogOK;

  /// Dialog title for notification frequency settings
  ///
  /// In en, this message translates to:
  /// **'Notification frequency'**
  String get notificationFrequencyDialogTitle;

  /// Label for notification frequency field
  ///
  /// In en, this message translates to:
  /// **'Notify every'**
  String get notificationFrequencyNotifyEvery;

  /// Suffix text for days in notification frequency
  ///
  /// In en, this message translates to:
  /// **'day(s)'**
  String get notificationFrequencyDays;

  /// Label for notification time field
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get notificationFrequencyAt;

  /// Save button in notification frequency dialog
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get notificationFrequencySave;

  /// Title for test notification
  ///
  /// In en, this message translates to:
  /// **'Positive affirmation'**
  String get notificationTestTitle;

  /// Body text for test notification
  ///
  /// In en, this message translates to:
  /// **'You will see a notification like this every {days, plural, =1 {{days} day} other {{days} days}} congratulating you on your progress!'**
  String notificationTestBody(int days);

  /// Dialog title for delete everything confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get deleteEverythingDialogTitle;

  /// Message warning about deleting all data
  ///
  /// In en, this message translates to:
  /// **'Are you sure you delete everything? This action cannot be undone.'**
  String get deleteEverythingDialogMessage;

  /// Button to confirm deleting everything
  ///
  /// In en, this message translates to:
  /// **'DELETE!'**
  String get deleteEverythingConfirm;

  /// Toast message when data is exported successfully
  ///
  /// In en, this message translates to:
  /// **'Data exported!'**
  String get dataExported;

  /// Toast message when data is imported successfully
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully!'**
  String get dataImported;

  /// Dialog title shown when data import fails
  ///
  /// In en, this message translates to:
  /// **'Import failed'**
  String get dataImportFailed;

  /// Dialog message shown when data import fails
  ///
  /// In en, this message translates to:
  /// **'The selected file could not be imported. Check that it is a valid Quitter backup and try again.'**
  String get dataImportFailedMessage;

  /// Header text in journal entry section
  ///
  /// In en, this message translates to:
  /// **'How was your day?'**
  String get journalHowWasYourDay;

  /// Placeholder text for journal entry field
  ///
  /// In en, this message translates to:
  /// **'Write about your day, thoughts, feelings, or anything you want to remember...'**
  String get journalPlaceholder;

  /// Word count display in journal
  ///
  /// In en, this message translates to:
  /// **'{count} words'**
  String journalWordCount(int count);

  /// Tooltip for previous month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Previous Month'**
  String get journalPreviousMonth;

  /// Tooltip for next month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Next Month'**
  String get journalNextMonth;

  /// Button to start quit journey
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get quitMilestonesStart;

  /// Button to reset quit journey
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get quitMilestonesReset;

  /// Label for quit date field
  ///
  /// In en, this message translates to:
  /// **'Quit date'**
  String get quitMilestonesQuitDate;

  /// Dialog title for clearing milestone
  ///
  /// In en, this message translates to:
  /// **'Clear milestone for {days} days?'**
  String quitMilestonesClearTitle(int days);

  /// Message explaining what clearing a milestone does
  ///
  /// In en, this message translates to:
  /// **'This will clear all past times you achieved the {days} day milestone.'**
  String quitMilestonesClearMessage(int days);

  /// Button to clear milestone
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get quitMilestonesClear;

  /// Message template for sharing progress
  ///
  /// In en, this message translates to:
  /// **'I\'m {days, plural, =1 {{days} day} other {{days} days}} clean from {title}!'**
  String quitMilestonesShareMessage(int days, String title);

  /// Milestone badge label for a day count
  ///
  /// In en, this message translates to:
  /// **'Day {days}'**
  String timelineMilestoneDay(int days);

  /// Milestone badge label for a year count
  ///
  /// In en, this message translates to:
  /// **'{years, plural, =1 {{years} Year} other {{years} Years}}'**
  String timelineMilestoneYears(int years);

  /// Header text for started custom entry
  ///
  /// In en, this message translates to:
  /// **'One step stronger'**
  String get entryPageHeaderStarted;

  /// Header text for not started custom entry
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get entryPageHeaderNotStarted;

  /// Subtitle text for started custom entry
  ///
  /// In en, this message translates to:
  /// **'You are doing great!'**
  String get entryPageSubtitleStarted;

  /// Subtitle text for not started custom entry
  ///
  /// In en, this message translates to:
  /// **'Tap \"Start\" to begin your journey'**
  String get entryPageSubtitleNotStarted;

  /// Page title when adding a new entry
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get editEntryAddTitle;

  /// Page title when editing an entry
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get editEntryEditTitle;

  /// Label for entry title field
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get editEntryTitle;

  /// Error message when title is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get editEntryTitleError;

  /// Label for color selection
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get editEntryColor;

  /// Label for icon selection
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get editEntryIcon;

  /// Save button in edit entry page
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editEntrySave;

  /// Dialog title for delete entry confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get editEntryDeleteDialogTitle;

  /// Message asking for delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete this entry?'**
  String get editEntryDeleteDialogMessage;

  /// No button in delete dialog
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get editEntryDeleteNo;

  /// Yes button in delete dialog
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get editEntryDeleteYes;

  /// Title text on PIN entry page
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinPageEnterPIN;

  /// Error message for incorrect PIN
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN'**
  String get pinPageIncorrectPIN;

  /// Error message when too many failed PIN attempts, showing remaining lockout seconds
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again in {seconds}s.'**
  String pinPageTooManyAttempts(int seconds);

  /// Title for about page
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutPageTitle;

  /// Label for app version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get aboutVersion;

  /// Label for app author
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get aboutAuthor;

  /// Name of the app author
  ///
  /// In en, this message translates to:
  /// **'Brandon Dick'**
  String get aboutAuthorName;

  /// Label for app license
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get aboutLicense;

  /// License type
  ///
  /// In en, this message translates to:
  /// **'MIT'**
  String get aboutLicenseMIT;

  /// Label for donate option
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get aboutDonate;

  /// Subtitle for donate option
  ///
  /// In en, this message translates to:
  /// **'Help support this project'**
  String get aboutDonateSubtitle;

  /// Label for source code link
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get aboutSourceCode;

  /// Title for what's new page
  ///
  /// In en, this message translates to:
  /// **'What\'s new?'**
  String get whatsNewTitle;

  /// Hint text for changelog search
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get whatsNewSearchHint;

  /// Button text to go to enjoying page from what's new
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get whatsNewEnjoyingButton;

  /// Title for enjoying the app page
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get enjoyingPageTitle;

  /// Option to leave a review
  ///
  /// In en, this message translates to:
  /// **'Leave a review'**
  String get enjoyingLeaveReview;

  /// Subtitle for leave a review option
  ///
  /// In en, this message translates to:
  /// **'Let me know what you think!'**
  String get enjoyingLeaveReviewSubtitle;

  /// Option to star on GitHub
  ///
  /// In en, this message translates to:
  /// **'Give us a star'**
  String get enjoyingGiveStar;

  /// Subtitle for give star option
  ///
  /// In en, this message translates to:
  /// **'Show your support on GitHub'**
  String get enjoyingGiveStarSubtitle;

  /// Option to donate
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get enjoyingDonate;

  /// Subtitle for donate option
  ///
  /// In en, this message translates to:
  /// **'Support development'**
  String get enjoyingDonateSubtitle;

  /// Page title for alcohol tracking
  ///
  /// In en, this message translates to:
  /// **'Sober & sparkling'**
  String get alcoholPageTitle;

  /// Display quit date with elapsed days.
  ///
  /// In en, this message translates to:
  /// **'{quitDate} ({days, plural, =1 {{days} day} other {{days} days}})'**
  String alcoholPageQuitDateDisplay(DateTime quitDate, int days);

  /// Header for started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Cheers to you!'**
  String get alcoholHeaderStarted;

  /// Header for not started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Sober journey ahead!'**
  String get alcoholHeaderNotStarted;

  /// Subtitle for started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Every day is a win 🥳'**
  String get alcoholSubtitleStarted;

  /// Subtitle for not started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready for a brighter you? ✨'**
  String get alcoholSubtitleNotStarted;

  /// Page title for vaping tracking
  ///
  /// In en, this message translates to:
  /// **'Vape-free victory'**
  String get vapingPageTitle;

  /// Header for started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Clear skies ahead!'**
  String get vapingHeaderStarted;

  /// Header for not started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Vape-free living!'**
  String get vapingHeaderNotStarted;

  /// Subtitle for started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Breathing easy, living free 🌬️'**
  String get vapingSubtitleStarted;

  /// Subtitle for not started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to ditch the vape? ✨'**
  String get vapingSubtitleNotStarted;

  /// Page title for smoking tracking
  ///
  /// In en, this message translates to:
  /// **'Smoke-free & soaring'**
  String get smokingPageTitle;

  /// Header for started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Breathe easy!'**
  String get smokingHeaderStarted;

  /// Header for not started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Smoke-free journey!'**
  String get smokingHeaderNotStarted;

  /// Subtitle for started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Every puff-free day is a win 🚭'**
  String get smokingSubtitleStarted;

  /// Subtitle for not started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to reclaim your health? ✨'**
  String get smokingSubtitleNotStarted;

  /// Page title for nicotine pouches tracking
  ///
  /// In en, this message translates to:
  /// **'Pouch-free Power'**
  String get nicotinePouchesPageTitle;

  /// Header for started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Fresh & free!'**
  String get nicotinePouchesHeaderStarted;

  /// Header for not started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Pouch-free progress!'**
  String get nicotinePouchesHeaderNotStarted;

  /// Subtitle for started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Embrace a brighter, healthier you ✨'**
  String get nicotinePouchesSubtitleStarted;

  /// Subtitle for not started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to ditch the pouches? 🚀'**
  String get nicotinePouchesSubtitleNotStarted;

  /// Page title for social media tracking
  ///
  /// In en, this message translates to:
  /// **'Digital detox delight'**
  String get socialMediaPageTitle;

  /// Header for started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Unplug & play!'**
  String get socialMediaHeaderStarted;

  /// Header for not started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Digital detox journey!'**
  String get socialMediaHeaderNotStarted;

  /// Subtitle for started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Real life is the best feed 💖'**
  String get socialMediaSubtitleStarted;

  /// Subtitle for not started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to reclaim your time? 🚀'**
  String get socialMediaSubtitleNotStarted;

  /// Page title for adult content tracking
  ///
  /// In en, this message translates to:
  /// **'Pornography Recovery'**
  String get pornographyPageTitle;

  /// Header for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Building lasting control'**
  String get pornographyHeaderStarted;

  /// Header for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Change problematic pornography use'**
  String get pornographyHeaderNotStarted;

  /// Subtitle for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Track triggers, control, and evidence-based milestones'**
  String get pornographySubtitleStarted;

  /// Subtitle for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'See what research supports and measure your own progress'**
  String get pornographySubtitleNotStarted;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery isn\'t linear. Every step forward matters, including this one.'**
  String get relapseMessage1;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re here, you\'re trying, and that takes real courage.'**
  String get relapseMessage2;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Setbacks don\'t erase your progress. You\'re learning and growing.'**
  String get relapseMessage3;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Each restart is proof of your strength, not a sign of weakness.'**
  String get relapseMessage4;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Tomorrow is a fresh start. You\'ve got this.'**
  String get relapseMessage5;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Your worth isn\'t defined by perfect streaks. You matter.'**
  String get relapseMessage6;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery is a journey with hills and valleys. Keep walking.'**
  String get relapseMessage7;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You had the strength to start before, and you have it again now.'**
  String get relapseMessage8;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'One moment doesn\'t define your entire journey forward.'**
  String get relapseMessage9;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Being here shows you haven\'t given up. That\'s powerful.'**
  String get relapseMessage10;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Progress isn\'t about perfection—it\'s about persistence.'**
  String get relapseMessage11;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re building resilience with every attempt. Keep building.'**
  String get relapseMessage12;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Your commitment to trying again is already a victory.'**
  String get relapseMessage13;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Healing isn\'t instant, but it\'s happening with each choice you make.'**
  String get relapseMessage14;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re not starting over—you\'re continuing with more wisdom.'**
  String get relapseMessage15;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Every expert was once a beginner. Every pro was once an amateur.'**
  String get relapseMessage16;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery happens one day at a time, sometimes one hour at a time.'**
  String get relapseMessage17;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re writing a comeback story. This is just one chapter.'**
  String get relapseMessage18;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'The fact that you\'re here means you care about yourself. Hold onto that.'**
  String get relapseMessage19;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Small steps in the right direction are still steps forward.'**
  String get relapseMessage20;

  /// Undo button text in reset snackbar
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// OK button text used in toast messages
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Alcohol milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality Begins to Improve'**
  String get alcoholMilestone1Title;

  /// Alcohol milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your REM sleep cycles start to normalize within the first day. While alcohol might help you fall asleep initially, it disrupts deep sleep and REM cycles throughout the night, causing fragmented sleep.'**
  String get alcoholMilestone1Description;

  /// Alcohol milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Hydration Levels Restore'**
  String get alcoholMilestone3Title;

  /// Alcohol milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your kidneys are recovering from alcohol\'s diuretic effects. Alcohol suppresses antidiuretic hormone, leading to increased urination and dehydration. By day 3, your body\'s fluid balance is improving significantly.'**
  String get alcoholMilestone3Description;

  /// Alcohol milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Immune System Strengthens'**
  String get alcoholMilestone7Title;

  /// Alcohol milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Your white blood cells are recovering their function. Even a single bout of heavy drinking can impair immune function for up to 24 hours, and chronic drinking significantly weakens your body\'s ability to fight infections.'**
  String get alcoholMilestone7Description;

  /// Alcohol milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Brain Volume Recovery Begins'**
  String get alcoholMilestone14Title;

  /// Alcohol milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Brain volume begins recovering within the first two weeks. Thinking and memory keep improving over the following months.'**
  String get alcoholMilestone14Description;

  /// Alcohol milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Normalizes'**
  String get alcoholMilestone30Title;

  /// Alcohol milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your cardiovascular system shows significant improvement. Regular alcohol consumption elevates blood pressure, but abstinence for about a month can help bring blood pressure back to healthier levels.'**
  String get alcoholMilestone30Description;

  /// Alcohol milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Liver Function Improves'**
  String get alcoholMilestone60Title;

  /// Alcohol milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Your liver shows measurable improvement in function. This regenerative organ can recover significantly from alcohol-induced damage, with liver enzymes and fat accumulation showing improvement within 2 months of abstinence.'**
  String get alcoholMilestone60Description;

  /// Alcohol milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Thinking and Memory Improve Substantially'**
  String get alcoholMilestone90Title;

  /// Alcohol milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'The first three months bring major gains in memory, concentration, and decision-making, with recovery continuing across the following months.'**
  String get alcoholMilestone90Description;

  /// Alcohol milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Brain Volume and Function Continue Recovery'**
  String get alcoholMilestone180Title;

  /// Alcohol milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Six months sober gives the brain sustained time to recover. Brain volume and thinking skills continue to improve.'**
  String get alcoholMilestone180Description;

  /// Alcohol milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Cancer Risk Reduction May Begin'**
  String get alcoholMilestone365Title;

  /// Alcohol milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One year of abstinence may begin to reduce cancer risk. While alcohol clearly increases risk for several cancers (liver, breast, colorectal, esophageal), research on risk reduction timeline is still emerging and varies by cancer type.'**
  String get alcoholMilestone365Description;

  /// Smoking milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Carbon Monoxide Clears'**
  String get smokingMilestone1Title;

  /// Smoking milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn\'t have to work overtime anymore to pump poisoned blood around your body.'**
  String get smokingMilestone1Description;

  /// Smoking milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Withdrawal Peaks'**
  String get smokingMilestone3Title;

  /// Smoking milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'The nicotine monster is at its angriest, but you\'re winning the battle! All nicotine has left your system. The worst cravings happen now, but they\'re also your ticket to freedom on the other side.'**
  String get smokingMilestone3Description;

  /// Smoking milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Dramatically Improve'**
  String get smokingMilestone7Title;

  /// Smoking milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you\'re rediscovering flavors you forgot existed. Prepare for some serious food appreciation!'**
  String get smokingMilestone7Description;

  /// Smoking milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation & Walking Improve'**
  String get smokingMilestone14Title;

  /// Smoking milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren\'t looking so intimidating anymore, are they?'**
  String get smokingMilestone14Description;

  /// Smoking milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Lung Function Increases'**
  String get smokingMilestone30Title;

  /// Smoking milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases significantly, and that smoker\'s cough is history.'**
  String get smokingMilestone30Description;

  /// Smoking milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Heart Attack Risk Drops Significantly'**
  String get smokingMilestone90Title;

  /// Smoking milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is sending love letters! Three months smoke-free and your cardiovascular risk has already dropped substantially. Your cardiovascular system is healing faster than you might think possible.'**
  String get smokingMilestone90Description;

  /// Smoking milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Immune System Strengthens'**
  String get smokingMilestone180Title;

  /// Smoking milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.'**
  String get smokingMilestone180Description;

  /// Smoking milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Stroke Risk Reduces Significantly'**
  String get smokingMilestone365Title;

  /// Smoking milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One full year of freedom! Your stroke risk has decreased substantially, and your blood vessels are healing beautifully. You\'ve officially given your brain the gift of better circulation and protection.'**
  String get smokingMilestone365Description;

  /// Smoking milestone day 1825 title
  ///
  /// In en, this message translates to:
  /// **'Cancer Risk Plummets (5 Years)'**
  String get smokingMilestone1825Title;

  /// Smoking milestone day 1825 description
  ///
  /// In en, this message translates to:
  /// **'Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.'**
  String get smokingMilestone1825Description;

  /// Vaping milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Cravings Peak'**
  String get vapingMilestone1Title;

  /// Vaping milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your brain is throwing a nicotine tantrum, but you\'re already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they\'re also the most important to push through.'**
  String get vapingMilestone1Description;

  /// Vaping milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Breathing Improves'**
  String get vapingMilestone3Title;

  /// Vaping milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.'**
  String get vapingMilestone3Description;

  /// Vaping milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Return'**
  String get vapingMilestone7Title;

  /// Vaping milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.'**
  String get vapingMilestone7Description;

  /// Vaping milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation Improves'**
  String get vapingMilestone14Title;

  /// Vaping milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!'**
  String get vapingMilestone14Description;

  /// Vaping milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Lung Function Recovery'**
  String get vapingMilestone30Title;

  /// Vaping milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!'**
  String get vapingMilestone30Description;

  /// Vaping milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Anxiety Levels Normalize'**
  String get vapingMilestone60Title;

  /// Vaping milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Plot twist: vaping was making anxiety worse, not better! Two months in, your usual anxiety level is lower and your nervous system is settling.'**
  String get vapingMilestone60Description;

  /// Vaping milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Focus and Memory Sharpen'**
  String get vapingMilestone90Title;

  /// Vaping milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Brain fog has left the building! Three months without nicotine and your focus, memory, and clear thinking are markedly better. It\'s like upgrading your mental RAM.'**
  String get vapingMilestone90Description;

  /// Vaping milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Oral Health Recovery'**
  String get vapingMilestone180Title;

  /// Vaping milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.'**
  String get vapingMilestone180Description;

  /// Vaping milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Cardiovascular Risk Reduction'**
  String get vapingMilestone365Title;

  /// Vaping milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine\'s daily assault course.'**
  String get vapingMilestone365Description;

  /// Social media milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Digital Detox Day One! 🎯'**
  String get socialMediaMilestone1Title;

  /// Social media milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you\'re already breaking the cycle - go you!'**
  String get socialMediaMilestone1Description;

  /// Social media milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'FOMO? More Like FO-NO! 😎'**
  String get socialMediaMilestone3Title;

  /// Social media milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Three days in and those anxious \'what am I missing?\' thoughts are already fading. You\'re training your brain that real life is way more interesting than curated feeds!'**
  String get socialMediaMilestone3Description;

  /// Social media milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Attention Span: Goldfish → Human 🧠'**
  String get socialMediaMilestone7Title;

  /// Social media milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you\'re teaching yours to find rewards elsewhere!'**
  String get socialMediaMilestone7Description;

  /// Social media milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Like a Baby (Not a Zombie) 😴'**
  String get socialMediaMilestone14Title;

  /// Social media milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.'**
  String get socialMediaMilestone14Description;

  /// Social media milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Real Friends > Fake Likes 💝'**
  String get socialMediaMilestone30Title;

  /// Social media milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'One month offline = significant reductions in loneliness and depression! Research proves that limiting social media creates major mental health improvements. You\'ve gone even further!'**
  String get socialMediaMilestone30Description;

  /// Social media milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Comparison Trap: ESCAPED! ✨'**
  String get socialMediaMilestone60Title;

  /// Social media milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You\'ve broken free from the comparison trap!'**
  String get socialMediaMilestone60Description;

  /// Social media milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Hobby Collector Level: Expert 🎨'**
  String get socialMediaMilestone90Title;

  /// Social media milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Three months = roughly 270+ hours reclaimed! That\'s enough time to learn a skill, read 15+ books, or get deep into a hobby. Your brain strengthens the habits you repeat, so those offline routines are becoming easier and more automatic.'**
  String get socialMediaMilestone90Description;

  /// Social media milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Mental Health Glow-Up Complete 🌟'**
  String get socialMediaMilestone180Title;

  /// Social media milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Six months offline and you\'re officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You\'re living proof that life\'s better in the real world!'**
  String get socialMediaMilestone180Description;

  /// Social media milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Digital Zen Master Achieved 🏆'**
  String get socialMediaMilestone365Title;

  /// Social media milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One full year of intentional living! You\'ve reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren\'t meant for sharing - they\'re meant for experiencing. You\'re officially a digital wellness legend!'**
  String get socialMediaMilestone365Description;

  /// Nicotine pouches milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Begin Recovery'**
  String get nicotinePouchesMilestone1Title;

  /// Nicotine pouches milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Nicotine dulls your taste buds and smell receptors. After just 24 hours without pouches, these senses start their comeback tour! Food is about to taste amazing again.'**
  String get nicotinePouchesMilestone1Description;

  /// Nicotine pouches milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Completely Cleared'**
  String get nicotinePouchesMilestone3Title;

  /// Nicotine pouches milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.'**
  String get nicotinePouchesMilestone3Description;

  /// Nicotine pouches milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Oral Health Improves'**
  String get nicotinePouchesMilestone7Title;

  /// Nicotine pouches milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.'**
  String get nicotinePouchesMilestone7Description;

  /// Nicotine pouches milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation Enhancement'**
  String get nicotinePouchesMilestone14Title;

  /// Nicotine pouches milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!'**
  String get nicotinePouchesMilestone14Description;

  /// Nicotine pouches milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Stress Response Normalizes'**
  String get nicotinePouchesMilestone30Title;

  /// Nicotine pouches milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Plot twist: nicotine actually increases stress between uses! Your cortisol and stress response are returning to normal. Real relaxation, not the nicotine fake-out.'**
  String get nicotinePouchesMilestone30Description;

  /// Nicotine pouches milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality Improves'**
  String get nicotinePouchesMilestone60Title;

  /// Nicotine pouches milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.'**
  String get nicotinePouchesMilestone60Description;

  /// Nicotine pouches milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Dopamine Receptors Recover'**
  String get nicotinePouchesMilestone90Title;

  /// Nicotine pouches milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your brain\'s reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life\'s natural joys are vibrant again.'**
  String get nicotinePouchesMilestone90Description;

  /// Nicotine pouches milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Cardiovascular Risk Drops'**
  String get nicotinePouchesMilestone180Title;

  /// Nicotine pouches milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.'**
  String get nicotinePouchesMilestone180Description;

  /// Nicotine pouches milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Long-term Health Secured'**
  String get nicotinePouchesMilestone365Title;

  /// Nicotine pouches milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One year of freedom! Your risk of nicotine-related health issues continues to plummet. You\'ve broken the addiction cycle and reclaimed your autonomy. That\'s genuinely heroic! 🏆'**
  String get nicotinePouchesMilestone365Description;

  /// Pornography milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Taking Back Control'**
  String get pornographyMilestone1Title;

  /// Pornography milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Problematic pornography use is defined by impaired control and resulting distress or impairment. One day matters because you have already interrupted the old pattern once and started identifying what triggers it.'**
  String get pornographyMilestone1Description;

  /// Pornography milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Know Your Urges'**
  String get pornographyMilestone3Title;

  /// Pornography milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'People with more severe problematic use commonly report intrusive sexual thoughts, difficult-to-control desire, irritability, mood shifts, and sleep problems. Day three is a useful point to name which of those are actually happening for you.'**
  String get pornographyMilestone3Description;

  /// Pornography milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'One Week: Trial Evidence'**
  String get pornographyMilestone7Title;

  /// Pornography milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'In a randomized 7-day abstinence study, regular users showed no overall withdrawal syndrome. An exploratory subgroup with both high problematic use and daily viewing had more craving, so a rough first week is possible but not inevitable.'**
  String get pornographyMilestone7Description;

  /// Pornography milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Map Your Triggers'**
  String get pornographyMilestone14Title;

  /// Pornography milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Two weeks gives you repeated exposure to the situations that used to cue pornography. Research links problematic use with factors including craving, stress, avoidance, loneliness, and coping style; knowing your own pattern gives you something concrete to change.'**
  String get pornographyMilestone14Description;

  /// Pornography milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'A Month of Control'**
  String get pornographyMilestone30Title;

  /// Pornography milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'A month is a meaningful test of control. In a 14,581-person study, sexual-function problems were associated more strongly with problematic use than with simple viewing frequency, so regaining control is the more evidence-based target.'**
  String get pornographyMilestone30Description;

  /// Pornography milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Change Can Hold'**
  String get pornographyMilestone90Title;

  /// Pornography milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'A randomized ACT trial for problematic pornography use found large reductions in viewing after 12 sessions, with substantial reductions still present at 3-month follow-up. Durable change is realistic, especially when you build structured skills instead of relying only on willpower.'**
  String get pornographyMilestone90Description;

  /// Pornography milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Six-Month Stability'**
  String get pornographyMilestone180Title;

  /// Pornography milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'A randomized CBT study for out-of-control sexual behaviour found improvements in symptoms, sexual compulsivity, and well-being that remained stable at 3- and 6-month follow-up. Long-term control can be maintained.'**
  String get pornographyMilestone180Description;

  /// Pornography milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'One Year: Durable Change'**
  String get pornographyMilestone365Title;

  /// Pornography milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One-year follow-up data from an acceptance-based treatment study found participants did not return to pretreatment hypersexuality levels. A year of maintained change is credible evidence of a durable pattern, not a magical brain-reset date.'**
  String get pornographyMilestone365Description;

  /// Pornography milestone day 1825 title
  ///
  /// In en, this message translates to:
  /// **'Five Years of Control'**
  String get pornographyMilestone1825Title;

  /// Pornography milestone day 1825 description
  ///
  /// In en, this message translates to:
  /// **'Five years is long-term maintenance. CSBD is clinically defined by persistent loss of control with distress or impairment, so maintaining control and functioning well over years is a meaningful outcome in its own right.'**
  String get pornographyMilestone1825Description;

  /// Custom milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Initial Recovery Phase Begins'**
  String get customMilestone1Title;

  /// Custom milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your body starts the healing process! Within 24 hours of quitting, your system begins to clear toxins and adjust to functioning without addictive substances. Sleep disturbances are common but part of the recovery process.'**
  String get customMilestone1Description;

  /// Custom milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Symptoms Peak'**
  String get customMilestone3Title;

  /// Custom milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'You\'re facing the storm head-on! Physical withdrawal symptoms typically peak around day 3 for many substances, including anxiety, mood swings, and physical discomfort. This means you\'re getting through the hardest part.'**
  String get customMilestone3Description;

  /// Custom milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Acute Withdrawal Phase Ending'**
  String get customMilestone7Title;

  /// Custom milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'The worst is behind you! After one week, acute withdrawal symptoms begin to subside for most substances. Your body is adjusting to its new normal and starting to stabilize.'**
  String get customMilestone7Description;

  /// Custom milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Early Recovery Stabilization'**
  String get customMilestone14Title;

  /// Custom milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your mind is clearing! Two weeks of sobriety often brings improved mental clarity and reduced cravings as your brain begins to adapt to functioning without addictive substances.'**
  String get customMilestone14Description;

  /// Custom milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'One Month Milestone'**
  String get customMilestone30Title;

  /// Custom milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'A major victory! Thirty days of sobriety represents significant progress. Many people find that sleep patterns, mood, and energy levels continue to improve during this period.'**
  String get customMilestone30Description;

  /// Custom milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Three Month Recovery Milestone'**
  String get customMilestone90Title;

  /// Custom milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your commitment is paying off! Three months of recovery represents a significant achievement. Post-acute withdrawal symptoms typically begin to fade, and many people report feeling more like themselves again.'**
  String get customMilestone90Description;

  /// Custom milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Six Month Recovery Achievement'**
  String get customMilestone180Title;

  /// Custom milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'You\'re building lasting change! Six months of sobriety often brings continued improvements in physical health, emotional stability, and overall quality of life as your body continues healing.'**
  String get customMilestone180Description;

  /// Custom milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'One Year of Recovery'**
  String get customMilestone365Title;

  /// Custom milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'An incredible achievement! One year of sobriety represents a major life milestone. Many people experience significant improvements in physical health, relationships, and overall well-being by this point.'**
  String get customMilestone365Description;

  /// Custom milestone day 730 title
  ///
  /// In en, this message translates to:
  /// **'Two Years of Sustained Recovery'**
  String get customMilestone730Title;

  /// Custom milestone day 730 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve built a new life! Two years of recovery demonstrates remarkable resilience and commitment. Long-term sobriety often brings profound positive changes in all areas of life and significantly reduced risk of relapse.'**
  String get customMilestone730Description;

  /// Label showing when a milestone reference was retrieved
  ///
  /// In en, this message translates to:
  /// **'Retrieved {date}'**
  String milestoneRetrieved(String date);

  /// Progress notification title
  ///
  /// In en, this message translates to:
  /// **'No {name}'**
  String notificationProgressTitle(String name);

  /// Progress notification body
  ///
  /// In en, this message translates to:
  /// **'{days} days clean — {message}'**
  String notificationProgressBody(int days, String message);

  /// No description provided for @notificationProgressMessage1.
  ///
  /// In en, this message translates to:
  /// **'Keep up the amazing work!'**
  String get notificationProgressMessage1;

  /// No description provided for @notificationProgressMessage2.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great!'**
  String get notificationProgressMessage2;

  /// No description provided for @notificationProgressMessage3.
  ///
  /// In en, this message translates to:
  /// **'Incredible dedication!'**
  String get notificationProgressMessage3;

  /// No description provided for @notificationProgressMessage4.
  ///
  /// In en, this message translates to:
  /// **'Celebrating your strength!'**
  String get notificationProgressMessage4;

  /// No description provided for @notificationProgressMessage5.
  ///
  /// In en, this message translates to:
  /// **'Keep shining!'**
  String get notificationProgressMessage5;

  /// No description provided for @notificationProgressMessage6.
  ///
  /// In en, this message translates to:
  /// **'Awesome job!'**
  String get notificationProgressMessage6;

  /// No description provided for @notificationProgressMessage7.
  ///
  /// In en, this message translates to:
  /// **'Way to go!'**
  String get notificationProgressMessage7;

  /// No description provided for @notificationProgressMessage8.
  ///
  /// In en, this message translates to:
  /// **'You\'re a true champion!'**
  String get notificationProgressMessage8;

  /// No description provided for @notificationProgressMessage9.
  ///
  /// In en, this message translates to:
  /// **'Remarkable effort!'**
  String get notificationProgressMessage9;

  /// No description provided for @notificationProgressMessage10.
  ///
  /// In en, this message translates to:
  /// **'Stay strong!'**
  String get notificationProgressMessage10;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications for daily progress reminders'**
  String get notificationChannelDescription;

  /// No description provided for @notificationOpenAction.
  ///
  /// In en, this message translates to:
  /// **'Open notification'**
  String get notificationOpenAction;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Rename dialog title and badge tooltip
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @alcoholReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'What Happens to Your Sleep When You Stop Drinking?\n\nSource: \"Alcohol and the Sleeping Brain\" (Colrain, Nicholas & Baker), Handbook of Clinical Neurology — peer-reviewed, NIH-hosted\n\nAlcohol and Sleep Architecture\nAlcohol is sedating, so it shortens the time it takes to fall asleep and increases deep slow-wave sleep in the first half of the night. But it comes at a cost: alcohol suppresses REM (rapid eye movement) sleep — the restorative stage tied to memory consolidation and emotional regulation — and fragments sleep in the second half of the night as it is metabolised.\n\nThe First Night Off Alcohol\nBecause alcohol suppresses REM dream sleep, the first nights without it often bring a REM rebound: vivid dreams and lighter, broken sleep while normal sleep patterns return. This is a normal, temporary part of recovery.\n\nRecovery Begins\nAs the brain readjusts over the following days and weeks, REM and overall sleep quality improve. Sleep disturbance is one of the most persistent withdrawal-related symptoms, but it trends toward normal with sustained abstinence.\n\nA Note on Heavy Drinking\nFor heavy or long-term daily drinkers, the first 24 hours can also bring withdrawal symptoms (anxiety, sweating, tremor, nausea). Severe withdrawal can be dangerous — if you have been drinking heavily every day, talk to a doctor before stopping abruptly.'**
  String get alcoholReferenceDay1;

  /// No description provided for @alcoholReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'The Acute Phase and Early Recovery\n\nSource: \"Alcohol Withdrawal,\" StatPearls — peer-reviewed, NIH National Library of Medicine\n\nThe First 24–72 Hours\nStatPearls documents that withdrawal symptoms appear within hours of the last drink — tremor, insomnia, agitation, sweating, raised heart rate and blood pressure — and that symptoms typically peak around 72 hours. Most people are over the worst of the acute phase by the end of day three. Severe withdrawal (seizures, or delirium tremens, which StatPearls notes can occur at any point up to 3 to 5 days after stopping or cutting down) is a medical emergency: heavy daily drinkers should not stop abruptly without medical advice.\n\nCravings Come in Waves\nCravings often intensify across the first several days, but an individual craving is short-lived — usually passing within minutes. Recognising that each wave subsides on its own makes them easier to ride out.\n\nHydration Recovers\nAlcohol suppresses antidiuretic hormone (ADH), making the kidneys excrete more water and leaving regular drinkers chronically dehydrated. Once drinking stops, this diuretic effect ends and fluid balance begins to recover over the first few days — often noticed as clearer skin and steadier energy.\n\nMind and Sleep Begin to Settle\nAs the acute phase passes, the brain chemistry that alcohol disrupted (GABA and glutamate) starts to rebalance. Mental clarity improves and sleep — badly fragmented during early withdrawal — begins trending toward better quality over the first week.'**
  String get alcoholReferenceDay3;

  /// No description provided for @alcoholReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'How the Immune System Recovers\n\nSource: \"Alcohol and the Immune System\" (Sarkar, Jung & Wang), Alcohol Research: Current Reviews — peer-reviewed, NIH-hosted\n\nHow Alcohol Weakens Immunity\nAlcohol weakens the immune system in several ways. Even one heavy drinking session can reduce infection-fighting ability for up to 24 hours. Long-term use reduces white blood cells, disrupts immune signals, and damages gut and lung defences, increasing the risk of infections and slow wound healing.\n\nRemoving the Insult\nMany of these effects improve once alcohol is gone. White blood cells and immune signalling begin to recover, while the gut and airway defences start repairing. Within the first week, your immune system is no longer being knocked down daily and resistance to common infections begins to improve.\n\nA Gradual Process\nFull immune recovery takes longer than a week, and the degree of repair depends on how heavy and prolonged the drinking was — but the first week off alcohol is where the rebuilding begins.'**
  String get alcoholReferenceDay7;

  /// No description provided for @alcoholReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Early Brain Recovery in Abstinence\n\nSource: Bartsch AJ et al., \"Manifestations of early brain recovery associated with abstinence from alcoholism,\" Brain (2007) — peer-reviewed\n\nMeasuring Recovery\nThis study used MRI to follow recently detoxified people with alcohol dependence through the first weeks of abstinence, comparing them with healthy controls. It captured the brain physically rebuilding once drinking stopped.\n\nBrain Volume Rebounds\nChronic alcohol use shrinks the brain — partly through reversible reduction in cell size, not only permanent cell loss. With abstinence, the researchers measured an average global brain-volume gain of nearly 2%, concentrated around the cerebellum, midbrain, ventricles and frontal regions. Much of this regrowth happens early, in the first couple of weeks off alcohol.\n\nCerebellum and Attention\nRecovery was especially clear in brain areas used for movement and attention. A marker of brain-cell health rose alongside measurable improvements in attention, so the physical healing came with real gains in thinking.\n\nA Foundation, Not the Finish\nHigher functions such as complex reasoning recover more gradually, but the first two weeks establish that the brain begins healing quickly once alcohol is removed.'**
  String get alcoholReferenceDay14;

  /// No description provided for @alcoholReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Falls When You Cut Out Alcohol\n\nSource: Roerecke et al., \"The effect of a reduction in alcohol consumption on blood pressure: a systematic review and meta-analysis,\" Lancet Public Health (2017) — peer-reviewed\n\nThe Evidence\nThis meta-analysis pooled 36 randomised trials (about 2,865 participants) testing what happens to blood pressure when people drink less. It found a clear, dose-dependent effect: the more someone cut back, the more their blood pressure dropped.\n\nHow Big Is the Effect?\nPeople who drank two or fewer drinks a day saw no significant blood-pressure change from cutting back. Above that threshold, the effect was dose-dependent: it was strongest in people drinking six or more drinks a day who cut their intake by about half, where systolic blood pressure fell by about 5.5 mmHg and diastolic by about 4.0 mmHg on average. A reduction of that size is clinically meaningful — comparable to some blood-pressure medications and enough to lower long-term stroke and heart-disease risk.\n\nWhy One Month Matters\nAlcohol raises blood pressure by activating the stress response, raising cortisol and stiffening blood vessels. The trials in this review show the benefit emerges over weeks of sustained reduction — so by around a month of abstinence, a heavier drinker\'s blood pressure has had time to settle toward a healthier level.\n\nA Threshold Effect\nThe review found a clear threshold: benefit was concentrated in people drinking more than two drinks a day, and grew progressively larger the heavier the prior drinking. If you were a lighter drinker, don\'t expect this specific blood-pressure benefit — but heavier drinkers get a real, measurable cardiovascular payoff from stopping.'**
  String get alcoholReferenceDay30;

  /// No description provided for @alcoholReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Liver Recovery After You Stop Drinking\n\nSource: National Institute on Alcohol Abuse and Alcoholism (NIAAA), \"Alcohol\'s Effects on the Body\"\n\nHow Alcohol Damages the Liver\nThe liver processes most of the alcohol you drink, and it takes the brunt of the damage. NIAAA describes a progression of alcohol-related liver injury: it begins with fatty liver (steatosis — fat building up in liver cells), can advance to alcoholic hepatitis (inflammation), and with prolonged heavy use to fibrosis and cirrhosis (scarring).\n\nThe Earlier Stages Are Reversible\nThe crucial point is that the liver is highly regenerative, and the early stages of this damage can improve when drinking stops. Fatty liver in particular often resolves with sustained abstinence. By around two months alcohol-free, the liver has had real time to clear fat deposits, calm inflammation, and restore healthier function — typically reflected in falling liver-enzyme levels (ALT and AST).\n\nBeyond the Liver\nNIAAA notes alcohol also strains the heart, pancreas and immune system. Giving the body a sustained break from alcohol lets these systems recover too — contributing to the steadier energy and better overall health many people notice by this stage.'**
  String get alcoholReferenceDay60;

  /// No description provided for @alcoholReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Thinking and Memory After Three Months Sober\n\nSource: Systematic review of neuropsychological recovery following abstinence from alcohol (PubMed Central, 2024) — peer-reviewed\n\nWhat the Evidence Shows\nThis review combined studies that tracked how thinking and memory recover after people stop drinking. Most skills move toward normal within roughly six to twelve months, and some improve earlier.\n\nWhat Improves First\nTwo specific abilities stand out as recovering earlier than the rest: basic processing speed (the review found this typically recovers by about one month, though accuracy on more complex tasks lags behind) and working memory updating. By around the three-month mark, many people already notice these lifting.\n\nWhat Takes Longer\nAttention, planning, decision-making, impulse control, perception, and memory keep improving across the six-to-twelve-month recovery window.\n\nWhat Influences Recovery\nThe review notes recovery is shaped by factors such as age, smoking status and premorbid ability — but, encouragingly, not consistently by the total amount previously drunk. Recovery is the expected trajectory.\n\nWhy It Matters\nClearer thinking is practical recovery: better attention and decision-making help people stay in treatment and avoid relapse.'**
  String get alcoholReferenceDay90;

  /// No description provided for @alcoholReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Brain Recovery at Six Months of Sobriety\n\nSource: Peer-reviewed review of structural and functional brain recovery during abstinence from substance use (PubMed Central)\n\nRecovery Keeps Going\nThe early brain-volume rebound of the first weeks is only the beginning. This review documents that with sustained abstinence the brain continues to recover structurally and functionally — grey matter recovers and damaged white-matter pathways that coordinate communication between brain regions repair over months.\n\nThe Front of the Brain\nRecovery is especially important in the front of the brain, which handles judgment, planning, and self-control. As it heals, decision-making and impulse control strengthen.\n\nBrain Rewiring and Function\nAlongside physical repair, brain function and connections recover too. The brain can rewire and relearn, which makes sustained abstinence a powerful time for therapy and new habits.\n\nRecovery Signal\nBy six months, brain structure and function are clearly moving toward a healthier normal. Staying abstinent gives that recovery more time to build.'**
  String get alcoholReferenceDay180;

  /// No description provided for @alcoholReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'Alcohol, Cancer Risk, and Stopping\n\nSource: National Cancer Institute (NCI), \"Alcohol and Cancer Risk\"\n\nAlcohol Causes Cancer\nThe NCI states there is a strong scientific consensus that drinking alcohol can cause cancer. Alcohol is linked to cancers of the mouth (oral cavity), pharynx (throat), larynx (voice box), oesophagus, liver, breast, and colon and rectum. The more a person drinks — and the longer they drink — the higher the risk.\n\nHow Alcohol Drives Cancer\nMechanisms include acetaldehyde, a toxic breakdown product of alcohol that damages DNA; oxidative stress and inflammation; impaired absorption of protective nutrients; and, for breast cancer, raised oestrogen levels.\n\nRisk Falls After You Stop\nImportantly, the NCI reports that quitting drinking is associated with lower risk over time — studies show the elevated risk of cancers of the oral cavity and oesophagus declines after stopping, though it can take years to approach the risk of someone who never drank. One year alcohol-free is a meaningful step on that path.\n\nCompounding Benefits\nReaching a year also locks in the cardiovascular and liver gains of abstinence — lower blood pressure, reduced arrhythmia risk, and continued liver healing — alongside the falling cancer risk.'**
  String get alcoholReferenceDay365;

  /// No description provided for @pornographyReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Day One: Taking Back Control\n\nSource: Kraus et al., Compulsive sexual behaviour disorder in the ICD-11, World Psychiatry (2018).\n\nThe clinically important problem is not pornography use by itself. Compulsive Sexual Behaviour Disorder is defined around persistent difficulty controlling repetitive sexual behaviour when that pattern causes significant distress or impairment. Problematic pornography use can be one presentation of that broader problem.\n\nThat makes day one concrete rather than mystical: you have interrupted a behaviour you had decided was out of control. One completed day does not prove a brain and nerve reset, but it does give you the first real observation of when urges appear, what situations trigger them, and what you can do instead.\n\nIf your use was not distressing, impairing, or difficult to control, the clinical CSBD framework may not apply to you. These milestones are aimed at people who are deliberately changing problematic or compulsive use.'**
  String get pornographyReferenceDay1;

  /// No description provided for @pornographyReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Day Three: Know What an Urge Can Look Like\n\nSource: Lewczuk et al., Withdrawal and tolerance as related to compulsive sexual behavior disorder and problematic pornography use, Journal of Behavioral Addictions (2022).\n\nIn a preregistered nationally representative Polish sample of 1,541 adults, stronger self-reported withdrawal-like experiences were associated with greater CSBD and problematic-pornography-use severity. Among participants with problematic pornography use, commonly reported experiences included difficult-to-stop sexual thoughts, difficult-to-control desire, increased arousal, irritability, mood changes, and sleep problems.\n\nRestlessness, intrusive sexual thoughts, strong urges, and irritability are documented in people with more severe problematic use. If they show up around day three, treat them as a real withdrawal-like pattern and manage the triggers.\n\nWrite down which urges are actually happening, what preceded them, and what response helped. Recovery gets easier to steer when the trigger is named rather than treated as a mysterious brain event.'**
  String get pornographyReferenceDay3;

  /// No description provided for @pornographyReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week: What a Randomized Abstinence Study Found\n\nSource: Effects of a 7-Day Pornography Abstinence Period on Withdrawal-Related Symptoms in Regular Pornography Users, Archives of Sexual Behavior (2023).\n\nResearchers randomized 176 regular pornography users either to attempt seven days of abstinence or to continue as usual. Across the full sample, abstinence did not produce a significant overall increase in craving, negative mood, or withdrawal symptoms.\n\nAn exploratory analysis did find increased craving among people who combined high problematic-use scores with daily pornography use before the study. That result needs replication, but it is useful: a difficult first week can be real for heavier problematic users, while a universal pornography withdrawal syndrome is not supported by this trial.\n\nIf you have made it through a week, you now have better evidence about your own pattern than any generic internet timeline can provide.'**
  String get pornographyReferenceDay7;

  /// No description provided for @pornographyReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Map the Triggers That Actually Matter\n\nSource: Biopsychosocial Determinants of Problematic Pornography Use: A Systematic Review (2023).\n\nThis review synthesized 66 studies and found that problematic pornography use is associated with a mix of factors rather than one simple dopamine mechanism. Repeatedly identified psychological and social factors included craving, stress, avoidance, loneliness, self-esteem, negative beliefs, and coping style.\n\nTwo weeks gives you repeated exposure to weekdays, weekends, boredom, stress, privacy, devices, and other contexts that may have cued the old behaviour. Use that data. If stress is the trigger, design a stress response. If loneliness is the trigger, add contact. If easy access is the trigger, change the environment.\n\nThe evidence supports working on the drivers of problematic use; it does not require pretending that every person follows the same biological countdown.'**
  String get pornographyReferenceDay14;

  /// No description provided for @pornographyReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month: Control Matters More Than a Simple Frequency Count\n\nSource: Bőthe et al., Are sexual functioning problems associated with frequent pornography use and/or problematic pornography use?, Addictive Behaviors (2021).\n\nIn a community sample of 14,581 adults, problematic pornography use had a moderate positive association with sexual-functioning problems in both men and women. Pornography-use frequency by itself showed a weak negative association with those problems.\n\nThat distinction matters. The evidence does not support telling every pornography user that viewing frequency alone damages sexual function. The more clinically relevant target is loss of control and the problems surrounding that pattern.\n\nAt one month, compare life now with when you started: preoccupation, time lost, ability to stop, sexual functioning, relationship conflict, and distress. Those changes matter more than waiting for a mythical day-30 brain reset.'**
  String get pornographyReferenceDay30;

  /// No description provided for @pornographyReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Durable Change Is Possible\n\nSource: Crosby & Twohig, Acceptance and Commitment Therapy for Problematic Internet Pornography Use: A Randomized Trial, Behavior Therapy (2016).\n\nThis small randomized trial compared a 12-session ACT program with a waitlist in 28 adult men. Pornography viewing fell much more in the ACT group at the end of treatment, and substantial reductions remained at the three-month follow-up.\n\nThe study does not prove that 90 days of abstinence alone causes the same result, and its sample was small and demographically narrow. What it does demonstrate is important: problematic pornography use is modifiable, and structured skills can produce changes that persist beyond the immediate treatment period.\n\nIf your progress still depends mostly on white-knuckling, three months is a good point to strengthen the system around it: trigger plans, acceptance of urges without acting, environmental friction, accountability, and therapy when needed.'**
  String get pornographyReferenceDay90;

  /// No description provided for @pornographyReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Long-Term Symptom Control Can Hold\n\nSource: Hallberg et al., A Randomized Controlled Study of Group-Administered Cognitive Behavioral Therapy for Hypersexual Disorder in Men, Journal of Sexual Medicine (2019).\n\nIn 137 men with out-of-control sexual behaviour, seven weeks of group CBT produced greater reductions in hypersexual symptoms and sexual compulsivity than a waitlist, along with improved psychiatric well-being. The treatment gains remained stable at both three- and six-month follow-up.\n\nThis study covered hypersexual disorder more broadly rather than pornography abstinence alone, so it should not be turned into a claim that every person is biologically recovered at six months. It does support a stronger and more useful statement: sustained improvement in compulsive sexual behaviour can remain stable over this length of time.\n\nSix months is therefore a maintenance milestone. Keep the routines that made control easier instead of treating the date as permission to dismantle them.'**
  String get pornographyReferenceDay180;

  /// No description provided for @pornographyReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year: Evidence for Durable Behaviour Change\n\nSource: One-year follow-up effects of an acceptance-based treatment for hypersexuality (2026).\n\nAt one-year follow-up, participants in this acceptance-based treatment study had not returned to their pretreatment levels of hypersexuality. The authors described the findings as preliminary evidence of durable, clinically meaningful benefits, with perceived control over craving among the processes followed over time.\n\nThis is treatment follow-up evidence, not proof of a one-year brain reset. The meaningful claim is better anyway: clinically relevant control can persist for a year rather than disappearing as soon as the initial intervention ends.\n\nA year of your own maintained change is also a large personal dataset. Compare current control, distress, functioning, relationships, and time use with where you started; those are the outcomes that matter clinically.'**
  String get pornographyReferenceDay365;

  /// No description provided for @pornographyReferenceDay1825.
  ///
  /// In en, this message translates to:
  /// **'Five Years: Long-Term Control Is the Outcome\n\nSource: Compulsive sexual behavior disorder and problematic pornography use: a comprehensive interdisciplinary expert-informed review (2026).\n\nModern reviews treat CSBD and problematic pornography use as complex problems involving control, distress, functioning, context, and individual differences. There is no validated five-year brain and nerve reset threshold.\n\nBut five years is not an empty milestone. It is 1,825 days of maintaining the behavioural direction you chose. Because the clinical problem is persistent loss of control with distress or impairment, sustained control and restored functioning over years are meaningful outcomes in their own right.\n\nAt this stage, the useful question is no longer whether your brain has reached a fictional percentage of rewiring. It is whether the old pattern still controls your choices or disrupts the life you want. If it does not, that is a substantive long-term success.'**
  String get pornographyReferenceDay1825;

  /// No description provided for @smokingReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Day One: Benefits Start Now\n\nSource: NHS Better Health\n\nBenefits begin within minutes — not days. The body starts to normalise as soon as the smoke stops.\n\nWhat happens today\n• 20 minutes: pulse rate begins returning to normal\n• 8 hours: carbon monoxide in the blood falls by half; oxygen levels are recovering\n• 48 hours: carbon monoxide has dropped to the level of a non-smoker\n\nCarbon monoxide binds to red blood cells more strongly than oxygen, displacing it from your blood. Every organ was getting less oxygen than it should. That reverses within two days.\n\nWithdrawal begins on day one\n• Cravings — each typically lasting 3–5 minutes\n• Irritability and difficulty concentrating\n• Increased appetite\n\nThese are temporary and manageable. The NHS Better Health programme offers free support including apps and pharmacist advice.'**
  String get smokingReferenceDay1;

  /// No description provided for @smokingReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Day Three: Peak Withdrawal\n\nSource: McLaughlin, Dani & De Biasi\n\nBy 72 hours, nicotine is gone from your body. The brain built extra nicotine receptors during your smoking years; now they\'re understimulated, causing the withdrawal syndrome.\n\nPeak symptoms\n• Cravings — most intense right now\n• Irritability, frustration, restlessness\n• Difficulty concentrating\n• Anxiety\n• Headaches\n• Increased appetite\n• Coughing (the airways are clearing — a good sign)\n\nThis is the hardest day. It doesn\'t get worse than this — from here the symptoms steadily ease as your brain readjusts.\n\nNRT, varenicline, and bupropion all significantly reduce withdrawal severity at this stage.'**
  String get smokingReferenceDay3;

  /// No description provided for @smokingReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week: Taste and Smell Return\n\nSource: NHS Better Health\n\nReaching one week smoke-free is a strong predictor of long-term success — people who get through the first week are far more likely to quit for good.\n\nWhat\'s recovered\n• Food tastes more flavourful\n• Smells are more vivid\n• Breathing is easier — airways are clearing\n• Circulation is improving\n• Skin is better hydrated\n\nSmoking damages taste and smell receptors directly; within days of stopping, they begin to recover.\n\nThe acute nicotine withdrawal is easing. Physical cravings are shorter and less frequent. Trigger-based cravings may still be present, but the worst of the physical urgency is behind you.'**
  String get smokingReferenceDay7;

  /// No description provided for @smokingReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Circulation Improves\n\nSource: NHS Better Health\n\nWithin 2–12 weeks of stopping, blood circulation improves. Nicotine narrows blood vessels with every cigarette; without it, the vessels relax and blood flows more freely.\n\nWhat this means\n• Blood flow to hands, feet, and peripheral tissues improves\n• Many people notice warmer hands and feet\n• Walking and climbing stairs starts to feel easier\n\nWith carbon monoxide already cleared from the blood in the first day and circulation improving now, oxygen reaches muscles more effectively.\n\nThe cilia lining the airways are recovering and pushing out built-up mucus. If you\'re coughing more than usual, it\'s a sign of recovery, not a setback.'**
  String get smokingReferenceDay14;

  /// No description provided for @smokingReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month: Lung Function Climbs\n\nSource: NHS Better Health\n\nBreathing becomes easier and lung function improves — increasing by up to 10% over the 3-to-9-month window. At one month, you\'re well into that recovery curve.\n\nWhat\'s happening in the lungs\n• Cilia have regrown and are clearing mucus more effectively\n• Airway inflammation is settling\n• The persistent smoker\'s cough is fading\n• Exercise tolerance is improving\n\nAny coughs, wheezing and breathing problems improve as lung function increases. One month is a meaningful point on that recovery curve.'**
  String get smokingReferenceDay30;

  /// No description provided for @smokingReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Heart Attack Risk Drops\n\nSource: PMC — Cardiovascular Effects of Smoking and Cessation (2024)\n\nSmoking damages the heart and arteries in multiple ways: it accelerates artery plaque buildup, promotes blood clotting, raises blood pressure, and damages the arterial lining. The procoagulant, clot-promoting effects reverse within days of stopping, and this review reports a notable decline in heart attacks and strokes within the first year of quitting.\n\nWhat\'s improved by now\n• Blood clotting factors are normalising\n• Blood pressure and heart rate are stabilising\n• The sharpest early drop in acute cardiovascular event risk is well underway\n\nThe slower-acting benefits — reversing years of arterial plaque buildup — take longer and are covered in later milestones. Every smoke-free month adds to the recovery.'**
  String get smokingReferenceDay90;

  /// No description provided for @smokingReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Immune Defences Recover\n\nSource: Smoke-free period and recovery of alveolar immune-cell function (PubMed)\n\nSmoking suppresses the immune cells deep in the lungs, impairing their ability to engulf and kill bacteria. Recovery is gradual — those only 2 months abstinent show the most impairment, while function improves steadily with longer abstinence. By 6 months, pulmonary immune defences have substantially recovered.\n\nWhat this means\nThe lungs can clear inhaled bacteria and particles more effectively, reducing susceptibility to colds, flu, and pneumonia.\n\nImmune defences keep improving beyond six months — but by now the body\'s protection is markedly stronger than it was in those early weeks.'**
  String get smokingReferenceDay180;

  /// No description provided for @smokingReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year: Heart Attack Risk Falls Sharply\n\nSource: PMC — Smoking Cessation and Stroke Outcome; CDC, Benefits of Quitting Smoking\n\nSmoking roughly doubles stroke risk by promoting artery plaque buildup, increasing blood clotting, raising blood pressure, and damaging cerebral blood vessels. The CDC\'s own quitting-benefits timeline puts the sharp drop in heart attack risk at the 1-to-2-year mark — you\'re at the front edge of that window.\n\nRecovery Timeline\nFull stroke-risk normalisation takes longer: the cited stroke study followed quitters for a median of nearly five years to show a meaningfully lower stroke rate than continued smokers, and CDC data puts halved coronary heart disease risk at 3 to 6 years, with stroke risk decreasing over the 5-to-10-year mark.\n\nOne year is still a genuine medical milestone — the steepest part of the acute-risk decline is behind you, even though the longer-term cardiovascular and cancer benefits continue to build for years.'**
  String get smokingReferenceDay365;

  /// No description provided for @smokingReferenceDay1825.
  ///
  /// In en, this message translates to:
  /// **'Five Years: Cancer Risk Falls\n\nSource: CDC, Benefits of Quitting Smoking\n\nAt five years, some of the most dramatic cancer benefits arrive.\n\nFive-to-ten-year milestones\n• Added risk of cancers of the mouth, throat, and voice box: halved\n• Stroke risk: decreasing\n\nStill ahead\n• Ten years: lung cancer death risk roughly halved (after 10–15 years); risk of bladder, oesophagus, and kidney cancers decreasing\n• Fifteen years: coronary heart disease risk close to that of a non-smoker\n• Twenty years: mouth, throat, and voice box cancer risk close to non-smoker levels; added cervical cancer risk about halved\n\nFive years of not smoking is a genuine achievement — you\'re now inside the window where some of the most significant cancer-risk reductions take hold, even though several benefits (like coronary heart disease risk fully normalising) are still years away.'**
  String get smokingReferenceDay1825;

  /// No description provided for @socialMediaReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Stepping Back From Social Media: Day One\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhat the Evidence Shows\nIn this strong controlled study, people were randomly assigned either to take a one-week break from Facebook, Instagram, Twitter, and TikTok or to keep using them as usual. The break group showed significant improvements in well-being and reductions in depression and anxiety. That is real, controlled evidence that stepping back helps.\n\nWhat the Evidence Shows\nCompulsive social-media use is strongly linked to lower mood and higher anxiety, and randomized trials show that deliberately cutting back can improve well-being while reducing depression and anxiety within a week.\n\nDay One: What to Expect\n• Restlessness and an urge to check\n• \'Phantom\' notifications — feeling a buzz that didn\'t happen\n• Boredom as you adjust to less constant stimulation\nThese are normal habit-related sensations, and they are temporary. Recognising the pattern is the first step in changing it.'**
  String get socialMediaReferenceDay1;

  /// No description provided for @socialMediaReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Three Days Without Social Media: Anxiety and Mood\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhy a Break Helps Mood\nIn this controlled trial, people randomly assigned to a one-week break from social media ended the week with lower anxiety and depression and higher well-being than those who kept scrolling. Much of the day-to-day distress of heavy use comes from social comparison — measuring your real life against others\' curated highlight reels — and from the low-grade pull of fear-of-missing-out.\n\nWhat Happens Around 72 Hours\nEarly in a break, the habit is still loud:\n• Strong urges to check, often triggered by routine moments (waking, waiting in line)\n• Some irritability and restlessness\n• For some people, the first easing of comparison-driven anxiety\n• The pre-sleep scroll habit starting to loosen\n\nThe Comparison Trap Loosens\nWithout a constant feed of other people\'s highlights, the comparison that fuels much social-media anxiety has less fuel. The trial\'s results suggest that by the end of the first week these early shifts add up to a measurable improvement in mood — so the discomfort at three days is the hard part of a change that pays off.'**
  String get socialMediaReferenceDay3;

  /// No description provided for @socialMediaReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Social Media: The Measured Payoff\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nExactly One Week — and It Worked\nThis is the milestone the research speaks to most directly: the trial\'s intervention was a one-week break. Compared with people who kept using social media, the break group showed significantly higher well-being and significantly lower depression and anxiety after just seven days. Reaching one week is reaching the point at which a controlled study found real benefit.\n\nWhat People Commonly Notice\nAlongside the measured mood gains, people often report:\n• More reclaimed time — many are surprised how much they had been spending\n• Easier focus, as the habit of constant attention-switching loosens\n• Calmer evenings and easier sleep without the pre-bed scroll\nThese gains fit the broader improvement in well-being measured in the trial.\n\nKeep Going\nOne week is a genuine, evidence-backed milestone. The mood, time, and attention benefits tend to deepen the longer the healthier pattern holds.'**
  String get socialMediaReferenceDay7;

  /// No description provided for @socialMediaReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Without Social Media: Two-Week Gains\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nAbout This Study\nYoung adults limited social media to about 30 minutes a day for two weeks, with usage tracked objectively on their phones (it fell by roughly 78%). Participants cut social-media use by roughly 78%, giving this milestone a direct real-world test of what happens when use is sharply reduced for two weeks.\n\nWhat Improved\nOver the two weeks, participants showed improvements in:\n• Sleep — both duration and quality\n• Satisfaction with life\n• Stress\n• Perceived wellness\n• Scores on smartphone and social-media addiction scales\nThe measured gains were concrete: longer and better sleep, lower stress, higher life satisfaction and perceived wellness, and lower smartphone/social-media addiction scores.\n\nWatch for Backsliding\nThe researchers also noticed use creeping back toward previous levels afterwards. Two weeks is a real gain, but it highlights why an intentional plan — not just a temporary break — is what keeps the benefits.'**
  String get socialMediaReferenceDay14;

  /// No description provided for @socialMediaReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Without Social Media: Real Connection Deepens\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nConnection Can Improve When You Step Back\nIt sounds paradoxical — but in this study, cutting social media right back was associated with improvement in supportive relationships, along with better life satisfaction and lower stress. Time and attention that went to the feed became available for the people actually in your life.\n\nWhat One Month Tends to Bring\nBy 30 days, with the automatic pull of checking much weaker, many people find:\n• Conversations are more present and less interrupted\n• More interest in real-world activities and hobbies\n• Self-image leaning less on likes, comments, and follower counts\n\nRecovery Signal\nBy one month, you have sustained the healthier pattern for twice the study\'s intervention window. The sleep, stress, life-satisfaction, wellness, and relationship gains measured at two weeks have had another two weeks to consolidate into routine.\n\nMake the Time Count\nAim to fill freed time with activities that build genuine connection and fulfilment, rather than simply swapping one screen for another.'**
  String get socialMediaReferenceDay30;

  /// No description provided for @socialMediaReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Without Social Media: What the Evidence Supports\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nThe Most Reliable Picture\nResearchers combined results from 10 studies, including seven controlled trials. The clearest result was a meaningful reduction in depressive symptoms after people stepped back from social media.\n\nThe Strongest Result\nThe combined research found a clear reduction in depressive symptoms. By two months, you are sustaining the same kind of lower digital exposure that produced that mental-health benefit.\n\nWhat Two Months Can Look Like\nWith less daily comparison and less feed-driven reinforcement, self-image has far less reason to depend on likes, comments, or follower counts, while the strongest pooled evidence points to lower depressive symptoms.\n\nThe Practical Takeaway\nThe evidence rewards intentional, sustained change. Use the two-month point to keep deliberate limits in place rather than drifting back, and to invest in offline sources of meaning and connection.'**
  String get socialMediaReferenceDay60;

  /// No description provided for @socialMediaReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Without Social Media: A New Normal\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nSleep Is the Standout\nAmong this study\'s clearest findings was improved sleep — both duration and quality — when participants cut social media right back. By three months of a sustained healthier pattern, the late-night scroll that used to eat into sleep has long stopped competing with rest, and better sleep tends to lift mood, focus, and energy with it.\n\nWhat Else Improved\nThe same study found gains in stress, life satisfaction, perceived wellness, and supportive relationships. At three months these are no longer novelties — they have had time to settle into a new normal.\n\nRecovery Signal on Mechanism\nCutting social media sharply improved both sleep duration and sleep quality in the intervention study. Three months of sustaining that pattern turns the late-night-scroll reduction into a durable sleep habit.\n\nPresence and Relationships\nWith the reflex to fill every quiet moment with the phone much weaker, being present — in conversations, meals, and downtime — comes more naturally, and the relationships you have invested in over three months tend to feel stronger for it.'**
  String get socialMediaReferenceDay90;

  /// No description provided for @socialMediaReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Without Social Media: Measured Recovery\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nWhat Meta-Analysis Adds\nCombining 10 studies, including seven controlled trials, researchers found a clear reduction in depressive symptoms after people reduced or paused social media.\n\nWhat It Actually Found\n• Depression: a statistically significant reduction (the clearest, most consistent benefit)\n• Life satisfaction: no significant effect\n• Stress: no significant effect\n• Overall mental well-being: no significant effect\nThe strongest pooled result is clear: digital detox significantly reduces depressive symptoms.\n\nWhy You May Still Feel Broad Benefits\nSix months of reduced feed exposure compounds the practical gains seen in shorter interventions: more available time, less compulsive checking, and a sustained reduction in the digital exposure associated with depressive symptoms.\n\nKeep Control of the Feed\nThe biggest gains come from breaking heavy, passive, compulsive use. By six months, intentional control over social media is the new default rather than the feed controlling your attention.'**
  String get socialMediaReferenceDay180;

  /// No description provided for @socialMediaReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Without Social Media: A Renegotiated Relationship\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nOne Year of Sustained Change\nThe strongest combined research shows that stepping back from social media reduces depressive symptoms. A full year means that lower-exposure pattern has become your normal rather than a short break.\n\nWhat a Year Builds\nA full year gives you hundreds of hours back for real relationships, hobbies, skills, reflection, and creativity. Automatic checking has had a full year to weaken while those offline routines have had a full year to strengthen.\n\nSustained Benefits\nThe clearest measured mental-health gain is lower depressive symptoms. The practical gains — more time, fewer interruptions, and less compulsive checking — compound every day you keep control of the feed.\n\nWhat Comes Next\nA year of deliberate change has reset the relationship. Whether you return to limited, intentional use or stay off entirely, the compulsive loop has been broken — and that is the durable win.'**
  String get socialMediaReferenceDay365;

  /// Home screen heading above good habits being built
  ///
  /// In en, this message translates to:
  /// **'Building'**
  String get homeSectionBuilding;

  /// Home screen heading above habits being quit
  ///
  /// In en, this message translates to:
  /// **'Breaking free'**
  String get homeSectionQuitting;

  /// Button that opens the new good habit screen
  ///
  /// In en, this message translates to:
  /// **'Add a good habit'**
  String get habitAddButton;

  /// Shown on the home screen before any good habit is added
  ///
  /// In en, this message translates to:
  /// **'Start a good habit, like a daily devotional, a walk, or time with your partner.'**
  String get habitEmptyHint;

  /// Tooltip on the check button of a good habit not yet done today
  ///
  /// In en, this message translates to:
  /// **'Mark done today'**
  String get habitDoneToday;

  /// Tooltip on the check button of a good habit already done today
  ///
  /// In en, this message translates to:
  /// **'Undo today'**
  String get habitUndoToday;

  /// Current streak of a daily good habit
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No streak yet} =1{1-day streak} other{{count}-day streak}}'**
  String habitStreakDays(int count);

  /// Current streak of a weekly good habit, in weeks that met the target
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No streak yet} =1{1-week streak} other{{count}-week streak}}'**
  String habitStreakWeeks(int count);

  /// How many days a weekly good habit was done this week
  ///
  /// In en, this message translates to:
  /// **'{done} of {target} this week'**
  String habitWeekProgress(int done, int target);

  /// Title of the screen that creates a good habit
  ///
  /// In en, this message translates to:
  /// **'New habit'**
  String get editHabitAddTitle;

  /// Title of the screen that edits a good habit
  ///
  /// In en, this message translates to:
  /// **'Edit habit'**
  String get editHabitTitle;

  /// Tooltip on the delete button when editing a good habit
  ///
  /// In en, this message translates to:
  /// **'Delete habit'**
  String get habitDelete;

  /// Label above the category choices of a good habit
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get habitCategoryLabel;

  /// Good habit category for devotionals, prayer and church
  ///
  /// In en, this message translates to:
  /// **'Faith'**
  String get habitCategoryFaith;

  /// Good habit category for exercise
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get habitCategoryFitness;

  /// Good habit category for time with a partner
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get habitCategoryRelationship;

  /// Good habit category for anything else
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get habitCategoryOther;

  /// Label of the weekly target picker of a good habit
  ///
  /// In en, this message translates to:
  /// **'Days per week'**
  String get habitTargetLabel;

  /// Weekly target option for a daily good habit
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get habitTargetDaily;

  /// Weekly target option for a good habit done on some days
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day a week} other{{count} days a week}}'**
  String habitTargetWeekly(int count);

  /// Heading above suggested good habits when adding one
  ///
  /// In en, this message translates to:
  /// **'Ideas to start with'**
  String get habitSuggestionsLabel;

  /// Suggested faith habit
  ///
  /// In en, this message translates to:
  /// **'Daily devotional'**
  String get presetDevotional;

  /// Suggested faith habit
  ///
  /// In en, this message translates to:
  /// **'Pray'**
  String get presetPray;

  /// Suggested faith habit
  ///
  /// In en, this message translates to:
  /// **'Read a Psalm'**
  String get presetPsalm;

  /// Suggested weekly faith habit
  ///
  /// In en, this message translates to:
  /// **'Go to church'**
  String get presetChurch;

  /// Suggested fitness habit
  ///
  /// In en, this message translates to:
  /// **'Walk 30 minutes'**
  String get presetWalk;

  /// Suggested fitness habit
  ///
  /// In en, this message translates to:
  /// **'Work out'**
  String get presetWorkout;

  /// Suggested fitness habit
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get presetStretch;

  /// Suggested fitness habit
  ///
  /// In en, this message translates to:
  /// **'Drink enough water'**
  String get presetWater;

  /// Suggested fitness habit
  ///
  /// In en, this message translates to:
  /// **'Go to bed on time'**
  String get presetBedtime;

  /// Suggested habit with a partner
  ///
  /// In en, this message translates to:
  /// **'Pray together'**
  String get presetPrayTogether;

  /// Suggested weekly habit with a partner
  ///
  /// In en, this message translates to:
  /// **'Date night'**
  String get presetDateNight;

  /// Suggested habit with a partner
  ///
  /// In en, this message translates to:
  /// **'Encourage my partner'**
  String get presetEncourage;

  /// Suggested habit with a partner
  ///
  /// In en, this message translates to:
  /// **'Phones away at dinner'**
  String get presetPhonesAway;

  /// Suggested habit with a partner
  ///
  /// In en, this message translates to:
  /// **'Ask about their day'**
  String get presetAskAboutDay;

  /// Heading of the daily Bible verse card on the home screen
  ///
  /// In en, this message translates to:
  /// **'Verse of the day'**
  String get verseOfTheDay;

  /// Tooltip on the button that shares the verse of the day
  ///
  /// In en, this message translates to:
  /// **'Share verse'**
  String get verseShare;

  /// Bible reference under the verse of the day; WEB is the World English Bible
  ///
  /// In en, this message translates to:
  /// **'{reference} (WEB)'**
  String verseReference(String reference);

  /// Text shared from the verse of the day
  ///
  /// In en, this message translates to:
  /// **'“{text}” {reference} (WEB)'**
  String verseShareMessage(String text, String reference);

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'Well done. Small, faithful steps add up.'**
  String get encourageCheckIn1;

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'You showed up today. Keep in step with the Spirit.'**
  String get encourageCheckIn2;

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'Done. Grace for today, strength for tomorrow.'**
  String get encourageCheckIn3;

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'Another seed sown. Growth takes time.'**
  String get encourageCheckIn4;

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'Good work. You\'re becoming who you were made to be.'**
  String get encourageCheckIn5;

  /// Encouragement shown after marking a good habit done
  ///
  /// In en, this message translates to:
  /// **'One more step toward being more like Jesus.'**
  String get encourageCheckIn6;

  /// Encouragement shown when a good habit streak reaches a milestone
  ///
  /// In en, this message translates to:
  /// **'{count} days in a row! Keep walking in step with the Spirit.'**
  String encourageMilestoneDays(int count);

  /// Encouragement shown when a good habit streak reaches a milestone
  ///
  /// In en, this message translates to:
  /// **'{count} weeks in a row! Faithful in the small things.'**
  String encourageMilestoneWeeks(int count);

  /// Heading of the gentle card shown after a daily habit was missed
  ///
  /// In en, this message translates to:
  /// **'Missed yesterday?'**
  String get encourageMissedTitle;

  /// Body of the gentle card shown after a daily habit was missed
  ///
  /// In en, this message translates to:
  /// **'That\'s okay. His mercies are new every morning, so start again today.'**
  String get encourageMissedBody;

  /// Switch on a faith habit that links it to the reading plan
  ///
  /// In en, this message translates to:
  /// **'Open today\'s reading'**
  String get habitOpensReading;

  /// Explains the open today's reading switch
  ///
  /// In en, this message translates to:
  /// **'Read the day\'s passage from your plan, then this habit is ticked off for you.'**
  String get habitOpensReadingHint;

  /// Title of the devotional reading page and tooltip of the button that opens it
  ///
  /// In en, this message translates to:
  /// **'Today\'s reading'**
  String get readingTitle;

  /// Heading above the list of reading plans
  ///
  /// In en, this message translates to:
  /// **'Choose a reading plan'**
  String get readingChoosePlan;

  /// Explains that reading plans are self-paced
  ///
  /// In en, this message translates to:
  /// **'Go at your own pace. If you miss a day, your next reading simply waits for you.'**
  String get readingChoosePlanHint;

  /// How many days a reading plan takes
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String readingPlanDays(int count);

  /// Button that starts a reading plan
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get readingStart;

  /// Progress through the reading plan
  ///
  /// In en, this message translates to:
  /// **'Day {day} of {total}'**
  String readingDayOf(int day, int total);

  /// Short prompt to pray before reading
  ///
  /// In en, this message translates to:
  /// **'Before you read, ask the Holy Spirit to guide you into the truth (John 16:13).'**
  String get readingPrayerPrompt;

  /// Shown when today's reading was already finished
  ///
  /// In en, this message translates to:
  /// **'Today\'s reading is done. Read ahead if you like.'**
  String get readingDoneToday;

  /// Label of the optional prayer note field
  ///
  /// In en, this message translates to:
  /// **'A prayer or thought (optional)'**
  String get readingNoteLabel;

  /// Helper text under the prayer note field
  ///
  /// In en, this message translates to:
  /// **'Saved to your journal'**
  String get readingNoteHint;

  /// Button that marks the day's reading finished
  ///
  /// In en, this message translates to:
  /// **'Finish reading'**
  String get readingFinish;

  /// Encouragement after finishing a day's reading, from Colossians 3:16
  ///
  /// In en, this message translates to:
  /// **'Well done. Let the word of Christ dwell in you richly.'**
  String get readingFinishedMessage;

  /// Heading shown when a reading plan is complete
  ///
  /// In en, this message translates to:
  /// **'You finished {plan}!'**
  String readingPlanComplete(String plan);

  /// Body shown when a reading plan is complete
  ///
  /// In en, this message translates to:
  /// **'What a faithful journey. Choose another plan when you\'re ready.'**
  String get readingPlanCompleteBody;

  /// Button to pick a new plan after finishing one
  ///
  /// In en, this message translates to:
  /// **'Choose another plan'**
  String get readingChoosePlanAgain;

  /// Menu item to switch reading plan
  ///
  /// In en, this message translates to:
  /// **'Change plan'**
  String get readingChangePlan;

  /// Menu item to restart the reading plan from day one
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get readingStartOver;

  /// Title of the Psalms and Proverbs reading plan
  ///
  /// In en, this message translates to:
  /// **'Psalms & Proverbs in 30 days'**
  String get planPsalmsProverbsTitle;

  /// Description of the Psalms and Proverbs reading plan
  ///
  /// In en, this message translates to:
  /// **'Five Psalms and a chapter of Proverbs each day, for prayer and wisdom.'**
  String get planPsalmsProverbsDescription;

  /// Title of the Gospels reading plan
  ///
  /// In en, this message translates to:
  /// **'The four Gospels'**
  String get planGospelsTitle;

  /// Description of the Gospels reading plan
  ///
  /// In en, this message translates to:
  /// **'A chapter a day through Matthew, Mark, Luke and John, walking with Jesus.'**
  String get planGospelsDescription;

  /// Button that opens help when tempted to break a quit streak
  ///
  /// In en, this message translates to:
  /// **'I\'m struggling'**
  String get strugglingButton;

  /// Heading of the help sheet for a moment of temptation
  ///
  /// In en, this message translates to:
  /// **'Hold on. You\'re not alone.'**
  String get strugglingTitle;

  /// Reassurance at the top of the help sheet, echoing 1 Corinthians 10:13
  ///
  /// In en, this message translates to:
  /// **'This feeling will pass. God is faithful, and He will make a way through it.'**
  String get strugglingBody;

  /// Button that shows a different verse on the help sheet
  ///
  /// In en, this message translates to:
  /// **'Another verse'**
  String get strugglingAnotherVerse;

  /// Heading above the short prayer on the help sheet
  ///
  /// In en, this message translates to:
  /// **'Pray'**
  String get strugglingPrayTitle;

  /// A short prayer the user can pray when tempted
  ///
  /// In en, this message translates to:
  /// **'Holy Spirit, I\'m struggling right now. Please give me strength to say no and show me the way out. Fill me with Your peace. In Jesus\' name, amen.'**
  String get strugglingPrayer;

  /// Heading above practical steps on the help sheet
  ///
  /// In en, this message translates to:
  /// **'For the next ten minutes'**
  String get strugglingStepsTitle;

  /// Practical step when tempted
  ///
  /// In en, this message translates to:
  /// **'Breathe slowly and step away from the situation.'**
  String get strugglingStepBreathe;

  /// Practical step when tempted
  ///
  /// In en, this message translates to:
  /// **'Go for a walk, drink some water or keep your hands busy.'**
  String get strugglingStepMove;

  /// Practical step when tempted
  ///
  /// In en, this message translates to:
  /// **'Wait it out. Urges rise and fall like a wave.'**
  String get strugglingStepWait;

  /// Button that shares a message asking a friend for prayer
  ///
  /// In en, this message translates to:
  /// **'Reach out to someone'**
  String get strugglingReachOut;

  /// Message shared with a trusted friend from the help sheet
  ///
  /// In en, this message translates to:
  /// **'I\'m struggling right now. Could you pray for me or give me a call?'**
  String get strugglingShareMessage;

  /// Button that closes the help sheet after the urge has passed
  ///
  /// In en, this message translates to:
  /// **'I made it through'**
  String get strugglingMadeIt;

  /// Encouragement after getting through a moment of temptation
  ///
  /// In en, this message translates to:
  /// **'Well done. God is faithful, and you stood firm. Thank Him for this win.'**
  String get strugglingMadeItMessage;

  /// Button that records how many minutes a fitness habit took today
  ///
  /// In en, this message translates to:
  /// **'Log minutes'**
  String get habitLogMinutes;

  /// Title of the dialog for logging exercise minutes
  ///
  /// In en, this message translates to:
  /// **'How many minutes?'**
  String get habitMinutesTitle;

  /// Label of the minutes field
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get habitMinutesLabel;

  /// Minutes logged today on a fitness habit
  ///
  /// In en, this message translates to:
  /// **'{minutes} min today'**
  String habitMinutesToday(int minutes);

  /// Heading of the good habit stats card
  ///
  /// In en, this message translates to:
  /// **'Good habits'**
  String get statsHabitsTitle;

  /// Days done this week against the weekly target
  ///
  /// In en, this message translates to:
  /// **'This week: {done} of {target}'**
  String statsHabitThisWeek(int done, int target);

  /// Share of the weekly target met over the last four full weeks
  ///
  /// In en, this message translates to:
  /// **'Last 4 weeks: {percent}%'**
  String statsHabitRecent(int percent);

  /// Longest streak of a daily habit
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Best: 1 day} other{Best: {count} days}}'**
  String statsHabitBestDays(int count);

  /// Longest streak of a weekly habit
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Best: 1 week} other{Best: {count} weeks}}'**
  String statsHabitBestWeeks(int count);

  /// Heading of the exercise minutes card
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get statsExerciseTitle;

  /// Exercise minutes logged this week
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes this week'**
  String statsExerciseThisWeek(int minutes);

  /// Average weekly exercise minutes over recent weeks
  ///
  /// In en, this message translates to:
  /// **'About {minutes} minutes a week lately'**
  String statsExerciseAverage(int minutes);

  /// Shown on the exercise card before any minutes are logged
  ///
  /// In en, this message translates to:
  /// **'Log minutes on a fitness habit after ticking it off to see them here.'**
  String get statsExerciseHint;

  /// Label on the button the user presses and holds to begin a journey again after a stumble
  ///
  /// In en, this message translates to:
  /// **'Hold to start again'**
  String get freshStartHold;

  /// Shown when the start again button is tapped instead of held
  ///
  /// In en, this message translates to:
  /// **'Press and hold to start again'**
  String get freshStartHoldHint;

  /// Heading on the white screen shown after starting again
  ///
  /// In en, this message translates to:
  /// **'A clean slate'**
  String get freshStartTitle;

  /// The pledge shown after starting again
  ///
  /// In en, this message translates to:
  /// **'With God\'s help, I begin again today.'**
  String get freshStartPledge;

  /// Hint to dismiss the fresh start screen
  ///
  /// In en, this message translates to:
  /// **'Tap to continue'**
  String get freshStartContinue;

  /// Neutral name shown for a built-in journey in discreet mode
  ///
  /// In en, this message translates to:
  /// **'Journey'**
  String get discreetJourney;

  /// Neutral name for the second and later built-in journeys in discreet mode
  ///
  /// In en, this message translates to:
  /// **'Journey {number}'**
  String discreetJourneyNumbered(int number);

  /// Settings switch title
  ///
  /// In en, this message translates to:
  /// **'Discreet mode'**
  String get settingsDiscreet;

  /// Settings switch subtitle
  ///
  /// In en, this message translates to:
  /// **'Show journeys under neutral names and icons, and keep them out of notifications. Rename a journey to give it a private name.'**
  String get settingsDiscreetSubtitle;

  /// Title of a progress reminder in discreet mode, which does not name the journey
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get notificationDiscreetTitle;

  /// Body of a progress reminder in discreet mode
  ///
  /// In en, this message translates to:
  /// **'Day {days} of your journey. {message}'**
  String notificationDiscreetBody(int days, String message);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
