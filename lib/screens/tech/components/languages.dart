import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/responsive.dart';

class Languages extends StatelessWidget {
  final String asset;
  final double percentage;
  final Duration delay;
  final Duration firstDelay;
  final Duration secondDelay;
  const Languages({
    Key? key,
    required this.asset,
    this.percentage = 0.0,
    this.delay = const Duration(milliseconds: 1000),
    this.firstDelay = const Duration(milliseconds: 1250),
    this.secondDelay = const Duration(milliseconds: 2250),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeAnimation(
          delay: delay,
          offset: Offset(0.0, 0.0),
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: HexagonProgressAnimation(
              delay: Duration(milliseconds: 1000),
              size: 60.0,
              strokeWidth: 5.0,
              child: SvgPicture.asset(
                asset,
                color: Theme.of(context).colorScheme.primary,
                width: Responsive.isDesktop(context) ? 36.0 : 28.0,
                height: Responsive.isDesktop(context) ? 36.0 : 28.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Stack(
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: PolygonProgressIndicator(
                  delay: firstDelay,
                  duration: Duration(milliseconds: 1000),
                  sides: 4,
                  height: 20.0,
                  color: Colors.teal,
                  isRepeat: false,
                  child: Container(),
                ),
              ),
              FadeAnimation(
                delay: secondDelay,
                offset: Offset(0.0, 0.0),
                child: Container(
                  height: 20.0,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              LinearAnimation(
                delay: secondDelay,
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInCubic,
                alignment: Alignment.topLeft,
                child: LinearProgressIndicator(
                  minHeight: 20.0,
                  color: Colors.teal,
                  backgroundColor: Colors.transparent,
                  value: percentage,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.0),
        FadeAnimation(
          delay: secondDelay + Duration(milliseconds: 1000),
          offset: Offset(0.0, 0.0),
          child: Text(
            '${(percentage * 100).toInt()} %',
            style: TextStyle(
              fontFamily: 'SCDREAM',
            ),
          ),
        ),
      ],
    );
  }
}
