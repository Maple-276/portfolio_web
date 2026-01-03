import '../models/project_model.dart';

abstract class ProjectsRepository {
  List<ProjectModel> getProjects();
}
