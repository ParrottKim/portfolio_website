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
        crossAxisCount: 3,
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

    return SizedBox(
      height: 60.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemCount: languages.length,
        itemBuilder: (context, index) => LanguageCircularCard(
          delay: delay * ((index + 1) / 4),
          language: languages[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 20.0),
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
          width: 58.0,
          height: 58.0,
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
  }
}
