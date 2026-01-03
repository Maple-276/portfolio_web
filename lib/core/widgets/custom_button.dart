import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/app_constants.dart';

/// Botón primario reutilizable (fondo blanco, texto negro)
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.buttonPaddingHorizontal,
          vertical: AppSizes.buttonPaddingVertical,
        ),
        elevation: 0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.buttonFontSize,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

/// Botón secundario reutilizable (fondo verde, texto negro)
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryTeal,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.buttonPaddingHorizontal,
          vertical: AppSizes.buttonPaddingVertical,
        ),
        elevation: 0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.buttonFontSize,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
