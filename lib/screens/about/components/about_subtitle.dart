import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/fade_animation.dart';

class AboutSubtitle extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const AboutSubtitle(
      {Key? key,
      required this.text,
      this.size = 40.0,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.bebasNeue(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Container(
            height: 4.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Colors.teal,
              gradient: LinearGradient(
                colors: [
                  Colors.teal[200]!,
                  Colors.teal,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
