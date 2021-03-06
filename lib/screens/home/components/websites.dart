import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';

class Websites extends StatelessWidget {
  const Websites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeAnimation(
          delay: Duration(
              milliseconds: Responsive.isDesktop(context) ? 3000 : 2000),
          duration: Duration(milliseconds: 250),
          offset: Offset(0.0, 10.0),
          child: IconButton(
            icon: Icon(MdiIcons.github),
            splashRadius: 24.0,
            onPressed: () {
              html.window.open('https://github.com/ParrottKim', '_blank');
            },
          ),
        ),
        FadeAnimation(
          delay: Duration(
              milliseconds: Responsive.isDesktop(context) ? 3250 : 2250),
          duration: Duration(milliseconds: 250),
          offset: Offset(0.0, 10.0),
          child: IconButton(
            icon: Icon(MdiIcons.instagram),
            splashRadius: 24.0,
            onPressed: () {
              html.window
                  .open('https://www.instagram.com/parrottkim_', '_blank');
            },
          ),
        ),
        FadeAnimation(
          delay: Duration(
              milliseconds: Responsive.isDesktop(context) ? 3500 : 2500),
          duration: Duration(milliseconds: 250),
          offset: Offset(0.0, 10.0),
          child: IconButton(
            icon: Icon(MdiIcons.gmail),
            splashRadius: 24.0,
            onPressed: () {
              html.window.open('mailto:parrottkim21@gmail.com', '_blank');
            },
          ),
        ),
      ],
    );
  }
}
