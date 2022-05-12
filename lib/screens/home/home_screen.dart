import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/parallax_area.dart';
import 'package:portfolio_website/animations/parallax_widget.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/home/components/introduction.dart';
import 'package:portfolio_website/screens/home/components/profile_image.dart';
import 'package:portfolio_website/screens/home/components/websites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeScreenMobile(),
      tablet: HomeScreenDesktop(),
      desktop: HomeScreenDesktop(),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ProfileImage(size: 200.0),
        SizedBox(height: 20.0),
        Introduction(),
      ],
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Introduction(),
        SizedBox(width: 100.0),
        ProfileImage(size: 400.0),
      ],
    );
  }
}
