<div align="center">

<img src="assets/icon.png" width="112" alt="Spirit app icon">

# Spirit

**Quit what holds you back. Build what brings you life.**

A private, faith-based habit app: track the habits you're quitting and the ones you're building (daily devotional, exercise, time with your partner), with encouragement rooted in Scripture.

The name points to the Holy Spirit, our Helper and guide (John 14:26), who helps us grow into better people and Christians, more like Jesus and the best version of ourselves. The app doesn't replace Him; it's a small everyday tool, because we need all the help we can get.

<sub>Android first · Local data · No tracking</sub>

</div>

> Spirit is built on [Quitter](https://github.com/brandonp2412/Quitter) by Brandon Dick (MIT). See [docs/BUILD_PLAN.md](docs/BUILD_PLAN.md) for what we're adding.

## See your progress, not a dashboard full of noise

<p align="center">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/1_en-US.png" width="360" alt="Quitter home screen with multiple quitting journeys">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/2_en-US.png" width="360" alt="Alcohol quitting journey with progress information">
  <br><br>
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/7_en-US.png" width="360" alt="Quitter settings and appearance options">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/8_en-US.png" width="360" alt="Quitter journal screen">
</p>

<details>
<summary>More screenshots</summary>
<br>

<p align="center">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/3_en-US.png" width="360" alt="Smoking quitting journey at day seven">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/4_en-US.png" width="360" alt="Custom quitting journey editor">
  <br><br>
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/5_en-US.png" width="360" alt="Home screen hide-entry action">
  <img src="fastlane/metadata/android/en-US/images/phoneScreenshots/6_en-US.png" width="360" alt="Marijuana quitting journey at day fourteen">
</p>
</details>

## Built for the journey

**Private by design.** Spirit doesn't track you. Your progress is stored locally instead of being sent to an account or analytics service.

**More than one goal.** Track multiple habits at once, follow milestones, journal how things are going, and get progress notifications when you want them.

**Make it yours.** Choose colours and themes, create custom entries, and turn features on or off so the app stays focused on what matters to you.

## Help translate Spirit

Translations are maintained directly in `lib/l10n/`. Contributions for any supported language are welcome through normal pull requests.

## Development

<details>
<summary>Run Spirit locally</summary>
<br>

Spirit is built with Flutter.

```bash
git clone --recursive https://github.com/armerson/Spirit.git spirit
cd spirit
flutter pub get
flutter run
```

</details>

## License

Spirit is available under the [MIT License](LICENSE.md), and keeps the original Quitter copyright notice.
