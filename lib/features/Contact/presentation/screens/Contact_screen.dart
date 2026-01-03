import 'package:flutter/material.dart';
import '../../../../core/widgets/section_container.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: Colors.grey.shade100,
      child: Column(
        children: [
          Text('Contáctame', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 20),
          const Text('¿Tienes un proyecto en mente? Hablemos.'),
          const SizedBox(height: 40),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text('Enviar Mensaje'),
            ),
          ),
        ],
      ),
    );
  }
}
