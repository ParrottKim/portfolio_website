import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/models/tech_model.dart';

class ResumeTech extends StatelessWidget {
  final List languages = [
    TechModel(
      asset: 'assets/icons/techs/flutter.svg',
      title: 'Flutter',
    ),
    TechModel(
      asset: 'assets/icons/techs/csharp.svg',
      title: 'C#',
    ),
    TechModel(
      asset: 'assets/icons/techs/javascript.svg',
      title: 'Javascript',
    ),
  ];

  final List databases = [
    TechModel(
      asset: 'assets/icons/techs/firebase.svg',
      title: 'Firebase',
    ),
    TechModel(
      asset: 'assets/icons/techs/nodedotjs.svg',
      title: 'Node.js',
    ),
    TechModel(
      asset: 'assets/icons/techs/express.svg',
      title: 'Express',
    ),
    TechModel(
      asset: 'assets/icons/techs/mysql.svg',
      title: 'MySQL',
    ),
    TechModel(
      asset: 'assets/icons/techs/mariadb.svg',
      title: 'MariaDB',
    ),
    TechModel(
      asset: 'assets/icons/techs/microsoftsqlserver.svg',
      title: 'SQL Server',
    ),
    TechModel(
      asset: 'assets/icons/techs/googlecloud.svg',
      title: 'Google Cloud',
    ),
    TechModel(
      asset: 'assets/icons/techs/json.svg',
      title: 'REST API',
    ),
  ];

  final List tools = [
    TechModel(
      asset: 'assets/icons/techs/visualstudiocode.svg',
      title: 'Visual Studio Code',
    ),
    TechModel(
      asset: 'assets/icons/techs/visualstudio.svg',
      title: 'Visual Studio',
    ),
    TechModel(
      asset: 'assets/icons/techs/androidstudio.svg',
      title: 'Android Studio',
    ),
    TechModel(
      asset: 'assets/icons/techs/xcode.svg',
      title: 'Xcode',
    ),
  ];
  ResumeTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TECH STACK',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          'LANGUAGES',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          itemCount: languages.length,
          itemBuilder: (context, index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: 26.0,
                height: 16.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: SvgPicture.asset(
                  languages[index].asset!,
                  width: 12.0,
                  height: 12.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6.0),
              Text(
                languages[index].title,
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 8.0),
        ),
        SizedBox(height: 12.0),
        Text(
          'DATABASE / PLATFORM',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          itemCount: databases.length,
          itemBuilder: (context, index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: 26.0,
                height: 16.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: SvgPicture.asset(
                  databases[index].asset!,
                  width: 12.0,
                  height: 12.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6.0),
              Text(
                databases[index].title,
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 8.0),
        ),
        SizedBox(height: 24.0),
        Text(
          'TOOLS',
          style: GoogleFonts.questrial(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          itemCount: tools.length,
          itemBuilder: (context, index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: 26.0,
                height: 16.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: SvgPicture.asset(
                  tools[index].asset!,
                  width: 12.0,
                  height: 12.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6.0),
              Text(
                tools[index].title,
                style: TextStyle(
                  fontFamily: 'SCDREAM',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 8.0),
        ),
      ],
    );
  }
}
