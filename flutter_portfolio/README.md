# Ahmer Ali — Flutter Portfolio (lib folder)

A Flutter recreation of the web portfolio: same layout, colors, typography and animations.

## How to use

1. Create a new Flutter project: `flutter create ahmer_portfolio`
2. Replace the generated `lib/` folder with the `lib/` folder here.
3. Add these packages to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  url_launcher: ^6.3.1
```

4. Run `flutter pub get`, then `flutter run` (works on mobile, web and desktop).

## Structure

```
lib/
  main.dart                     app entry
  theme/app_theme.dart          colors, fonts, button styles
  data/portfolio_data.dart      all text content (edit here)
  screens/portfolio_screen.dart page assembly + smooth scroll nav
  widgets/common.dart           brand mark, tags, cards, animations
  widgets/top_bar.dart          sticky nav with mobile menu
  sections/                     hero, about, skills, projects, experience, contact, footer
```

To change any wording, numbers, links, or skill percentages, edit only `lib/data/portfolio_data.dart`.
