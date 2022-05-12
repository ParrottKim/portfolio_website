import 'package:easy_localization/easy_localization.dart';
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
        _position < size.height * 0.40 ? 1 : size.height * 0.01 / _position;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavigationAppBar(
        opacity: _opacity,
      ),
      drawer: Responsive.isMobile(context) ? NavigationDrawer() : null,
      body: PageView(
        controller: _screenProvider.pageController,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          HomeScreen(),
          AboutScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String text = '';
          if (context.locale == Locale('en', 'US')) {
            await context
                .setLocale(Locale('ko', 'KR'))
                .then((_) => text = '언어가 변경되었습니다.');
          } else {
            await context
                .setLocale(Locale('en', 'US'))
                .then((_) => text = 'Language has changed.');
          }
          setState(() {});
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(text)));
        },
        child: Icon(Icons.g_translate),
      ),
    );
  }
}
