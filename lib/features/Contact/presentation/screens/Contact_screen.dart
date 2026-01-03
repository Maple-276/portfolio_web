import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../data/repositories/contact_repository_impl.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactInfo = ContactRepositoryImpl().getContactInfo();
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return SectionContainer(
      // Fondo sutil para diferenciar
      backgroundColor: Colors.white.withValues(alpha: 0.02),
      child: Column(
        children: [
          // Header
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 40,
              color: AppColors.primaryTeal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Have a project in mind? Let\'s talk.',
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
                    _ContactInfoItem(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      content: contactInfo.email,
                      onTap: () => _launchUrl('mailto:${contactInfo.email}'),
                    ),
                    const SizedBox(height: 30),
                    _ContactInfoItem(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      content: contactInfo.location,
                    ),
                    const SizedBox(height: 30),
                    // Social Links
                    Text(
                      'Follow Me',
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
                        _SocialButton(
                          icon: Icons.code, // GitHub placeholder icon
                          onTap: () => _launchUrl(contactInfo.githubUrl),
                        ),
                        const SizedBox(width: 15),
                        _SocialButton(
                          icon: Icons.work, // LinkedIn placeholder icon
                          onTap: () => _launchUrl(contactInfo.linkedinUrl),
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
              Container(
                width: isDesktop ? 500 : width,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppColors.serviceBackground.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Send a Message',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 30),
                      _CustomTextField(
                        controller: _nameController,
                        label: 'Name',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                      _CustomTextField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 20),
                      _CustomTextField(
                        controller: _messageController,
                        label: 'Message',
                        maxLines: 4,
                        icon: Icons.message_outlined,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO: Implement send logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Message Sent! (Mock)'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryTeal,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Send Message',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryTeal.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primaryTeal, size: 24),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
                Text(
                  content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primaryTeal : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryTeal, width: 1.5),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? Colors.black : AppColors.primaryTeal,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white54),
        labelStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryTeal),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.2),
      ),
    );
  }
}
