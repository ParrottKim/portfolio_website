import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/responsive.dart';

class PolygonProgressIndicator extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final int sides;
  final double size;
  final double strokeWidth;
  final Color color;
  final bool isRepeat;

  const PolygonProgressIndicator({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 2000),
    this.sides = 6,
    this.size = 60.0,
    this.strokeWidth = 2.0,
    this.color = Colors.white,
    this.isRepeat = true,
  }) : super(key: key);

  @override
  State<PolygonProgressIndicator> createState() =>
      _PolygonProgressIndicatorState();
}

class _PolygonProgressIndicatorState extends State<PolygonProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _startAnimation;
  late Animation<double> _endAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _startAnimation = Tween<double>(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _endAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller
          ..forward()
          ..addListener(() {
            if (widget.isRepeat && _controller.isCompleted) {
              _controller.repeat();
            }
          });
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
    if (widget.sides != 4) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
          width: widget.size,
          height: widget.size,
          decoration: ShapeDecoration(
            shape: PolygonShapeBorder(
              sides: widget.sides,
              border: DynamicBorderSide(
                style: BorderStyle.solid,
                width: widget.strokeWidth,
                color: widget.color,
                begin: _startAnimation.value.toPercentLength,
                end: _endAnimation.value.toPercentLength,
                strokeJoin: StrokeJoin.miter,
                strokeCap: StrokeCap.square,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.child,
          ),
        ),
      );
    } else {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
          width: widget.size,
          height: widget.size,
          decoration: ShapeDecoration(
            shape: RectangleShapeBorder(
              border: DynamicBorderSide(
                style: BorderStyle.solid,
                width: widget.strokeWidth,
                color: widget.color,
                begin: _startAnimation.value.toPercentLength,
                end: _endAnimation.value.toPercentLength,
                strokeJoin: StrokeJoin.miter,
                strokeCap: StrokeCap.square,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.child,
          ),
        ),
      );
    }
  }
}
