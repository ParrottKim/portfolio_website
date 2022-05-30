import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HexagonProgressAnimation(
        size: 400.0,
        strokeWidth: 30.0,
        child: MainLogo(
          size: 50.0,
        ),
      ),
    );
  }
}
