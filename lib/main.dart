import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/screen_provider.dart';
import 'package:portfolio_website/providers/theme_provider.dart';
import 'package:portfolio_website/screens/main/main_screen.dart';
import 'package:portfolio_website/services/scroll_behavior.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: provider.darkTheme ? dark : light,
            scrollBehavior: CustomScrollBehavior(),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
