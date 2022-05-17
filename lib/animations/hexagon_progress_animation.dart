import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/responsive.dart';

class HexagonProgressAnimation extends StatefulWidget {
  final Duration delay;
  final Duration duration;
  final double? size;
  final double strokeWidth;
  final Color barColor;
  final AssetImage? image;
  final IconData? icon;

  const HexagonProgressAnimation({
    Key? key,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.barColor = Colors.teal,
    this.size,
    this.strokeWidth = 20.0,
    this.image,
    this.icon,
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
    return LayoutBuilder(
      builder: (context, constraint) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            width: widget.size ?? constraint.biggest.width,
            height: widget.size ?? constraint.biggest.height,
            decoration: ShapeDecoration(
              image: widget.image != null
                  ? DecorationImage(image: widget.image!, scale: 1.5)
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
            child: widget.icon != null
                ? Icon(widget.icon,
                    size: Responsive.isDesktop(context) ? 36.0 : 28.0)
                : null,
          ),
        );
      },
    );
  }
}