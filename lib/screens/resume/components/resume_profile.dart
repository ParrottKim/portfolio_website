import 'package:flutter/material.dart';

class ResumeProfile extends StatelessWidget {
  const ResumeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_image.png'),
            backgroundColor: Colors.grey[600],
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          '김현진',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          color: Colors.black,
          child: Text(
            '모바일 앱 개발자',
            style: TextStyle(
              fontFamily: 'SCDREAM',
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
