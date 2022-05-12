import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/components/subtitle.dart';

class Technologies extends StatelessWidget {
  const Technologies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      child: Responsive(
        mobile: TechnologiesMobile(),
        desktop: TechnologiesDesktop(),
      ),
      background: BlurAnimation(
        delay: Duration(milliseconds: 1000),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(
              //   Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
              //   BlendMode.dstATop,
              // ),
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

class TechnologiesDesktop extends StatelessWidget {
  const TechnologiesDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 100.0, bottom: 80.0, left: 80.0, right: 80.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FadeAnimation(
                  delay: Duration(milliseconds: 1250),
                  offset: Offset(0.0, 0.0),
                  child: Subtitle(text: 'TECH', size: 80.0),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth - 160.0,
                      minHeight: constraints.maxHeight - 180.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                    child: Column(
                      children: [
                        FadeAnimation(
                          delay: Duration(milliseconds: 1500),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            'TECHNOLOGIES',
                            style: TextStyle(
                              fontFamily: 'SCDREAM',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TechnologiesMobile extends StatelessWidget {
  const TechnologiesMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(top: 60.0, bottom: 40.0, left: 40.0, right: 40.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth - 80.0,
                minHeight: constraints.maxHeight - 100.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
              child: Column(
                children: [
                  FadeAnimation(
                    delay: Duration(milliseconds: 1250),
                    offset: Offset(0.0, 0.0),
                    child: Subtitle(text: 'TECH'),
                  ),
                  FadeAnimation(
                    delay: Duration(milliseconds: 1500),
                    offset: Offset(0.0, 0.0),
                    child: Text(
                      'TECHNOLOGIES',
                      style: TextStyle(
                        fontFamily: 'SCDREAM',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
