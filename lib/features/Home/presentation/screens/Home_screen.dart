import 'package:flutter/material.dart';
import '../../../../core/widgets/section_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: Colors.blue.shade50, // Ejemplo de color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido a mi Portafolio',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Soy Alexander, desarrollador experto en Flutter y soluciones web modulares.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: () {}, child: const Text('Ver Proyectos')),
        ],
      ),
    );
  }
}
