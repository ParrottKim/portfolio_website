import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
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
      Projects(
        asset: 'assets/projects/portfolio.png',
        title: 'Porfolio Website',
        subtitle: '${'project1-1'.tr()}\n${'project1-2'.tr()}',
        techs: [
          TechModel(
            asset: 'assets/icons/flutter.svg',
            title: 'Flutter',
          ),
        ],
      ),
      Projects(
        asset: 'assets/projects/ignite.png',
        title: 'Ignite',
        subtitle: '${'project2-1'.tr()}\n${'project2-2'.tr()}',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: SizedBox(
                    height: size.height * 0.5,
                    child: ParallaxArea(
                      child: PageView.builder(
                        controller: _pageController,
                        itemBuilder: (context, index) => _pages[index],
                      ),
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
