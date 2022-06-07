import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/animations/linear_animaiton.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const Subtitle({
    Key? key,
    required this.text,
    this.size = 40.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearAnimation(
      delay: Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.bebasNeue(
                fontSize: size,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              height: 4.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onSecondary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
