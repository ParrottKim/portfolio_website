import 'package:flutter/material.dart';
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
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Subtitle(
            text: 'ABOUT ME',
            delay: Duration(milliseconds: 500),
            size: Responsive.isDesktop(context) ? 60.0 : 46.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          Catchphrase(
            delay: Duration(milliseconds: 750),
          ),
          Padding(
            padding: !Responsive.isMobile(context)
                ? EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: size.width * 0.07)
                : EdgeInsets.symmetric(vertical: 30.0),
            child: Speciality(
              delay: Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    );
  }
}
