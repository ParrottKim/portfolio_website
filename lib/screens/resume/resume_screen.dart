import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/resume/components/resume_about.dart';
import 'package:portfolio_website/screens/resume/components/resume_achievement.dart';
import 'package:portfolio_website/screens/resume/components/resume_contact.dart';
import 'package:portfolio_website/screens/resume/components/resume_education.dart';
import 'package:portfolio_website/screens/resume/components/resume_experience.dart';
import 'package:portfolio_website/screens/resume/components/resume_speciality.dart';
import 'package:portfolio_website/screens/resume/components/resume_profile.dart';
import 'package:portfolio_website/screens/resume/components/resume_tech.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResumeProfile(),
                        SizedBox(height: 20.0),
                        ResumeContact(),
                        SizedBox(height: 60.0),
                        ResumeTech(),
                        SizedBox(height: 60.0),
                        ResumeSpeciality(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResumeAbout(),
                        SizedBox(height: 60.0),
                        ResumeEducation(),
                        SizedBox(height: 60.0),
                        ResumeExperience(),
                        SizedBox(height: 60.0),
                        ResumeAchievement(),
                        SizedBox(height: 30.0),
                        Image.asset(
                          'assets/images/qrcode.png',
                          width: 120.0,
                          height: 120.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 40.0,
            color: Theme.of(context).canvasColor,
            child: Text(
              'This page is all created using Flutter framework.',
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
