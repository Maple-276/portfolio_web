import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Card reutilizable para mostrar información de servicios
class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: ResponsiveUtils.dimension(context, AppSizes.serviceCardWidth),
        height: ResponsiveUtils.dimension(context, AppSizes.serviceCardHeight),
        padding: EdgeInsets.all(
          ResponsiveUtils.dimension(context, AppSizes.serviceCardPadding),
        ),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.cardTeal,
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.dimension(
              context,
              AppSizes.serviceCardBorderRadius,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.4 : 0.25),
              blurRadius: _isHovered ? 20 : 12,
              offset: Offset(0, _isHovered ? 8 : 5),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: ResponsiveUtils.dimension(
                context,
                AppSizes.serviceCardIconSize,
              ),
              color: Colors.black87,
            ),
            SizedBox(height: ResponsiveUtils.spacing(context, AppSpacing.md)),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveUtils.fontSize(
                  context,
                  AppTextSizes.serviceCardTitle,
                ),
              ),
            ),
            SizedBox(height: ResponsiveUtils.spacing(context, AppSpacing.sm)),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: ResponsiveUtils.fontSize(
                  context,
                  AppTextSizes.serviceCardDescription,
                ),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
