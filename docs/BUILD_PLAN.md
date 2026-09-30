# Build plan: faith-based habit app on top of Quitter

Base: [armerson/Spirit](https://github.com/armerson/Spirit), a fork of [brandonp2412/Quitter](https://github.com/brandonp2412/Quitter) (Flutter, MIT).
Goal: one app to **quit** bad habits and **build** good ones (daily devotional, exercise, time with your partner), with encouragement rooted in Scripture.

App name: **Spirit** (chosen by Stewart, 2026-09-29).

## What we keep from Quitter
- Quit tracking (days since, milestones, relapse reset), journal, stats, PIN lock, themes, home-screen widget.
- Local-only storage (`shared_preferences`), no account, no tracking.
- Notification scheduling (`lib/tasks.dart`) and confetti celebrations (`lib/confetti_widget.dart`).
- MIT licence: keep the original copyright notice in `LICENSE.md` and add our own line.

## What we add

### 1. "Build" habits (the core new feature)
Quitter's `Entry` (`lib/entry.dart`) only knows a quit date. Add a new model alongside it:

```dart
class Habit {
  String id, title;
  HabitCategory category;   // faith, fitness, relationship, other
  int targetPerWeek;        // 7 = daily, 3 = "3x a week"
  List<DateTime> checkIns;  // one per completed day
  Color color; IconData? icon;
  TimeOfDay? reminderAt;
}
```
- Streak = consecutive weeks/days meeting target; "best streak" kept separately.
- Missing a day never wipes history (grace-based: show "start again today", not a red failure).
- New `HabitProvider` (mirrors `AddictionProvider`), saved as JSON under a `habits` key.
- Reference design: [mhabit](https://github.com/FriesI23/mhabit) (Apache-2.0) for scoring and weekly goals.

### 2. Home screen: Quitting + Building
- Two sections on `lib/home_page.dart`: **Quitting** (existing cards) and **Building** (new habit cards with a one-tap "Done today" check).
- Today's verse card at the top.

### 3. Faith features
- **Verse of the day**: bundled World English Bible (WEB, public domain; chosen by Stewart). Text source: [Open-Bible](https://github.com/synthalorian/Open-Bible) data files (Apache-2.0) or the WEB directly (public domain). Avoid NIV/ESV/NLT unless we get publisher permission.
- **Daily devotional check-in**: a preset "Devotional" habit; tapping it opens the day's reading, an optional prayer note in the journal, then marks it done.
- **Reading plans**: start simple (Psalms & Proverbs in 30 days; Gospels in 90 days), stored as a list of references.
- **Temptation help**: on quit cards, an "I'm struggling" button showing a relevant verse (e.g. 1 Cor 10:13, Phil 4:13) and a prompt to pray or call someone.

### 4. Exercise
- Preset habits: "Walk 30 min", "Workout", "Stretch", with a weekly target.
- Optional minutes field on check-in for a weekly total in stats. (Health Connect / Apple Health import is a later, optional step.)

### 5. Relationship with your partner
- Preset habits: "Pray together", "Date night (weekly)", "Encourage them", "Put phones away at dinner", "Ask about their day".
- Weekly gentle prompt: "One thing you appreciated about them this week" saved to the journal.
- Partner features stay private on Stewart's phone (decided 2026-09-29); no sync.

### 6. Encouragement engine
- Replace/extend the 8 generic `notificationProgressMessage*` strings with a message pool tagged by moment: *streak kept*, *milestone hit*, *missed yesterday*, *relapse*, *morning*.
- Each message pairs a short line with a verse, e.g. "Seven days strong. *'I can do all things through Christ who strengthens me.'* Phil 4:13".
- Triggers: on check-in, on milestone, daily morning reminder, and a kind nudge after a missed day.
- Tone rule: grace over guilt, never shaming.

## Build order (each step is a small PR)
1. Fork, rename app id/name/icon, update README and licence notice.
2. `Habit` model + `HabitProvider` + unit tests.
3. "Building" section on home screen with check-in and streaks.
4. Presets for faith, fitness and relationship habits.
5. Bundled Bible text + verse of the day card.
6. Encouragement message pool + new notification triggers.
7. Devotional flow and reading plans.
8. "I'm struggling" help on quit cards.
9. Stats for build habits (weekly completion, exercise minutes).
10. Trim Quitter presets you don't need (the long list of drug-specific pages) to simplify the app.

## Open questions for Stewart
- ~~App name?~~ Spirit.
- ~~Which Bible translation?~~ World English Bible (WEB).
- ~~Android only at first, or iPhone too?~~ Android first.
- ~~Partner features private or shared?~~ Private to Stewart (no sync needed).
