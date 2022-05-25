import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/screen_provider.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: MainLogo(
                size: 30.0,
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            DrawerItemList(),
          ],
        ),
      ),
    );
  }
}

class DrawerItemList extends StatefulWidget {
  DrawerItemList({Key? key}) : super(key: key);

  @override
  State<DrawerItemList> createState() => _DrawerItemListState();
}

class _DrawerItemListState extends State<DrawerItemList> {
  int _currentIndex = 0;

  final List<String> _sectionsName = [
    'HOME',
    'ABOUT',
    'TECH STACK',
    'PROJECTS',
    'CONTACT'
  ];

  List<bool> _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _sectionsName.length,
      itemBuilder: (context, index) => FadeAnimation(
        duration: Duration(milliseconds: 250),
        delay: Duration(milliseconds: 250 * index),
        offset: Offset(0, -10),
        child: InkWell(
          onTap: () {
            Provider.of<ScreenProvider>(context, listen: false)
                .updateScreen(index.toDouble());
            Navigator.of(context).pop();
          },
          onHover: (value) => setState(() => _isHovering[index] = value),
          hoverColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  _sectionsName[index],
                  style: GoogleFonts.roboto(
                    color: _isHovering[index]
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                        : Theme.of(context).colorScheme.primary,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[index],
                  child: Container(
                    margin: EdgeInsets.only(top: 16.0),
                    height: 1.0,
                    width: 20.0,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
