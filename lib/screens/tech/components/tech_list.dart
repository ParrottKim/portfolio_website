import 'package:flutter/material.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/tech/components/header.dart';
import 'package:portfolio_website/screens/tech/components/techs.dart';

class TechList extends StatelessWidget {
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

  TechList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: !Responsive.isMobile(context)
          ? EdgeInsets.symmetric(horizontal: size.width * 0.07)
          : EdgeInsets.zero,
      child: Responsive.isDesktop(context)
          ? Column(
              children: [
                Row(
                  children: [
                    Header(
                      text: 'Language',
                      delay: Duration(milliseconds: 1500),
                    ),
                    Expanded(
                      child: Techs(
                        delay: const Duration(milliseconds: 1750),
                        techs: languages,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Header(
                      text: 'Database / Services',
                      delay: Duration(milliseconds: 3500),
                    ),
                    Expanded(
                      child: Techs(
                        delay: const Duration(milliseconds: 3750),
                        techs: databases,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Header(
                      text: 'Tools',
                      delay: Duration(milliseconds: 5500),
                    ),
                    Expanded(
                      child: Techs(
                        delay: const Duration(milliseconds: 5750),
                        techs: tools,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  text: 'Language',
                  delay: Duration(milliseconds: 1500),
                ),
                SizedBox(height: 8.0),
                Techs(
                  delay: const Duration(milliseconds: 1750),
                  techs: languages,
                ),
                SizedBox(height: 20.0),
                Header(
                  text: 'Database / Platform',
                  delay: Duration(milliseconds: 3500),
                ),
                SizedBox(height: 8.0),
                Techs(
                  delay: const Duration(milliseconds: 3750),
                  techs: databases,
                ),
                SizedBox(height: 20.0),
                Header(
                  text: 'Tools',
                  delay: Duration(milliseconds: 5500),
                ),
                SizedBox(height: 8.0),
                Techs(
                  delay: const Duration(milliseconds: 5750),
                  techs: tools,
                ),
              ],
            ),
    );
  }
}
