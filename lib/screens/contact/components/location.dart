import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/responsive.dart';

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
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        FadeAnimation(
          delay: delay,
          offset: Offset(0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(maxHeight: size.height * 0.7),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  !Responsive.isMobile(context)
                      ? 'assets/images/location_desktop.svg'
                      : 'assets/images/location_mobile.svg',
                  fit: BoxFit.cover,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
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
          delay: delay + Duration(milliseconds: 500),
          offset: Offset(-10.0, 0.0),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: !Responsive.isMobile(context) ? 32.0 : 16.0,
                vertical: !Responsive.isMobile(context) ? 16.0 : 8.0),
            child: Text(
              'GET IN TOUCH',
              style: GoogleFonts.bebasNeue(
                fontSize: !Responsive.isMobile(context) ? 64.0 : 56.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
