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
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  // Convenience getters for common translations
  String get appTitle => translate('appTitle');
  String get navHome => translate('navHome');
  String get navServices => translate('navServices');
  String get navProjects => translate('navProjects');
  String get navContact => translate('navContact');

  String get heroGreeting => translate('heroGreeting');
  String get heroTitle => translate('heroTitle');
  String get heroSubtitle => translate('heroSubtitle');
  String get btnViewProfile => translate('btnViewProfile');
  String get btnKnowMore => translate('btnKnowMore');

  String get servicesTitle => translate('servicesTitle');
  String get serviceDevelopmentTitle => translate('serviceDevelopmentTitle');
  String get serviceDevelopmentDesc => translate('serviceDevelopmentDesc');
  String get serviceUIUXTitle => translate('serviceUIUXTitle');
  String get serviceUIUXDesc => translate('serviceUIUXDesc');
  String get serviceMaintenanceTitle => translate('serviceMaintenanceTitle');
  String get serviceMaintenanceDesc => translate('serviceMaintenanceDesc');

  String get loadingPortfolio => translate('loadingPortfolio');
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
