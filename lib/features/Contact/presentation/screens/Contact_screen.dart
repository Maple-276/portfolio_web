import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/widgets/section_container.dart';
import '../../data/repositories/contact_repository_impl.dart';
import '../widgets/contact_info_item.dart';
import '../widgets/social_button.dart';
import '../widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactInfo = ContactRepositoryImpl().getContactInfo();
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return SectionContainer(
      backgroundColor: Colors.white.withValues(alpha: 0.02),
      child: Column(
        children: [
          // Header
          Text(
            AppLocalizations.of(context).getString('contactTitle'),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 40,
              color: AppColors.primaryTeal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).getString('contactSubtitle'),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          // Content
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: isDesktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Column: Contact Info
              SizedBox(
                width: isDesktop ? 400 : width,
                child: Column(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    ContactInfoItem(
                      icon: Icons.email_outlined,
                      title: AppLocalizations.of(
                        context,
                      ).getString('contactEmail'),
                      content: contactInfo.email,
                      onTap: () => _launchUrl('mailto:${contactInfo.email}'),
                    ),
                    const SizedBox(height: 30),
                    ContactInfoItem(
                      icon: Icons.location_on_outlined,
                      title: AppLocalizations.of(
                        context,
                      ).getString('contactLocation'),
                      content: contactInfo.location,
                    ),
                    const SizedBox(height: 30),
                    // Social Links
                    Text(
                      AppLocalizations.of(context).getString('contactFollowMe'),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: Icons.code, // GitHub
                          onTap: () => _launchUrl(contactInfo.githubUrl),
                        ),
                        const SizedBox(width: 15),
                        SocialButton(
                          icon: Icons.work, // LinkedIn
                          onTap: () => _launchUrl(contactInfo.linkedinUrl),
                        ),
                        const SizedBox(width: 15),
                        SocialButton(
                          icon: FontAwesomeIcons.whatsapp, // WhatsApp
                          onTap: () => _launchUrl(contactInfo.whatsappUrl),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              if (isDesktop)
                const SizedBox(width: 80)
              else
                const SizedBox(height: 60),

              // Right Column: Form
              ContactForm(width: isDesktop ? 500 : width),
            ],
          ),
        ],
      ),
    );
  }
}
