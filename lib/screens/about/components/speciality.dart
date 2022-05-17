import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

import '../../../animations/linear_animaiton.dart';

class Speciality extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Duration delay;
  final Duration firstDelay;
  final Duration secondDelay;
  final Duration thirdDelay;
  const Speciality({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
    this.delay = const Duration(milliseconds: 500),
    this.firstDelay = const Duration(milliseconds: 500),
    this.secondDelay = const Duration(milliseconds: 750),
    this.thirdDelay = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeAnimation(
              delay: delay + firstDelay,
              offset: Offset(0.0, 0.0),
              child: HexagonProgressAnimation(
                delay: delay + firstDelay,
                size: 60.0,
                strokeWidth: 5.0,
                icon: icon,
              ),
            ),
            SizedBox(width: Responsive.isDesktop(context) ? 14.0 : 10.0),
            LinearAnimation(
                delay: delay + secondDelay,
                child: SpecialityTitle(text: title)),
          ],
        ),
        SizedBox(height: 8.0),
        FadeAnimation(
          delay: delay + thirdDelay,
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class SpecialityTitle extends StatelessWidget {
  final String text;
  const SpecialityTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double spacing = 0.5;

    if (!Responsive.isDesktop(context)) {
      if (text.length > 10) {
        spacing = 0.5;
      } else if (text.length > 8) {
        spacing = 2.6;
      } else if (text.length > 4) {
        spacing = 9.2;
      }
    }

    return Text(
      text,
      style: context.locale == Locale('en', 'US')
          ? GoogleFonts.bebasNeue(
              fontSize: Responsive.isDesktop(context) ? 30.0 : 22.0,
              fontWeight: FontWeight.w900,
              letterSpacing: spacing,
              wordSpacing: 0.0,
            )
          : TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: Responsive.isDesktop(context) ? 28.0 : 20.0,
              fontWeight: FontWeight.w900,
              letterSpacing: spacing,
              wordSpacing: 0.0,
            ),
    );
  }
}
