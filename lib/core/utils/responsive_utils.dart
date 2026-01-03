import 'package:flutter/material.dart';

/// Utilidad para obtener tamaños responsivos basados en el ancho de pantalla
class ResponsiveUtils {
  /// Obtiene un factor de escala basado en el ancho de pantalla
  /// Ajustado para que se vea como al 80% de ancho
  static double getScaleFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return 0.75; // Móvil más compacto
    } else if (width < 1024) {
      return 0.85; // Tablet compacto
    } else if (width < 1440) {
      return 0.95; // Desktop mediano compacto
    } else {
      return 1.0; // Pantallas grandes, tamaño base
    }
  }

  /// Escala un tamaño de fuente según el ancho de pantalla
  static double fontSize(BuildContext context, double baseSize) {
    return baseSize * getScaleFactor(context);
  }

  /// Escala un espaciado según el ancho de pantalla
  static double spacing(BuildContext context, double baseSpacing) {
    return baseSpacing * getScaleFactor(context);
  }

  /// Escala dimensiones (width/height) según el ancho de pantalla
  static double dimension(BuildContext context, double baseDimension) {
    return baseDimension * getScaleFactor(context);
  }

  /// Determina si es una pantalla móvil
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// Determina si es una pantalla tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  /// Determina si es una pantalla desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }
}
