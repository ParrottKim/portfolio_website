import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

import '../../../animations/linear_animaiton.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      child: MobileLayout(),
      background: BlurAnimation(
        offset: 0.7,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/background2.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  final List _items = [
    IconTile(
      icon: MdiIcons.eye,
      text: 'about2-1'.tr(),
      content: 'about2-1-1'.tr(),
    ),
    IconTile(
      icon: MdiIcons.calendarMonthOutline,
      text: 'about2-2'.tr(),
      content: 'about2-2-1'.tr(),
    ),
    IconTile(
      icon: MdiIcons.calendarMonthOutline,
      text: 'about2-3'.tr(),
      content: 'about2-3-1'.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 100.0, bottom: 60.0, left: 60.0, right: 60.0)
          : EdgeInsets.only(top: 60.0, bottom: 40.0, left: 40.0, right: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearAnimation(
            delay: Duration(milliseconds: 500),
            child: Subtitle(
              text: 'ABOUT ME',
              size: Responsive.isDesktop(context) ? 80.0 : 60.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 16.0),
          FadeAnimation(
            delay: Duration(milliseconds: 750),
            offset: Offset(00.0, 0.0),
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isDesktop(context) ? 3 : 1,
                  mainAxisExtent: 90.0,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) => FadeAnimation(
                  delay: Duration(milliseconds: 1000 + (index * 250)),
                  offset: Offset(10.0, 0.0),
                  child: _items[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String content;
  const IconTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  width: 3.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child:
                  Icon(icon, size: Responsive.isDesktop(context) ? 36.0 : 28.0),
            ),
            SizedBox(width: Responsive.isDesktop(context) ? 14.0 : 10.0),
            Text(
              text,
              style: context.locale == Locale('en', 'US')
                  ? GoogleFonts.bebasNeue(
                      fontSize: Responsive.isDesktop(context) ? 30.0 : 22.0,
                      fontWeight: FontWeight.w900,
                    )
                  : TextStyle(
                      fontFamily: 'SCDREAM',
                      fontSize: Responsive.isDesktop(context) ? 28.0 : 20.0,
                      fontWeight: FontWeight.w900,
                    ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Text(content),
      ],
    );
  }
}
