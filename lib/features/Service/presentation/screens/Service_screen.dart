import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/fade_in_animation.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../widgets/service_card.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.serviceBackground,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
        ), // Espacio para la imagen superpuesta
        child: Column(
          children: [
            FadeInAnimation(
              delay: const Duration(milliseconds: 200),
              child: Text(
                'Services',
                style: GoogleFonts.playfairDisplay(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                  fontSize: ResponsiveUtils.fontSize(
                    context,
                    AppTextSizes.servicesTitle,
                  ),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: ResponsiveUtils.spacing(context, AppSpacing.xxl)),
            Wrap(
              spacing: ResponsiveUtils.spacing(
                context,
                AppSpacing.serviceCardSpacing,
              ),
              runSpacing: ResponsiveUtils.spacing(
                context,
                AppSpacing.serviceCardSpacing,
              ),
              alignment: WrapAlignment.center,
              children: [
                FadeInAnimation(
                  delay: const Duration(milliseconds: 400),
                  child: const ServiceCard(
                    icon: Icons.code,
                    title: 'Development',
                    description:
                        'Application development from scratch to deployment',
                  ),
                ),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 600),
                  child: const ServiceCard(
                    icon: Icons.brush,
                    title: 'Custome UI/UX',
                    description:
                        'Design your application to your minimalist request or however you want it',
                  ),
                ),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 800),
                  child: const ServiceCard(
                    icon: Icons.settings,
                    title: 'Maintance',
                    description:
                        'Continuous updates, bug fixing, and performance monitoring to keep your app running smoothly',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
