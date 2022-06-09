import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/models/speciality_model.dart';
import 'package:portfolio_website/responsive.dart';

import '../../../animations/linear_animaiton.dart';

class Speciality extends StatelessWidget {
  const Speciality({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpecialityGridView(
      crossAxisCount: !Responsive.isMobile(context) ? 3 : 1,
      mainAxisExtent: !Responsive.isMobile(context) ? 120.0 : 160.0,
    );
  }
}

class SpecialityGridView extends StatelessWidget {
  final int crossAxisCount;
  final double mainAxisExtent;
  const SpecialityGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.mainAxisExtent = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List specialities = [
      SpecialityModel(
        icon: MdiIcons.eye,
        title: 'about2-1'.tr(),
        content: 'about2-1-1'.tr(),
      ),
      SpecialityModel(
        icon: MdiIcons.rocket,
        title: 'about2-2'.tr(),
        content: 'about2-2-1'.tr(),
      ),
      SpecialityModel(
        icon: MdiIcons.eye,
        title: 'about2-3'.tr(),
        content: 'about2-3-1'.tr(),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: specialities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) => SpecialityBuilder(
        delay: Duration(milliseconds: 1000) * (index + 1),
        speciality: specialities[index],
      ),
    );
  }
}

class SpecialityBuilder extends StatelessWidget {
  final Duration delay;
  final SpecialityModel speciality;
  const SpecialityBuilder({
    Key? key,
    required this.delay,
    required this.speciality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!Responsive.isMobile(context))
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeAnimation(
                delay: delay,
                offset: Offset(0.0, 0.0),
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: HexagonProgressAnimation(
                    delay: delay,
                    size: 60.0,
                    strokeWidth: 5.0,
                    child: Icon(speciality.icon),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              LinearAnimation(
                delay: delay + Duration(milliseconds: 250),
                child: SizedBox(
                  width: context.locale == Locale('en', 'US') ? 110.0 : 70.0,
                  child: SpecialityTitle(
                    text: speciality.title!,
                  ),
                ),
              ),
            ],
          ),
        if (Responsive.isMobile(context))
          Column(
            children: [
              FadeAnimation(
                delay: delay,
                offset: Offset(0.0, 0.0),
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: HexagonProgressAnimation(
                    delay: delay,
                    size: 60.0,
                    strokeWidth: 5.0,
                    child: Icon(speciality.icon),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              LinearAnimation(
                delay: delay + Duration(milliseconds: 250),
                alignment: Alignment.center,
                child: SizedBox(
                  child: SpecialityTitle(
                    text: speciality.title!,
                  ),
                ),
              ),
            ],
          ),
        SizedBox(height: Responsive.isDesktop(context) ? 16.0 : 8.0),
        FadeAnimation(
          delay: delay + Duration(milliseconds: 500),
          child: Text(
            speciality.content!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class SpecialityTitle extends StatelessWidget {
  final String text;
  const SpecialityTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.locale == Locale('en', 'US')
          ? TextStyle(
              fontFamily: 'Bebas Neue',
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            )
          : TextStyle(
              fontFamily: 'SCDREAM',
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
    );
  }
}
