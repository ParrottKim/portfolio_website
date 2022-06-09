import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeEducation extends StatelessWidget {
  const ResumeEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 160.0,
              child: Text(
                'EDUCATION',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 0.3,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Text(
          '2012 - 2019',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            color: Colors.black.withOpacity(0.7),
            letterSpacing: 4.0,
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          'BACHELOR OF COMPUTER ENGINEERING',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        Text(
          '컴퓨터 공학 학사',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          '계명대학교, 대구',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
