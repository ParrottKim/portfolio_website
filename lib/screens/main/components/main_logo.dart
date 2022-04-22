import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLogo extends StatelessWidget {
  final double size;
  const MainLogo({Key? key, this.size = 30.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size,
            height: size,
            child: Image.asset(
              'assets/icons/parrot.png',
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            'PARROTT KIM',
            style: GoogleFonts.bebasNeue(
              fontSize: size,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
