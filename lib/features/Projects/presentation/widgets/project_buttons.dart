import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';

class ProjectButtons extends StatelessWidget {
  final String? projectUrl;
  final String? githubUrl;

  const ProjectButtons({super.key, this.projectUrl, this.githubUrl});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (projectUrl != null)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _launchUrl(projectUrl!),
              icon: const Icon(Icons.language, size: 18),
              label: const Text('Live Demo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryTeal,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        if (projectUrl != null && githubUrl != null) const SizedBox(width: 10),

        if (githubUrl != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _launchUrl(githubUrl!),
              icon: const Icon(Icons.code, size: 18),
              label: const Text('View Code'),
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
