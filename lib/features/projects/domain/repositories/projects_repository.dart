import 'package:portfolio_web/features/projects/domain/models/project_model.dart';

abstract class ProjectsRepository {
  List<ProjectModel> getProjects();
}
