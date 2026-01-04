import 'package:flutter/material.dart';
import '../../../../main.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect current locale
    final currentLocale = Localizations.localeOf(context);
    final isEn = currentLocale.languageCode == 'en';

    return InkWell(
      onTap: () {
        final newLocale = isEn ? const Locale('es') : const Locale('en');
        MyApp.setLocale(context, newLocale);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language, color: Colors.black, size: 16),
            const SizedBox(width: 8),
            Text(
              isEn ? 'EN' : 'ES',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
