import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/screen_provider.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';
import 'package:portfolio_website/services/fade_animation.dart';
import 'package:provider/provider.dart';

class NavigationAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double opacity;
  NavigationAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return AppBar(
        elevation: 0.0,
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(widget.opacity),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(milliseconds: 1000),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MainLogo(
                  size: 18.0,
                ),
              ),
            ),
            const SizedBox(width: 40.0),
            AppBarItemList(),
          ],
        ),
      );
    } else {
      return AppBar(
        elevation: 0.0,
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(widget.opacity),
      );
    }
  }
}

class AppBarItemList extends StatefulWidget {
  AppBarItemList({Key? key}) : super(key: key);

  @override
  State<AppBarItemList> createState() => _AppBarItemListState();
}

class _AppBarItemListState extends State<AppBarItemList> {
  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  List<bool> _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _sectionsName.length,
      itemBuilder: (context, index) => FadeAnimation(
        duration: Duration(milliseconds: 250),
        delay: Duration(milliseconds: 1250 + (index * 250)),
        offset: Offset(0, -10),
        child: InkWell(
          onTap: () => Provider.of<ScreenProvider>(context, listen: false)
              .updateScreen(index.toDouble()),
          onHover: (value) => setState(() => _isHovering[index] = value),
          hoverColor: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 60.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    height: 1.0,
                    width: 20.0,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.7),
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
