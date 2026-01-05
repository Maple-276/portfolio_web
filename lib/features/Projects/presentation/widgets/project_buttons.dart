import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/l10n/app_localizations.dart';

class ProjectButtons extends StatelessWidget {
  final String? githubUrl;

  const ProjectButtons({super.key, this.githubUrl});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (githubUrl != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _launchUrl(githubUrl!),
              icon: const Icon(Icons.code, size: 18),
              label: Text(
                AppLocalizations.of(context).getString('btnViewCode'),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryTeal),
                foregroundColor: AppColors.primaryTeal,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
      ],
    );
  }
}
