import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';

class Projects extends StatelessWidget {
  final Duration delay;
  final String asset, title, subtitle;
  final List<TechModel> techs;

  const Projects({
    Key? key,
    this.delay = const Duration(milliseconds: 1500),
    required this.asset,
    required this.title,
    required this.subtitle,
    required this.techs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: size.width * 0.15),
      child: ClayContainer(
        color: Theme.of(context).scaffoldBackgroundColor,
        curveType: CurveType.none,
        borderRadius: 10.0,
        depth: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ParallaxWidget(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'SCDREAM',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'SCDREAM',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  TechListView(techs: techs),
                ],
              ),
            ),
            background: BlurAnimation(
              borderRadius: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(asset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TechListView extends StatelessWidget {
  final List<TechModel> techs;
  const TechListView({Key? key, required this.techs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techs.length,
        itemBuilder: (context, index) => Card(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  techs[index].asset,
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  techs[index].title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
