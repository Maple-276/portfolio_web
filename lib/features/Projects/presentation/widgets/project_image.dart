import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ProjectImage extends StatelessWidget {
  final String imageUrl;

  const ProjectImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, AppColors.serviceBackground],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.code_rounded,
          size: 60,
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      // Placeholder: Descomentar para usar imagen real cuando esté disponible
      // child: Image.asset(
      //   imageUrl,
      //   fit: BoxFit.cover,
      //   errorBuilder: (context, error, stackTrace) => ...,
      // ),
    );
  }
}
