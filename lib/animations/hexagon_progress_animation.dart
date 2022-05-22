import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/responsive.dart';

class HexagonProgressAnimation extends StatefulWidget {
  final Widget? child;
  final Duration delay;
  final Duration duration;
  final double? size;
  final double strokeWidth;
  final Color barColor;
  final AssetImage? image;

  const HexagonProgressAnimation({
    Key? key,
    this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.barColor = Colors.teal,
    this.size,
    this.strokeWidth = 20.0,
    this.image,
  }) : super(key: key);

  @override
  State<HexagonProgressAnimation> createState() =>
      _HexagonProgressAnimationState();
}

class _HexagonProgressAnimationState extends State<HexagonProgressAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        width: widget.size,
        height: widget.size,
        decoration: ShapeDecoration(
          image: widget.image != null
              ? DecorationImage(
                  image: widget.image!,
                  scale: 1.4,
                  alignment: Alignment.bottomCenter,
                )
              : null,
          color: Theme.of(context).canvasColor,
          shape: PolygonShapeBorder(
            sides: 6,
            border: DynamicBorderSide(
              style: BorderStyle.solid,
              width: widget.strokeWidth,
              color: Colors.teal,
              gradient: LinearGradient(
                colors: [
                  Colors.teal[200]!,
                  Colors.teal,
                ],
              ),
              begin: 0.toPercentLength,
              end: _animation.value.toPercentLength,
              strokeJoin: StrokeJoin.miter,
              strokeCap: StrokeCap.square,
            ),
          ),
        ),
        child: widget.child != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.child,
              )
            : null,
      ),
    );
  }
}
