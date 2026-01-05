import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/fade_in_animation.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../widgets/service_card.dart';
import '../../../../core/l10n/app_localizations.dart';

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
              delay: Duration.zero,
              child: Text(
                AppLocalizations.of(context).getString('servicesTitle'),
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
                  delay: const Duration(milliseconds: 100),
                  child: ServiceCard(
                    icon: Icons.code,
                    title: AppLocalizations.of(
                      context,
                    ).getString('serviceDevelopmentTitle'),
                    description: AppLocalizations.of(
                      context,
                    ).getString('serviceDevelopmentDesc'),
                  ),
                ),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 200),
                  child: ServiceCard(
                    icon: Icons.brush,
                    title: AppLocalizations.of(
                      context,
                    ).getString('serviceUIUXTitle'),
                    description: AppLocalizations.of(
                      context,
                    ).getString('serviceUIUXDesc'),
                  ),
                ),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 300),
                  child: ServiceCard(
                    icon: Icons.settings,
                    title: AppLocalizations.of(
                      context,
                    ).getString('serviceMaintenanceTitle'),
                    description: AppLocalizations.of(
                      context,
                    ).getString('serviceMaintenanceDesc'),
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
