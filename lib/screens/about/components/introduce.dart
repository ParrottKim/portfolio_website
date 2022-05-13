import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

class Introduce extends StatelessWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      child: AllLayout(),
      background: BlurAnimation(
        offset: 0.7,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/background1.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllLayout extends StatelessWidget {
  const AllLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 100.0, bottom: 60.0, left: 60.0, right: 60.0)
          : EdgeInsets.only(top: 60.0, bottom: 40.0, left: 40.0, right: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearAnimation(
            delay: Duration(milliseconds: 500),
            child: Subtitle(
              text: 'HELLO',
              size: Responsive.isDesktop(context) ? 80.0 : 60.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 16.0),
          LinearAnimation(
            delay: Duration(milliseconds: 750),
            duration: Duration(milliseconds: 800),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '“',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontSize: Responsive.isDesktop(context) ? 36.0 : 24.0,
                    fontWeight: FontWeight.w900,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Text(
                    'about1'.tr(),
                    style: TextStyle(
                      fontFamily: 'SCDREAM',
                      fontSize: Responsive.isDesktop(context) ? 24.0 : 16.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  '”',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontSize: Responsive.isDesktop(context) ? 36.0 : 24.0,
                    fontWeight: FontWeight.w900,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
