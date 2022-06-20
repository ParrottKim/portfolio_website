import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Responsive(
        mobile: InformationSmallScreen(),
        tablet: InformationLargeScreen(),
        desktop: InformationLargeScreen(),
      ),
    );
  }
}

class InformationSmallScreen extends StatelessWidget {
  const InformationSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.15, vertical: size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 1500),
            offset: Offset(-10.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Based in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Seoul, South Korea'),
              ],
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 1750),
            offset: Offset(0.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('parrottkim21@gmail.com'),
              ],
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 2000),
            offset: Offset(0.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KakaoTalk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('parrottkim'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InformationLargeScreen extends StatelessWidget {
  const InformationLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'parrottkim21@gmail.com',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '+82 10 3886 3281',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text('Gwanak-gu'),
                        Text('Seoul, South Korea'),
                      ],
                    ),
                  ),
                  Text(
                    'Hyunjin Kim',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(MdiIcons.github),
                    splashRadius: 24.0,
                    onPressed: () {
                      html.window
                          .open('https://github.com/ParrottKim', '_blank');
                    },
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.instagram),
                    splashRadius: 24.0,
                    onPressed: () {
                      html.window.open(
                          'https://www.instagram.com/parrottkim_', '_blank');
                    },
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.gmail),
                    splashRadius: 24.0,
                    onPressed: () {
                      html.window
                          .open('mailto:parrottkim21@gmail.com', '_blank');
                    },
                  ),
                ],
              ),
            ),
          ),
          // FadeAnimation(
          //   delay: Duration(milliseconds: 1500),
          //   offset: Offset(0.0, 10.0),
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: size.width * 0.2,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Based in',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Text('Seoul, South Korea'),
          //       ],
          //     ),
          //   ),
          // ),
          // FadeAnimation(
          //   delay: Duration(milliseconds: 1750),
          //   offset: Offset(0.0, 10.0),
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: size.width * 0.2,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Email',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Text('parrottkim21@gmail.com'),
          //       ],
          //     ),
          //   ),
          // ),
          // FadeAnimation(
          //   delay: Duration(milliseconds: 2000),
          //   offset: Offset(0.0, 10.0),
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: size.width * 0.2,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'KakaoTalk',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Text('parrottkim'),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
