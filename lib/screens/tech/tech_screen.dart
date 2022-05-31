import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/models/tech_model.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/main/components/subtitle.dart';
import 'package:portfolio_website/screens/tech/components/header.dart';
import 'package:portfolio_website/screens/tech/components/techs.dart';

class TechScreen extends StatelessWidget {
  final List languages = [
    TechModel(
      asset: 'assets/icons/flutter.svg',
      title: 'Flutter',
    ),
    TechModel(
      asset: 'assets/icons/csharp.svg',
      title: 'C#',
    ),
    TechModel(
      asset: 'assets/icons/javascript.svg',
      title: 'Javascript',
    ),
  ];

  final List databases = [
    TechModel(
      asset: 'assets/icons/firebase.svg',
      title: 'Firebase',
    ),
    TechModel(
      asset: 'assets/icons/nodedotjs.svg',
      title: 'Node.js',
    ),
    TechModel(
      asset: 'assets/icons/express.svg',
      title: 'Express',
    ),
    TechModel(
      asset: 'assets/icons/mysql.svg',
      title: 'MySQL',
    ),
    TechModel(
      asset: 'assets/icons/mariadb.svg',
      title: 'MariaDB',
    ),
    TechModel(
      asset: 'assets/icons/microsoftsqlserver.svg',
      title: 'SQL Server',
    ),
    TechModel(
      asset: 'assets/icons/googlecloud.svg',
      title: 'Google Cloud',
    ),
    TechModel(
      asset: 'assets/icons/json.svg',
      title: 'REST API',
    ),
  ];

  final List tools = [
    TechModel(
      asset: 'assets/icons/visualstudiocode.svg',
      title: 'Visual Studio Code',
    ),
    TechModel(
      asset: 'assets/icons/visualstudio.svg',
      title: 'Visual Studio',
    ),
    TechModel(
      asset: 'assets/icons/androidstudio.svg',
      title: 'Android Studio',
    ),
    TechModel(
      asset: 'assets/icons/xcode.svg',
      title: 'Xcode',
    ),
  ];

  TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Subtitle(
            text: 'TECH STACK',
            delay: Duration(milliseconds: 500),
            size: Responsive.isDesktop(context) ? 60.0 : 46.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 750),
            duration: Duration(milliseconds: 500),
            offset: Offset(-20.0, 0.0),
            child: Text(
              'tech1'.tr(),
              style: TextStyle(
                fontFamily: 'SCDREAM',
                fontSize: Responsive.isDesktop(context) ? 20.0 : 14.0,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 60.0),
          Container(
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
          ),
        ],
      ),
    );
  }
}
