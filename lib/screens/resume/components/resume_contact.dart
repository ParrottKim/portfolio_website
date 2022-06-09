import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResumeContact extends StatelessWidget {
  const ResumeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              MdiIcons.mapMarker,
              size: 14.0,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(width: 6.0),
            Text(
              'Seoul, South Korea',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Icon(
              MdiIcons.github,
              size: 14.0,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(width: 6.0),
            Text(
              'parrottkim',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Icon(
              MdiIcons.instagram,
              size: 14.0,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(width: 6.0),
            Text(
              'parrottkim_',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Row(
          children: [
            Icon(
              MdiIcons.gmail,
              size: 14.0,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(width: 6.0),
            Text(
              'parrottkim21',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        )
      ],
    );
  }
}
