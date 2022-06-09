import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeExperience extends StatelessWidget {
  const ResumeExperience({Key? key}) : super(key: key);

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
                'EXPERIENCE',
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
          '2020 - Present',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            color: Colors.black.withOpacity(0.7),
            letterSpacing: 4.0,
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          'DAN-Tech Co.,Ltd',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        Text(
          '(주)단테크',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
            color: Colors.black.withOpacity(0.5),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사내 프로젝트 관리 프로그램·서버 개발 및 운영',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'C#, SQL Server',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '고객사 공장 커뮤니케이션 앱 기획 및 개발',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'Flutter, Node.js, Express, MariaDB',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '차량 - 안드로이드 블루투스 통신 앱 기획 및 개발',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'Flutter',
                  style: TextStyle(
                    fontFamily: 'SCDREAM',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
