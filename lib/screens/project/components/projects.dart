import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';

class Projects extends StatelessWidget {
  final String asset, title, subtitle;
  final Duration delay;

  const Projects({
    Key? key,
    required this.asset,
    required this.title,
    required this.subtitle,
    this.delay = const Duration(milliseconds: 1500),
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
        child: BlurAnimation(
          borderRadius: 10.0,
          child: ParallaxWidget(
            child: Stack(
              children: [],
            ),
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(asset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
