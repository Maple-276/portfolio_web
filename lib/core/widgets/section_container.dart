import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? height;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: backgroundColor,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sectionPaddingHorizontal,
            vertical: AppSpacing.sectionPaddingVertical,
          ),
          child: child,
        ),
      ),
    );
  }
}
