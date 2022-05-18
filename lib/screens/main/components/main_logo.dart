import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainLogo extends StatelessWidget {
  final double size;
  const MainLogo({Key? key, this.size = 30.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: size,
              height: size,
              child: SvgPicture.asset(
                'assets/icons/parrot.svg',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              'PARROTT KIM',
              style: GoogleFonts.bebasNeue(
                fontSize: size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
