import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/screen_provider.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';
import 'package:portfolio_website/services/fade_animation.dart';
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
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: MainLogo(
                size: 30.0,
              ),
            ),
            Divider(
              thickness: 0.1,
              color: Theme.of(context).colorScheme.primary,
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
    "HOME",
    "ABOUT",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _sectionsName.length,
      itemBuilder: (context, index) => FadeAnimation(
        duration: Duration(milliseconds: 250),
        delay: Duration(milliseconds: index * 250),
        offset: Offset(0, -10),
        child: ListTile(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
            Provider.of<ScreenProvider>(context, listen: false)
                .updateScreen(index.toDouble());
            Navigator.of(context).pop();
          },
          hoverColor: Colors.transparent,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _sectionsName[index],
                style: GoogleFonts.roboto(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
