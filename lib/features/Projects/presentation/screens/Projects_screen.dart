import 'package:flutter/material.dart';
import '../../../../core/widgets/section_container.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        children: [
          Text(
            'Mis Proyectos',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 40),
          // Placeholder grid
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'Aquí irán las tarjetas de proyectos.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
