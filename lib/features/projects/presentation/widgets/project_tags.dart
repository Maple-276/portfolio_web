import 'package:flutter/material.dart';
import 'package:portfolio_web/core/theme/app_theme.dart';

class ProjectTags extends StatelessWidget {
  final List<String> tags;

  const ProjectTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryTeal.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            tag,
            style: const TextStyle(
              color: AppColors.primaryTeal,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
