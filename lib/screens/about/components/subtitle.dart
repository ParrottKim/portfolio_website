import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final double size;
  const Subtitle({Key? key, required this.text, this.size = 40.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 500),
            offset: Offset(0.0, 0.0),
            child: Text(
              text,
              style: GoogleFonts.bebasNeue(
                fontSize: size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 500),
            offset: Offset(0.0, 0.0),
            child: Container(
              height: 4.0,
              width: 50.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
