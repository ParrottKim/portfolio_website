import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';
import 'package:portfolio_website/screens/main/components/subtitle.dart';
import 'package:portfolio_website/screens/project/components/projects.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late PageController _pageController;
  final Duration _animationDuration = const Duration(milliseconds: 500);
  final Cubic _curve = Curves.ease;
  late double _pageOffset;
  @override
  void initState() {
    super.initState();
    _pageOffset = 0;
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
        () => setState(() => _pageOffset = _pageController.page ?? 0));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List _pages = [
      ProjectModel(
        asset: 'assets/projects/portfolio.png',
        title: 'Porfolio Website',
        link: 'https://github.com/ParrottKim/portfolio_website',
        subtitle: '${'project1-1'.tr()}\n\n${'project1-2'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/flutter.svg',
            title: 'Flutter',
          ),
        ],
      ),
      ProjectModel(
        asset: 'assets/projects/ignite.png',
        title: 'Ignite',
        link: 'https://github.com/ParrottKim/ignite',
        subtitle:
            '${'project2-1'.tr()}\n\n${'project2-2'.tr()}\n${'project2-3'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/flutter.svg',
            title: 'Flutter',
          ),
          TechModel(
            asset: 'assets/icons/firebase.svg',
            title: 'Firebase',
          ),
        ],
      ),
      ProjectModel(
        asset: 'assets/projects/flutter_responsive_dashboard.png',
        title: 'Flutter Responsive Dashboard',
        link: 'https://github.com/ParrottKim/flutter-responsive-dashboard',
        subtitle:
            '${'project3-1'.tr()}\n\n${'project3-2'.tr()}\n${'project3-3'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/flutter.svg',
            title: 'Flutter',
          ),
        ],
        demo: 'https://flutter-responsive-dashb-6b370.web.app',
      ),
      ProjectModel(
        asset: 'assets/images/background2.jpg',
        title: 'Bluetooth Example',
        link: 'https://github.com/ParrottKim/bluetooth-example',
        subtitle:
            '${'project4-1'.tr()}\n\n${'project4-2'.tr()}\n${'project4-3'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/flutter.svg',
            title: 'Flutter',
          ),
        ],
      ),
      ProjectModel(
        asset: 'assets/images/background1.jpg',
        title: 'Node.js Server Example',
        link: 'https://github.com/ParrottKim/node-js-server-example',
        subtitle: '${'project5-1'.tr()}\n\n${'project5-2'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/nodedotjs.svg',
            title: 'Node.js',
          ),
          TechModel(
            asset: 'assets/icons/express.svg',
            title: 'Express',
          ),
          TechModel(
            asset: 'assets/icons/mariadb.svg',
            title: 'MariaDB',
          ),
          TechModel(
            asset: 'assets/icons/json.svg',
            title: 'REST API',
          ),
        ],
      ),
    ];

    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.15, right: size.width * 0.15),
          child: Subtitle(
            text: 'PROJECTS',
            delay: Duration(milliseconds: 500),
            size: Responsive.isDesktop(context) ? 60.0 : 46.0,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        FadeAnimation(
          delay: Duration(milliseconds: 1500),
          offset: Offset(0.0, 0.0),
          child: Padding(
            padding: !Responsive.isMobile(context)
                ? EdgeInsets.symmetric(horizontal: size.width * 0.05)
                : EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  child: ParallaxArea(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pages.length,
                      itemBuilder: (context, index) =>
                          Projects(project: _pages[index]),
                    ),
                  ),
                ),
                Visibility(
                  visible: _pageOffset >= 0.9,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => _pageController.previousPage(
                          duration: _animationDuration, curve: _curve),
                    ),
                  ),
                ),
                Visibility(
                  visible: _pageOffset <= _pages.length - 1.1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => _pageController.nextPage(
                          duration: _animationDuration, curve: _curve),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
