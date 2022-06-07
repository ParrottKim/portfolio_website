import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: Duration(milliseconds: 1000),
      duration: Duration(milliseconds: 500),
      offset: Offset(-20.0, 0.0),
      child: Text(
        'tech1'.tr(),
        style: TextStyle(
          fontFamily: 'SCDREAM',
          fontSize: Responsive.isDesktop(context) ? 20.0 : 14.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
