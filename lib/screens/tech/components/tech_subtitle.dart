import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';

class TechSubtitle extends StatelessWidget {
  final Duration delay;
  const TechSubtitle({
    Key? key,
    this.delay = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: delay,
      duration: Duration(milliseconds: 500),
      offset: Offset(-20.0, 0.0),
      child: Text(
        'Languages',
        style: TextStyle(
          fontFamily: 'SCDREAM',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
