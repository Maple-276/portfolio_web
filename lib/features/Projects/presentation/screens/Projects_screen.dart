import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_container.dart';
import '../../data/repositories/projects_repository_impl.dart';
import '../widgets/project_card.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/widgets/fade_in_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // En una app real, usaríamos Inyección de Dependencias (GetIt/Riverpod)
    final projectsRepository = ProjectsRepositoryImpl();
    final projects = projectsRepository.getProjects();
    final width = MediaQuery.of(context).size.width;

    return SectionContainer(
      // Color distintivo para separar visualmente de "Services"
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          // Header Section
          FadeInAnimation(
            delay: Duration.zero,
            child: Text(
              AppLocalizations.of(context).getString('projectsTitle'),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 40,
                color: AppColors.primaryTeal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          FadeInAnimation(
            delay: const Duration(milliseconds: 100),
            child: Text(
              AppLocalizations.of(context).getString('projectsSubtitle'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),

          // Usamos Wrap para una grilla responsive simple
          Wrap(
            spacing: 30, // Espacio horizontal
            runSpacing: 30, // Espacio vertical
            alignment: WrapAlignment.center,
            children: projects.asMap().entries.map((entry) {
              final index = entry.key;
              final project = entry.value;

              // Definir ancho de tarjeta basado en pantalla
              double cardWidth;
              if (width > 1100) {
                cardWidth = 350; // Desktop: ~3 por fila
              } else if (width > 700) {
                cardWidth = (width - 100) / 2; // Tablet: 2 por fila
              } else {
                cardWidth = width - 40; // Mobile: 1 por fila (full width)
              }

              return FadeInAnimation(
                delay: Duration(milliseconds: 100 + (index * 100)),
                child: SizedBox(
                  width: cardWidth,
                  child: ProjectCard(project: project),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 60),

          // Botón "Ver Más" (Github Link)
          FadeInAnimation(
            delay: const Duration(milliseconds: 500),
            child: OutlinedButton(
              onPressed: () async {
                const url = 'https://github.com/Maple-276';
                if (!await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                )) {
                  debugPrint('Could not launch $url');
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryTeal, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).getString('viewMoreGithub'),
                style: const TextStyle(
                  color: AppColors.primaryTeal,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
