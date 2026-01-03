import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  // Helper method to access current instance
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Load the language JSON file from the "lang" folder
  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
      'lib/core/l10n/${locale.languageCode}.json',
    );
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // Get translated string by key
  String getString(String key) {
    return _localizedStrings[key] ?? key;
  }

  // Convenience getters for common translations
  String get appTitle => getString('appTitle');
  String get navHome => getString('navHome');
  String get navServices => getString('navServices');
  String get navProjects => getString('navProjects');
  String get navContact => getString('navContact');

  String get heroGreeting => getString('heroGreeting');
  String get heroTitle => getString('heroTitle');
  String get heroSubtitle => getString('heroSubtitle');
  String get btnViewProfile => getString('btnViewProfile');
  String get btnKnowMore => getString('btnKnowMore');

  String get servicesTitle => getString('servicesTitle');
  String get serviceDevelopmentTitle => getString('serviceDevelopmentTitle');
  String get serviceDevelopmentDesc => getString('serviceDevelopmentDesc');
  String get serviceUIUXTitle => getString('serviceUIUXTitle');
  String get serviceUIUXDesc => getString('serviceUIUXDesc');
  String get serviceMaintenanceTitle => getString('serviceMaintenanceTitle');
  String get serviceMaintenanceDesc => getString('serviceMaintenanceDesc');

  String get loadingPortfolio => getString('loadingPortfolio');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Support English and Spanish
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
