import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/hexagon_progress_animation.dart';
import 'package:portfolio_website/screens/contact/components/location.dart';
import 'package:portfolio_website/screens/main/components/main_logo.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 60.0),
        Location(size: size),
      ],
    );
  }
}
