import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/screen_provider.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/about/about_screen.dart';
import 'package:portfolio_website/screens/home/home_screen.dart';
import 'package:portfolio_website/screens/main/components/navigation_appbar.dart';
import 'package:portfolio_website/screens/main/components/navigation_drawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScreenProvider _screenProvider;

  double _position = 1;
  double _opacity = 0;

  void _updatePageState() {
    setState(
        () => _position = _screenProvider.pageController.position.pixels.abs());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    _screenProvider.pageController.addListener(_updatePageState);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _opacity =
        _position < size.height * 0.40 ? _position / (size.height * 0.40) : 1;

    return Listener(
      onPointerSignal: (signal) {
        if (signal is PointerScrollEvent) {
          if (signal.scrollDelta.dy > 0) {
            _screenProvider.nextScreen();
          } else {
            _screenProvider.previousScreen();
          }
        }
      },
      onPointerMove: (signal) {
        if (kIsWeb) {
          if (signal is PointerMoveEvent) {
            if (signal.delta.dy > 2) {
              _screenProvider.previousScreen();
            } else if (signal.delta.dy == 0) {
              return;
            } else if (signal.delta.dy < -2) {
              _screenProvider.nextScreen();
            }
          }
        }
      },
      child: Scaffold(
        appBar: NavigationAppBar(
          opacity: _opacity,
        ),
        drawer: Responsive.isMobile(context) ? NavigationDrawer() : null,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _screenProvider.pageController,
          scrollDirection: Axis.vertical,
          children: [
            HomeScreen(),
            AboutScreen(),
          ],
        ),
      ),
    );
  }
}
