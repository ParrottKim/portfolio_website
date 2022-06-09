import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/resume/resume_screen.dart';

class Location extends StatelessWidget {
  final Duration delay;
  final Size size;
  const Location({
    Key? key,
    this.delay = const Duration(milliseconds: 1000),
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LocationSmallScreen(),
      tablet: LocationLargeScreen(),
      desktop: LocationLargeScreen(),
    );
  }
}

class LocationSmallScreen extends StatelessWidget {
  const LocationSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(maxHeight: 360.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SvgPicture.asset(
                    'assets/images/location_mobile.svg',
                    fit: BoxFit.cover,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                  SvgPicture.asset(
                    'assets/images/location_mobile_marker.svg',
                    fit: BoxFit.cover,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 1500),
            offset: Offset(-10.0, 0.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THANKS FOR READING!',
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 48.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => html.window.open(
                        'https://drive.google.com/file/d/1zBlf0heHU1T4_uzzfeKWK-lfJJNoCwH2/view?usp=sharing',
                        '_blank'),
                    child: Text(
                      'See Resume',
                      style: TextStyle(fontFamily: 'SCDREAM'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationLargeScreen extends StatelessWidget {
  const LocationLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(maxHeight: size.height * 0.6),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/location_desktop.svg',
                    fit: BoxFit.cover,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                  SvgPicture.asset(
                    !Responsive.isMobile(context)
                        ? 'assets/images/location_desktop_marker.svg'
                        : 'assets/images/location_mobile_marker.svg',
                    fit: BoxFit.cover,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 1500),
            offset: Offset(-10.0, 0.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THANKS FOR READING!',
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 64.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => html.window.open(
                        'https://drive.google.com/file/d/1zBlf0heHU1T4_uzzfeKWK-lfJJNoCwH2/view?usp=sharing',
                        '_blank'),
                    child: Text(
                      'See Resume',
                      style: TextStyle(fontFamily: 'SCDREAM'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
