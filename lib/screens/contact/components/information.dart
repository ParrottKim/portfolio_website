import 'package:flutter/material.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 1500),
            offset: Offset(0.0, 10.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.2,
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
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 1750),
            offset: Offset(0.0, 10.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.2,
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
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 2000),
            offset: Offset(0.0, 10.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.2,
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
          ),
        ],
      ),
    );
  }
}
