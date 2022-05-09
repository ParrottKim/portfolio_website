import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:themed/themed.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      fixedVertical: true,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Responsive(
          mobile: IntroduceMobile(),
          desktop: IntroduceMobile(),
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeAnimation(
          delay: Duration(milliseconds: 250),
          offset: Offset(0.0, 0.0),
          child: Text(
            'ABOUT ME',
            style: GoogleFonts.bebasNeue(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
