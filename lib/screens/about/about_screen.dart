import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/catchphrase.dart';
import 'package:portfolio_website/screens/about/components/speciality.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              LinearAnimation(
                delay: Duration(milliseconds: 500),
                child: Subtitle(
                  text: 'ABOUT ME',
                  size: Responsive.isDesktop(context) ? 60.0 : 46.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              FadeAnimation(
                delay: Duration(milliseconds: 750),
                duration: Duration(milliseconds: 500),
                offset: Offset(-20.0, 0.0),
                child: Catchphrase(),
              ),
            ],
          ),
          SizedBox(height: 60.0),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Speciality(
                    delay: Duration(milliseconds: 1000),
                    icon: MdiIcons.eye,
                    title: 'about2-1'.tr(),
                    content: 'about2-1-1'.tr(),
                  ),
                ),
                Expanded(
                  child: Speciality(
                    delay: Duration(milliseconds: 2000),
                    icon: MdiIcons.rocket,
                    title: 'about2-2'.tr(),
                    content: 'about2-2-1'.tr(),
                  ),
                ),
                Expanded(
                  child: Speciality(
                    delay: Duration(milliseconds: 3000),
                    icon: MdiIcons.circleExpand,
                    title: 'about2-3'.tr(),
                    content: 'about2-3-1'.tr(),
                  ),
                ),
              ],
            ),
          if (!Responsive.isDesktop(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Speciality(
                  delay: Duration(milliseconds: 1000),
                  icon: MdiIcons.eye,
                  title: 'about2-1'.tr(),
                  content: 'about2-1-1'.tr(),
                ),
                SizedBox(height: 12.0),
                Speciality(
                  delay: Duration(milliseconds: 2000),
                  icon: MdiIcons.rocket,
                  title: 'about2-2'.tr(),
                  content: 'about2-2-1'.tr(),
                ),
                SizedBox(height: 12.0),
                Speciality(
                  delay: Duration(milliseconds: 3000),
                  icon: MdiIcons.circleExpand,
                  title: 'about2-3'.tr(),
                  content: 'about2-3-1'.tr(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
