import 'package:flutter/material.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/fade_in_animation.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/responsive_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.darkBackground,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 60,
        ), // Espacio para la imagen que se desplaza
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: ResponsiveUtils.spacing(
            context,
            AppSpacing.heroContentSpacing,
          ),
          runSpacing: ResponsiveUtils.spacing(
            context,
            AppSpacing.heroRunSpacing,
          ),
          children: [
            // Text Content with Animation
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, I am developer',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: ResponsiveUtils.fontSize(
                              context,
                              AppTextSizes.heroGreeting,
                            ),
                            letterSpacing: 0.5,
                          ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.spacing(context, AppSpacing.xs),
                    ),
                    Text(
                      'Mobile | Web',
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveUtils.fontSize(
                              context,
                              AppTextSizes.heroTitle,
                            ),
                            letterSpacing: -0.5,
                            height: 1.1,
                          ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.spacing(context, AppSpacing.sm),
                    ),
                    Text(
                      'Specialist flutter developer',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontSize: ResponsiveUtils.fontSize(
                          context,
                          AppTextSizes.heroSubtitle,
                        ),
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.spacing(context, AppSpacing.xl),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryButton(text: 'View Profile', onPressed: () {}),
                        SizedBox(
                          width: ResponsiveUtils.spacing(
                            context,
                            AppSpacing.sm,
                          ),
                        ),
                        SecondaryButton(text: 'Know more', onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Profile Image with Animation - Overlaps with next section
            FadeInAnimation(
              delay: const Duration(milliseconds: 400),
              child: Transform.translate(
                offset: const Offset(0, 60), // Desplaza 60px hacia abajo
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ResponsiveUtils.dimension(
                      context,
                      AppSizes.heroImageBorderRadius,
                    ),
                  ),
                  child: Image.asset(
                    'assets/hero_image.webp', // ✅ Optimizado con WebP
                    width: ResponsiveUtils.dimension(
                      context,
                      AppSizes.heroImageWidth,
                    ),
                    height: ResponsiveUtils.dimension(
                      context,
                      AppSizes.heroImageHeight,
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    // Optimización: Solo cacheWidth para mantener aspect ratio
                    cacheWidth: 900, // 2x para pantallas retina
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
