import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/main/components/subtitle.dart';
import 'package:portfolio_website/screens/tech/components/description.dart';
import 'package:portfolio_website/screens/tech/components/header.dart';
import 'package:portfolio_website/screens/tech/components/tech_list.dart';
import 'package:portfolio_website/screens/tech/components/techs.dart';

class TechScreen extends StatelessWidget {
  TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Subtitle(
            text: 'TECH STACK',
            size: Responsive.isDesktop(context) ? 60.0 : 46.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          Description(),
          SizedBox(height: 60.0),
          TechList(),
        ],
      ),
    );
  }
}
