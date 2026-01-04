import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
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
