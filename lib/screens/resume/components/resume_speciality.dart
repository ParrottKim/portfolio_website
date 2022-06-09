import 'package:flutter/material.dart';

class ResumeSpeciality extends StatelessWidget {
  const ResumeSpeciality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HOBBY & SPECIALITY',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 12.0),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 18.0,
          ),
          children: [
            Text(
              'Driving',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              'Photoshop',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              'Microsoft Office',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              'Video Editing',
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
