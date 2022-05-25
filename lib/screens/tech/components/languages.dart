import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/models/language_model.dart';
import 'package:portfolio_website/responsive.dart';

class Languages extends StatelessWidget {
  final Duration delay;
  const Languages({
    Key? key,
    required this.delay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LanguageGridView(
        delay: delay,
        crossAxisCount: 3,
      ),
      desktop: LanguageGridView(
        delay: delay,
      ),
    );
  }
}

class LanguageGridView extends StatelessWidget {
  final Duration delay;
  final int crossAxisCount;
  const LanguageGridView({
    Key? key,
    required this.delay,
    this.crossAxisCount = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List languages = [
      LanguageModel(
        asset: 'assets/icons/flutter.svg',
        title: 'Flutter',
      ),
      LanguageModel(
        asset: 'assets/icons/csharp.svg',
        title: 'C#',
      ),
      LanguageModel(
        asset: 'assets/icons/javascript.svg',
        title: 'Javascript',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: languages.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 120.0,
      ),
      itemBuilder: (context, index) => LanguageCircularCard(
        delay: delay * ((index + 1) / 2),
        language: languages[index],
      ),
    );
  }
}

class LanguageCircularCard extends StatelessWidget {
  final Duration delay;
  final LanguageModel language;
  const LanguageCircularCard({
    Key? key,
    required this.delay,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PolygonProgressIndicator(
          delay: delay,
          duration: Duration(milliseconds: 1000),
          sides: 0,
          width: 60.0,
          height: 60.0,
          color: Colors.teal,
          isRepeat: false,
          child: SizedBox(),
        ),
        FadeAnimation(
          delay: delay + Duration(milliseconds: 1000),
          offset: Offset(0.0, 0.0),
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(language.asset!, color: Colors.white),
            ),
          ),
        ),
      ],
    );
    // return Row(
    //   children: [
    //     FadeAnimation(
    //       delay: delay,
    //       offset: Offset(0.0, 0.0),
    //       child: SizedBox(
    //         width: 60.0,
    //         height: 60.0,
    //         child: HexagonProgressAnimation(
    //           delay: Duration(milliseconds: 1000),
    //           size: 60.0,
    //           strokeWidth: 5.0,
    //           child: SvgPicture.asset(
    //             asset,
    //             color: Theme.of(context).colorScheme.primary,
    //             width: Responsive.isDesktop(context) ? 36.0 : 28.0,
    //             height: Responsive.isDesktop(context) ? 36.0 : 28.0,
    //           ),
    //         ),
    //       ),
    //     ),
    //     SizedBox(width: 16.0),
    //     Expanded(
    //       child: Stack(
    //         children: [
    //           RotatedBox(
    //             quarterTurns: 2,
    //             child: PolygonProgressIndicator(
    //               delay: firstDelay,
    //               duration: Duration(milliseconds: 1000),
    //               sides: 4,
    //               width: double.infinity,
    //               height: 20.0,
    //               color: Colors.teal,
    //               isRepeat: false,
    //               child: SizedBox(),
    //             ),
    //           ),
    //           FadeAnimation(
    //             delay: secondDelay,
    //             offset: Offset(0.0, 0.0),
    //             child: Container(
    //               height: 20.0,
    //               color: Theme.of(context).canvasColor,
    //             ),
    //           ),
    //           LinearAnimation(
    //             delay: secondDelay,
    //             duration: Duration(milliseconds: 1000),
    //             curve: Curves.easeInCubic,
    //             alignment: Alignment.topLeft,
    //             child: LinearProgressIndicator(
    //               minHeight: 20.0,
    //               color: Colors.teal,
    //               backgroundColor: Colors.transparent,
    //               value: percentage,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(width: 16.0),
    //     FadeAnimation(
    //       delay: secondDelay + Duration(milliseconds: 1000),
    //       offset: Offset(0.0, 0.0),
    //       child: Text(
    //         '${(percentage * 100).toInt()} %',
    //         style: TextStyle(
    //           fontFamily: 'SCDREAM',
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
