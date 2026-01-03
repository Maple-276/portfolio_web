import '../../domain/models/project_model.dart';
import '../../domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  List<ProjectModel> getProjects() {
    return [
      const ProjectModel(
        title: 'Portfolio Web',
        description:
            'Mi portafolio personal construido con Flutter Web. Diseño responsivo, animaciones personalizadas y soporte multi-idioma.',
        imageUrl: 'assets/projects/portfolio.webp', // Placeholder
        tags: ['Flutter', 'Dart', 'Web', 'Responsive'],
        githubUrl: 'https://github.com/alexander-p/portfolio',
        projectUrl: 'https://alexander-p.dev',
      ),
      const ProjectModel(
        title: 'E-Commerce App',
        description:
            'Aplicación móvil de comercio electrónico con pasarela de pagos, gestión de carrito y panel de administración.',
        imageUrl: 'assets/projects/ecommerce.webp', // Placeholder
        tags: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
        githubUrl: 'https://github.com/alexander-p/ecommerce',
      ),
      const ProjectModel(
        title: 'Task Manager API',
        description:
            'Backend RESTful para gestión de tareas y usuarios, construido con Node.js y MongoDB. Autenticación JWT.',
        imageUrl: 'assets/projects/api.webp', // Placeholder
        tags: ['Node.js', 'Express', 'MongoDB', 'API'],
        githubUrl: 'https://github.com/alexander-p/task-manager',
      ),
      const ProjectModel(
        title: 'Weather Dashboard',
        description:
            'Dashboard de clima en tiempo real consumiendo OpenWeatherMap API. Gráficos interactivos y geolocalización.',
        imageUrl: 'assets/projects/weather.webp', // Placeholder
        tags: ['React', 'TypeScript', 'Chart.js', 'API'],
        projectUrl: 'https://weather-dashboard-demo.com',
      ),
    ];
  }
}
