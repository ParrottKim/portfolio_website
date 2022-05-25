import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';

class Catchphrase extends StatelessWidget {
  final Duration delay;
  const Catchphrase({
    Key? key,
    this.delay = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: delay,
      duration: Duration(milliseconds: 500),
      offset: Offset(-20.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '“',
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: Responsive.isDesktop(context) ? 20.0 : 20.0,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Text(
              'about1'.tr().replaceAll('\n', ' '),
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontSize: Responsive.isDesktop(context) ? 20.0 : 14.0,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Text(
            '”',
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: Responsive.isDesktop(context) ? 30.0 : 20.0,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}
