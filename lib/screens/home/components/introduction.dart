import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/home/components/websites.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: Responsive.isDesktop(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        FadeAnimation(
          delay: Duration(milliseconds: 1000),
          duration: Duration(milliseconds: 500),
          offset: Offset(-10.0, 0.0),
          child: Text(
            'MOBILE APP DEVELOPER',
            style: GoogleFonts.bebasNeue(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        FadeAnimation(
          delay: Duration(milliseconds: 1500),
          duration: Duration(milliseconds: 500),
          offset: Offset(-10.0, 0.0),
          child: Text(
            'PARROTT KIM',
            style: GoogleFonts.bebasNeue(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          FadeAnimation(
            delay: Duration(milliseconds: 2000),
            duration: Duration(milliseconds: 500),
            offset: Offset(-10.0, 0.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'home1'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        if (Responsive.isDesktop(context))
          FadeAnimation(
            delay: Duration(milliseconds: 2500),
            duration: Duration(milliseconds: 500),
            offset: Offset(-10.0, 0.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'home2'.tr(),
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        FadeAnimation(
          delay: Duration(
              milliseconds: Responsive.isDesktop(context) ? 3000 : 2000),
          duration: Duration(milliseconds: 500),
          offset: Offset(0.0, 0.0),
          child: Divider(
            color: Theme.of(context).colorScheme.primary,
            indent: size.width / 2 - 24.0,
            endIndent: size.width / 2 - 24.0,
          ),
        ),
        Websites(),
      ],
    );
  }
}
