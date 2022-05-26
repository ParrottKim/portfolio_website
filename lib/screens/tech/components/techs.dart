import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';
import 'package:portfolio_website/animations/polygon_progress_indicator.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';

class Techs extends StatelessWidget {
  final Duration delay;
  final List techs;
  const Techs({
    Key? key,
    required this.delay,
    required this.techs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TechGridView(
      delay: delay,
      techs: techs,
    );
  }
}

class TechGridView extends StatelessWidget {
  final Duration delay;
  final List techs;
  const TechGridView({
    Key? key,
    required this.delay,
    required this.techs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: techs.length,
        itemBuilder: (context, index) => TechCircularCard(
          delay: delay + Duration(milliseconds: 100 * (index + 1)),
          language: techs[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 20.0),
      ),
    );
  }
}

class TechCircularCard extends StatefulWidget {
  final Duration delay;
  final TechModel language;
  const TechCircularCard({
    Key? key,
    required this.delay,
    required this.language,
  }) : super(key: key);

  @override
  State<TechCircularCard> createState() => _TechCircularCardState();
}

class _TechCircularCardState extends State<TechCircularCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 50.0, end: 60.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        if (value) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => JustTheTooltip(
          waitDuration: Duration(milliseconds: 300),
          tailLength: 8.0,
          tailBaseWidth: 16.0,
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(widget.language.title!),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PolygonProgressIndicator(
                delay: widget.delay,
                duration: Duration(milliseconds: 1000),
                sides: 0,
                width: _animation.value - 2.0,
                height: _animation.value - 2.0,
                color: Colors.teal,
                isRepeat: false,
                child: SizedBox(),
              ),
              FadeAnimation(
                delay: widget.delay + Duration(milliseconds: 1000),
                offset: Offset(0.0, 0.0),
                child: Container(
                  alignment: Alignment.center,
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  child: SvgPicture.asset(
                    widget.language.asset!,
                    width: _animation.value - 28.0,
                    height: _animation.value - 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
