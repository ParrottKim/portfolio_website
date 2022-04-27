import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:themed/themed.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late PageController _pageController;
  final Duration _animationDuration = const Duration(milliseconds: 500);
  final Cubic _curve = Curves.ease;
  late double _pageOffset;

  @override
  void initState() {
    super.initState();
    _pageOffset = 0;
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
        () => setState(() => _pageOffset = _pageController.page ?? 0));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusHeight = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        ParallaxArea(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ParallaxWidget(
              child: Center(
                child: Text(
                  'PAGE ${index + 1}',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              background: BlurAnimation(
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 1000),
                child: ChangeColors(
                  saturation: isDarkMode ? -0.7 : 0.0,
                  child: Image.asset(
                    'assets/images/background${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _pageOffset >= 0.9,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
              onPressed: () => _pageController.previousPage(
                  duration: _animationDuration, curve: _curve),
            ),
          ),
        ),
        Visibility(
          visible: _pageOffset <= 0.9,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              onPressed: () => _pageController.nextPage(
                  duration: _animationDuration, curve: _curve),
            ),
          ),
        ),
      ],
    );
  }
}
