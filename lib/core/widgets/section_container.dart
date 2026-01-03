import 'package:flutter/material.dart';

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
    // Usamos LayoutBuilder para saber el ancho disponible si fuera necesario
    // pero para una estructura web clean, solemos querer un max-width para contenido
    return Container(
      width: double.infinity,
      height: height, // Puede ser null para altura dinamica
      color: backgroundColor,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200), // Max width para web
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: child,
        ),
      ),
    );
  }
}
