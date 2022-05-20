import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';
import 'package:portfolio_website/screens/tech/components/languages.dart';

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
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
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
                  'tech1'.tr(),
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
          SizedBox(height: 60.0),
          Languages(
            delay: const Duration(milliseconds: 1000),
            firstDelay: const Duration(milliseconds: 1250),
            secondDelay: const Duration(milliseconds: 2250),
            percentage: 0.8,
            asset: 'assets/icons/flutter.svg',
          ),
          SizedBox(height: 20.0),
          Languages(
            delay: const Duration(milliseconds: 1250),
            firstDelay: const Duration(milliseconds: 1500),
            secondDelay: const Duration(milliseconds: 2500),
            percentage: 0.6,
            asset: 'assets/icons/csharp.svg',
          ),
          SizedBox(height: 20.0),
          Languages(
            delay: const Duration(milliseconds: 1500),
            firstDelay: const Duration(milliseconds: 1750),
            secondDelay: const Duration(milliseconds: 2750),
            percentage: 0.2,
            asset: 'assets/icons/javascript.svg',
          ),
        ],
      ),
    );
  }
}
