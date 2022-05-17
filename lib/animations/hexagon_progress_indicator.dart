import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:portfolio_website/responsive.dart';

class HexagonProgressIndicator extends StatefulWidget {
  final double? size;
  final double strokeWidth;
  final String asset;
  final Color color;

  const HexagonProgressIndicator({
    Key? key,
    this.size,
    this.strokeWidth = 2.0,
    required this.asset,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<HexagonProgressIndicator> createState() =>
      _HexagonProgressIndicatorState();
}

class _HexagonProgressIndicatorState extends State<HexagonProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _startAnimation;
  late Animation<double> _endAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..forward()
          ..addListener(() {
            if (_controller.isCompleted) _controller.repeat();
          });
    _startAnimation = Tween<double>(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _endAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);
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
              shape: PolygonShapeBorder(
                sides: 6,
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
            child: Image.asset(
              widget.asset,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}
