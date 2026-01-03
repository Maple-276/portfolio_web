import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          0.0,
          _isHovered ? -10.0 : 0.0,
          0.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.serviceBackground.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? AppColors.primaryTeal.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryTeal.withValues(
                alpha: _isHovered ? 0.2 : 0.0,
              ),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Imagen del Proyecto (Placeholder gradient por ahora si no hay asset real)
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, AppColors.serviceBackground],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.code_rounded,
                    size: 60,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                // Placeholder: Descomentar para usar imagen real cuando esté disponible
                // child: Image.asset(
                //   widget.project.imageUrl,
                //   fit: BoxFit.cover,
                //   errorBuilder: (context, error, stackTrace) => ...,
                // ),
              ),

              // 2. Contenido
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),

                    // 3. Tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryTeal.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primaryTeal.withValues(
                                alpha: 0.3,
                              ),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: AppColors.primaryTeal,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 25),

                    // 4. Botones
                    Row(
                      children: [
                        if (widget.project.projectUrl != null)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  _launchUrl(widget.project.projectUrl!),
                              icon: const Icon(Icons.language, size: 18),
                              label: const Text('Live Demo'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryTeal,
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        if (widget.project.projectUrl != null &&
                            widget.project.githubUrl != null)
                          const SizedBox(width: 10),

                        if (widget.project.githubUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  _launchUrl(widget.project.githubUrl!),
                              icon: const Icon(Icons.code, size: 18),
                              label: const Text('View Code'),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppColors.primaryTeal,
                                ),
                                foregroundColor: AppColors.primaryTeal,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
