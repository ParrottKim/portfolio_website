import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              LinearAnimation(
                delay: Duration(milliseconds: 500),
                child: Subtitle(
                  text: 'TECH STACKS',
                  size: Responsive.isDesktop(context) ? 60.0 : 46.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              FadeAnimation(
                delay: Duration(milliseconds: 750),
                duration: Duration(milliseconds: 500),
                offset: Offset(-20.0, 0.0),
                child: Text(
                  'Here, look at the things I got.',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontSize: Responsive.isDesktop(context) ? 20.0 : 14.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Stack(
            children: [
              PolygonProgressIndicator(
                delay: Duration(milliseconds: 1000),
                sides: 4,
                size: 100.0,
                color: Colors.teal,
                isRepeat: false,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
