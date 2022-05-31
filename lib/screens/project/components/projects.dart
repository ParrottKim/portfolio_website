import 'dart:html' as html;

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/providers/theme_provider.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:provider/provider.dart';

class Projects extends StatelessWidget {
  final Duration delay;
  final ProjectModel project;

  const Projects({
    Key? key,
    this.delay = const Duration(milliseconds: 1500),
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: size.width * 0.15),
      child: ClayContainer(
        color: Theme.of(context).scaffoldBackgroundColor,
        curveType: CurveType.none,
        borderRadius: 10.0,
        depth: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ParallaxWidget(
            child: Padding(
              padding: !Responsive.isMobile(context)
                  ? const EdgeInsets.all(32.0)
                  : const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            project.title,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: 'SCDREAM',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(MdiIcons.github),
                            splashRadius: 24.0,
                            onPressed: () {
                              html.window.open(project.link, '_blank');
                            },
                          ),
                          if (project.demo != null)
                            IconButton(
                              icon: Icon(MdiIcons.export),
                              splashRadius: 24.0,
                              onPressed: () {
                                html.window.open(project.demo!, '_blank');
                              },
                            ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        project.subtitle,
                        style: TextStyle(
                          fontFamily: 'SCDREAM',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  TechListView(techs: project.techs),
                ],
              ),
            ),
            background: BlurAnimation(
              borderRadius: 10.0,
              offset:
                  Provider.of<ThemeProvider>(context, listen: false).darkTheme
                      ? 0.7
                      : 0.9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(project.asset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TechListView extends StatelessWidget {
  final List<TechModel> techs;
  const TechListView({Key? key, required this.techs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techs.length,
        itemBuilder: (context, index) => Card(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  techs[index].asset,
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
                SizedBox(width: 6.0),
                Text(
                  techs[index].title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
