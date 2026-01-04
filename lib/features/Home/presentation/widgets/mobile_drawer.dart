import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/l10n/app_localizations.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onScrollToSection;

  const MobileDrawer({super.key, required this.onScrollToSection});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBackground.withValues(alpha: 0.95),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Text(
            'Menu',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: AppColors.primaryTeal),
          ),
          const SizedBox(height: 40),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: Text(
              AppLocalizations.of(context).getString('navHome'),
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.design_services, color: Colors.white),
            title: Text(
              AppLocalizations.of(context).getString('navServices'),
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work, color: Colors.white),
            title: Text(
              AppLocalizations.of(context).getString('navProjects'),
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Colors.white),
            title: Text(
              AppLocalizations.of(context).getString('navContact'),
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onScrollToSection(3);
            },
          ),
        ],
      ),
    );
  }
}
