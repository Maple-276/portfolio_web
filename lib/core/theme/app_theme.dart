import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Paleta EXACTA extraída del diseño original
  static const Color primaryTeal = Color(
    0xFF17DBA7,
  ); // Top Bar (usuario especificó #17DBA7)
  static const Color darkBackground = Color(
    0xFF040404,
  ); // Hero section y fondo (usuario especificó #040404)
  static const Color serviceBackground = Color(
    0xFF10342A,
  ); // Service section (usuario especificó #10342A)
  static const Color cardTeal = Color(
    0xFF17DBA7,
  ); // Cards en Service (mismo verde del navbar)
  static const Color textWhite = Colors.white;
  static const Color background = darkBackground; // Alias for convenience
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark, // El diseño es predominantemente oscuro
  scaffoldBackgroundColor: AppColors.darkBackground,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryTeal,
    primary: AppColors.primaryTeal,
    secondary: AppColors.cardTeal,
    surface: AppColors.darkBackground,
    brightness: Brightness.dark,
  ),

  // 1. Color de Selección de Texto (UX Premium)
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryTeal,
    selectionColor: AppColors.primaryTeal.withValues(alpha: 0.4),
    selectionHandleColor: AppColors.primaryTeal,
  ),

  // 2. Scrollbar Personalizado
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(
      AppColors.primaryTeal.withValues(alpha: 0.5),
    ),
    trackColor: WidgetStateProperty.all(Colors.white.withValues(alpha: 0.05)),
    radius: const Radius.circular(10),
    thickness: WidgetStateProperty.all(6),
    interactive: true,
  ),

  // Definimos estilos de texto globales para reutilizar
  textTheme: TextTheme(
    displayMedium: GoogleFonts.playfairDisplay(
      // Serif moderno y elegante para titulos grandes
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    displaySmall: GoogleFonts.merriweather(
      // Otro serif legible
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    headlineSmall: GoogleFonts.lato(
      // Sans serif limpio para subtitulos
      fontSize: 24,
      color: AppColors.textWhite,
    ),
    titleMedium: GoogleFonts.lato(color: AppColors.textWhite),
    bodyMedium: GoogleFonts.lato(color: AppColors.textWhite),
  ),
);
