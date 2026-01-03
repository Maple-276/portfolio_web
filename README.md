# Alexander P - Portfolio Web 🚀

A modern, responsive, and high-performance developer portfolio built with **Flutter Web**. This project showcases professional experience, skills, and projects in a sleek, interactive interface.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Key Features

- **🎨 Modern Aesthetic UI**:

  - Glassmorphism effects in Navigation Bar & Cards.
  - Custom animations (`FadeIn`, hover effects, ambient glows).
  - Consistent design system (Typography, Colors, Spacing).
  - **Dark Mode** integrated theme.

- **📱 Fully Responsive Design**:

  - Adapts seamlessly to Mobile, Tablet, and Desktop screens.
  - **Mobile Navigation**: Custom Drawer for smaller screens.
  - Custom `ResponsiveUtils` for scaling fonts, padding, and layout sizing.
  - Dynamic layouts using `Wrap`, `Flexible`, and conditional rendering.

- **🧭 Smooth Navigation**:

  - Single-page application architecture.
  - **Smooth Scroll** to sections (Home, Services, Projects, Contact).
  - Active section tracking for visual feedback in NavBar.

- **🌍 Multi-language Support (i18n)**:

  - English (default) and Spanish support.
  - **Auto-detection** of browser language settings.
  - Centralized JSON translation files for easy management.

- **⚡ Performance Optimized**:
  - **WebP Image Format**: Reduced asset size by ~70%.
  - **Smart Caching**: `cacheWidth` implementation to minimize memory usage.
  - **Custom Splash Screen**: Elegant HTML/CSS loading screen to eliminate white screen flash.
  - **Lazy Loading**: Assets and fonts optimized for web.

## 🛠️ Tech Stack & Architecture

The project follows **Clean Architecture** principles to ensure maintainability and scalability. code structure is strictly typed and verified with zero analyzer issues.

```
lib/
├── core/                   # Core functionality shared across features
│   ├── constants/          # App-wide constants (Sizes, Spacing, Text)
│   ├── errors/             # Error handling classes
│   ├── l10n/               # Localization (AppLocalizations, JSONs)
│   ├── theme/              # App Theme (Colors, Fonts)
│   ├── utils/              # Utilities (ResponsiveUtils)
│   └── widgets/            # Reusable UI Components (NavBar, Buttons, Cards)
│
├── features/               # Feature-based modules
│   ├── Contact/            # Contact Form & Social Links (Implemented)
│   ├── Home/               # Hero & Main Landing Logic (Implemented)
│   ├── Projects/           # Projects Gallery (Implemented)
│   └── Service/            # Services Showcase Section (Implemented)
│
└── main.dart               # Entry point & App Config
```

### 📦 Key Dependencies

- `flutter_localizations`: For internationalization support.
- `google_fonts`: For "Playfair Display" and "Lato" typography.
- `url_launcher`: For opening external links (GitHub, LinkedIn, Email).

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Latest Stable)
- Dart SDK

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/portfolio_web.git
   cd portfolio_web
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run in Debug Mode**

   ```bash
   flutter run -d chrome  # or edge
   ```

4. **Build for Production**
   ```bash
   flutter build web --release --web-renderer canvaskit
   # or for faster initial load (but heavier canvas operations might vary)
   flutter build web --release --web-renderer html
   ```

## 🌐 Localization (Adding a new language)

1. Create a new JSON file in `lib/core/l10n/` (e.g., `fr.json`).
2. Add the language code to `app_localizations.dart` in the `isSupported` method.
3. Add the `Locale` to `supportedLocales` in `main.dart`.
4. Register the new translation file in `pubspec.yaml` assets if needed.

## 🎨 Design Assets

- **Fonts**: Playfair Display (Headers), Lato (Body).
- **Colors**:
  - Primary Teal: `#17DBA7`
  - Dark Background: `#040404`
  - Service Green: `#10342A`

---

Developed with 💙 by **Alexander P.**
