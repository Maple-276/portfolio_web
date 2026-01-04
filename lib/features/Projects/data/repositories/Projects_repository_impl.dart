import '../../domain/models/project_model.dart';
import '../../domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  List<ProjectModel> getProjects() {
    return [
      const ProjectModel(
        title: 'projTitle1',
        description: 'projDesc1',
        imageUrl: 'assets/projects/portfolio.webp', // Placeholder
        tags: ['Flutter', 'Dart', 'Web', 'Responsive'],
        githubUrl: 'https://github.com/alexander-p/portfolio',
        projectUrl: 'https://alexander-p.dev',
      ),
      const ProjectModel(
        title: 'projTitle2',
        description: 'projDesc2',
        imageUrl: 'assets/projects/ecommerce.webp', // Placeholder
        tags: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
        githubUrl: 'https://github.com/alexander-p/ecommerce',
      ),
      const ProjectModel(
        title: 'projTitle3',
        description: 'projDesc3',
        imageUrl: 'assets/projects/api.webp', // Placeholder
        tags: ['Node.js', 'Express', 'MongoDB', 'API'],
        githubUrl: 'https://github.com/alexander-p/task-manager',
      ),
      const ProjectModel(
        title: 'projTitle4',
        description: 'projDesc4',
        imageUrl: 'assets/projects/weather.webp', // Placeholder
        tags: ['React', 'TypeScript', 'Chart.js', 'API'],
        projectUrl: 'https://weather-dashboard-demo.com',
      ),
    ];
  }
}
