import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/contact/components/information.dart';
import 'package:portfolio_website/screens/contact/components/location.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Location(size: size),
        Information(),
      ],
    );
  }
}
