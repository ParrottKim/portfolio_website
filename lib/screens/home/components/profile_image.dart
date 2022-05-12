import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/blur_animation.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  const ProfileImage({Key? key, this.size = 200.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurAnimation(
      delay: Duration(microseconds: 500),
      duration: Duration(milliseconds: 500),
      blurOffset: 0.01,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size / 2.0),
          child: Image.asset('assets/images/profile_image.png'),
        ),
      ),
    );
  }
}
