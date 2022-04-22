import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  double _currentIndex = 0;
  double get currentIndex => _currentIndex;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  updateScreen(double index) {
    _pageController.animateToPage(index.toInt(),
        duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
    _currentIndex = index;
    notifyListeners();
  }

  previousScreen() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
    notifyListeners();
  }

  nextScreen() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
    notifyListeners();
  }
}
