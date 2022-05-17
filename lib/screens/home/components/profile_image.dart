import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/responsive.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  const ProfileImage({Key? key, this.size = 200.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: Duration(milliseconds: 1000),
      offset: Offset(0.0, 0.0),
      child: HexagonProgressAnimation(
        delay: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 750),
        size: size,
        strokeWidth: Responsive.isMobile(context) ? 10.0 : 20.0,
        image: AssetImage('assets/images/profile_image.png'),
      ),
    );
  }
}
