import 'package:portfolio_website/models/tech_model.dart';

class ProjectModel {
  final String asset, title, link, subtitle;
  final String? demo;
  final List<TechModel> techs;

  ProjectModel({
    required this.asset,
    required this.title,
    required this.link,
    required this.subtitle,
    required this.techs,
    this.demo,
  });
}
