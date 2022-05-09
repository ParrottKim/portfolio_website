import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/home/components/skills.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: Responsive.isDesktop(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        FadeAnimation(
          delay: Duration(milliseconds: 250),
          duration: Duration(milliseconds: 250),
          offset: Offset(-10.0, 0.0),
          child: Text(
            'MOBILE APP DEVELOPER',
            style: GoogleFonts.bebasNeue(
              fontSize: 24.0,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        FadeAnimation(
          delay: Duration(milliseconds: 500),
          duration: Duration(milliseconds: 250),
          offset: Offset(-10.0, 0.0),
          child: Text(
            'HYUNJIN KIM',
            style: GoogleFonts.bebasNeue(
              fontSize: 60.0,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          FadeAnimation(
            delay: Duration(milliseconds: 750),
            duration: Duration(milliseconds: 250),
            offset: Offset(-10.0, 0.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                  'Frontend mobile application developer, based in Korea Republic.'),
            ),
          ),
        FadeAnimation(
            delay: Duration(milliseconds: Responsive.isDesktop(context) ? 1000 : 750),
            duration: Duration(
                milliseconds: 250),
            offset: Offset(-10.0, 0.0),
            child: SizedBox(width: 50.0, child: Divider())),
        Skills(),
      ],
    );
  }
}
