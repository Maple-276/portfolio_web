import 'package:flutter/material.dart';
import '../../../../core/widgets/section_container.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          Text(
            'Mis Servicios',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildServiceCard('Desarrollo Móvil', Icons.phone_android),
              _buildServiceCard('Desarrollo Web', Icons.web),
              _buildServiceCard('Diseño UI/UX', Icons.brush),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: Colors.blue),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
