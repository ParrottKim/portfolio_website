import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';

class Technologies extends StatelessWidget {
  const Technologies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      fixedVertical: true,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Responsive(
          mobile: TechnologiesMobile(),
          desktop: TechnologiesMobile(),
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            image: AssetImage(
              'assets/images/background2.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class TechnologiesDesktop extends StatelessWidget {
  const TechnologiesDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TechnologiesTablet extends StatelessWidget {
  const TechnologiesTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TechnologiesMobile extends StatelessWidget {
  const TechnologiesMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeAnimation(
          delay: Duration(milliseconds: 250),
          offset: Offset(0.0, 0.0),
          child: Text(
            'TECHNOLOGIES USED',
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
