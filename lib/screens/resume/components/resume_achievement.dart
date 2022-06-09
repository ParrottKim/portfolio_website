import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeAchievement extends StatelessWidget {
  const ResumeAchievement({Key? key}) : super(key: key);

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
                'ACHIEVEMENT',
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
          'Ignite',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 6.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              'Flutter로 처음 개발한 애플리케이션',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Text(
          'Flutter Responsive Dashboard',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 6.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              'Flutter를 이용한 반응형 애플리케이션 개발',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Text(
          'Portfolio Website',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 6.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              '애니메이션 등 다양한 기능 도입',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
