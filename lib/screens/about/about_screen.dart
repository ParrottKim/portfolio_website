import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
import 'package:portfolio_website/screens/about/components/introduce.dart';
import 'package:portfolio_website/screens/about/components/about_me.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late PageController _pageController;
  final Duration _animationDuration = const Duration(milliseconds: 1000);
  final Cubic _curve = Curves.ease;
  late double _pageOffset;

  List<Image> _images = [];

  @override
  void initState() {
    super.initState();
    _pageOffset = 0;
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
        () => setState(() => _pageOffset = _pageController.page ?? 0));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var element in _images) {
      precacheImage(element.image, context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ParallaxArea(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Introduce(),
              AboutMe(),
            ],
          ),
        ),
        Visibility(
          visible: _pageOffset >= 0.9,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () => _pageController.previousPage(
                  duration: _animationDuration, curve: _curve),
            ),
          ),
        ),
        Visibility(
          visible: _pageOffset <= 0.1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () => _pageController.nextPage(
                  duration: _animationDuration, curve: _curve),
            ),
          ),
        ),
      ],
    );
  }
}
