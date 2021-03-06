import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlurAnimation extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Duration delay;
  final Duration duration;
  final double offset;
  BlurAnimation({
    Key? key,
    required this.child,
    this.borderRadius = 0.0,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.offset = 0.7,
  }) : super(key: key);

  @override
  State<BlurAnimation> createState() => _BlurAnimationState();
}

class _BlurAnimationState extends State<BlurAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _blurAnimation;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _blurAnimation = Tween(begin: 0.01, end: 3.0).animate(_controller);
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          widget.child,
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: _blurAnimation.value, sigmaY: _blurAnimation.value),
              child: Opacity(
                opacity: _controller.value,
                child: Transform.translate(
                  offset:
                      Offset(_opacityAnimation.value, _opacityAnimation.value),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(widget.offset),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
