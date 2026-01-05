class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final String? projectUrl;
  final String? githubUrl;
  final List<String>? galleryImages;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.projectUrl,
    this.githubUrl,
    this.galleryImages,
  });
}
