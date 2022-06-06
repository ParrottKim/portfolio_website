import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/catchphrase.dart';
import 'package:portfolio_website/screens/about/components/speciality.dart';
import 'package:portfolio_website/screens/main/components/subtitle.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              LinearAnimation(
                delay: Duration(milliseconds: 500),
                child: Subtitle(
                  text: 'ABOUT ME',
                  size: Responsive.isDesktop(context) ? 60.0 : 46.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              FadeAnimation(
                delay: Duration(milliseconds: 750),
                duration: Duration(milliseconds: 500),
                offset: Offset(-20.0, 0.0),
                child: Catchphrase(),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Speciality(
            delay: Duration(milliseconds: 1000),
          ),
        ],
      ),
    );
  }
}
