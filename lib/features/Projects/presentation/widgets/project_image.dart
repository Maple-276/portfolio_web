import 'dart:ui';
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
      color: AppColors.serviceBackground,
      child: ClipRRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Blurred Background (Zoomed)
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                cacheWidth: 800,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),

            // 2. Dim Overlay
            Container(color: Colors.black.withValues(alpha: 0.3)),

            // 3. Main Image (Contained & Centered)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                cacheWidth: 800,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  // Fallback elegante si la imagen no existe
                  return Container(
                    color: AppColors.serviceBackground,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Image Pending',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.2),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
