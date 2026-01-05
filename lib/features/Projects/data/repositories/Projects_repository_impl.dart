import '../../domain/models/project_model.dart';
import '../../domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  List<ProjectModel> getProjects() {
    return [
      const ProjectModel(
        title: 'projTitle1', // No Smoke
        description: 'projDesc1',
        imageUrl: 'assets/projects/no_smoke.webp', // Placeholder
        tags: ['Flutter', 'Mobile', 'Health', 'Riverpod'],
        githubUrl: 'https://github.com/Maple-276/no_smoke',
        galleryImages: [
          'assets/projects/no_smoke_home.webp',
          'assets/projects/no_smoke_history.webp',
          'assets/projects/no_smoke_progress.webp',
          'assets/projects/no_smoke_panic.webp',
          'assets/projects/no_smoke_login.webp',
        ],
      ),
      const ProjectModel(
        title: 'projTitle2', // Nuclear Lake
        description: 'projDesc2',
        imageUrl: 'assets/projects/nuclear_lake.webp', // Placeholder
        tags: ['Flutter', 'Game Dev', 'Flame', 'Procedural Gen'],
        githubUrl: 'https://github.com/Maple-276/nuclear_lake',
      ),
      const ProjectModel(
        title: 'projTitle3', // Portfolio Web
        description: 'projDesc3',
        imageUrl: 'assets/projects/portfolio.webp', // Placeholder
        tags: ['Flutter Web', 'Responsive', 'EmailJS', 'Localization'],
        githubUrl: 'https://github.com/Maple-276/portfolio_web',
      ),
    ];
  }
}
