# Alexander P - Portfolio Web 🚀

A modern, responsive, and high-performance developer portfolio built with **Flutter Web**. This project showcases professional experience, skills, and projects in a sleek, interactive interface.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Key Features

- **🎨 Modern Aesthetic UI**:

  - **Glassmorphism** effects in Navigation Bar & Cards.
  - **Blurred Backgrounds** for Project Cards (Spotify-style aesthetics).
  - Custom animations (`FadeIn`, hover effects, ambient glows).
  - **Dark Mode** integrated theme with `AppColors`.

- **📱 Fully Responsive Design**:

  - Adapts seamlessly to Mobile, Tablet, and Desktop screens.
  - **Mobile Navigation**: Custom Drawer and reactive layouts.
  - `ResponsiveUtils` for scaling fonts, padding, and layout sizing.

- **🧭 Smooth Navigation**:

  - Single-page application (SPA) architecture.
  - **Smooth Scroll** to sections (Home, Services, Projects, Contact).
  - Active section tracking for visual feedback in NavBar.

- **📩 Functional Contact Form (EmailJS)**:

  - Send emails directly from the frontend using **EmailJS API**.
  - Rate limiting and loading states.
  - User Feedback: Success/Error SnackBars and form validation.

- **🌓 Dynamic UI & Animations**:

  - **Scroll-Triggered Animations** (`visibility_detector`): Elements fade in elegantly as you scroll.
  - **Interactive Hover Effects**: Buttons, cards, and links respond to cursor movement.
  - **Project Gallery**: Custom modal dialog with **Image Carousel** to showcase project screenshots.

- **🌍 Multi-language Support (i18n)**:
  - **English** and **Spanish** support.
  - **Auto-detection** of browser language settings.
  - Instant language switching via the UI without reloading.

## 🏆 Project Showcase

The portfolio dynamically loads projects using a repository pattern. Featured projects include:

1.  **No Smoke (Flutter Mobile)**:

    - Quit smoking tracker app with health and savings tracking.
    - **Tech**: Riverpod, Local Storage, Custom Charts.
    - [Live Demo](https://alexander-p.dev) | [View Code](https://github.com/Maple-276/no_smoke)

2.  **Nuclear Lake (Flutter Game)**:

    - 2D Top-down shooter with procedural generation.
    - **Tech**: Flame Engine, Game Loop, Collision Detection.
    - [Live Demo](https://alexander-p.dev) | [View Code](https://github.com/Maple-276/nuclear_lake)

3.  **Portfolio Web**:
    - This responsive web app.
    - **Tech**: Flutter Web, EmailJS, Localization.

## 🛠️ Architecture & Tech Stack

The project follows **Clean Architecture** principles to ensure maintainability and scalability.

```
lib/
├── core/                   # Shared functionality
│   ├── constants/          # Centralized AppConstants
│   ├── l10n/               # Localization (AppLocalizations, en.json, es.json)
│   ├── theme/              # AppTheme (AppColors, Fonts)
│   └── widgets/            # Reusable Widgets (NavBar, FadeInAnimation, Buttons)
├── features/               # Feature-based modules
│   ├── Contact/            # Contact Form & Logic (EmailJS)
│   ├── Home/               # Landing Section
│   ├── Projects/           # Repository, Models & Gallery UI
│   └── Service/            # Services Section
└── main.dart               # Entry Point & Config
```

### 📦 Key Dependencies

- `flutter_localizations`: Internationalization.
- `google_fonts`: "Playfair Display" & "Lato".
- `url_launcher`: Opening external links.
- `http`: API requests (EmailJS).
- `visibility_detector`: Scroll animations.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Latest Stable)
- Dart SDK

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Maple-276/portfolio_web.git
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
   ```

## 🎨 Design Assets

- **Primary Color**: `#17DBA7` (Teal)
- **Background**: `#040404` (Dark Tech)
- **Fonts**: Playfair Display (Headers) / Lato (Body)

---

Developed with 💙 by **Alexander P.**
