import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ParallaxWidget(
      fixedVertical: true,
      child: Column(
        children: [
          SizedBox(height: 60.0),
          FadeAnimation(
            delay: Duration(milliseconds: 500),
            offset: Offset(0.0, 0.0),
            child: Text(
              'ABOUT ME',
              style: GoogleFonts.bebasNeue(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 500),
            offset: Offset(0.0, 0.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
              indent: size.width / 2 - 24.0,
              endIndent: size.width / 2 - 24.0,
            ),
          ),
          Responsive(
            mobile: IntroduceMobile(),
            desktop: IntroduceMobile(),
          ),
        ],
      ),
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              BlendMode.dstATop,
            ),
            image: AssetImage(
              'assets/images/background1.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class IntroduceDesktop extends StatelessWidget {
  const IntroduceDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IntroduceTablet extends StatelessWidget {
  const IntroduceTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IntroduceMobile extends StatelessWidget {
  const IntroduceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
              delay: Duration(milliseconds: 750),
              offset: Offset(0.0, 0.0),
              child: Card(
                elevation: 2.0,
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'about1'.tr(),
                    style: TextStyle(
                      fontFamily: 'SCDREAM',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-1'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-2'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-3'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-4'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-5'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-6'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeAnimation(
              delay: Duration(milliseconds: 1000),
              offset: Offset(0.0, 0.0),
              child: Text(
                'about2-7'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
