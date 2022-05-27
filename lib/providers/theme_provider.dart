import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  fontFamily: 'Barlow Semi Condensed',
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Colors.black,
    secondary: Color(0xFF8D021F),
    onSecondary: Color(0xFFEE6484),
    tertiary: Colors.white,
  ),
  textTheme: TextTheme().apply(
    bodyColor: Colors.grey[850],
    displayColor: Colors.grey[850],
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF8D021F),
    textTheme: ButtonTextTheme.primary,
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.grey[850],
    selectedTileColor: Colors.grey[200],
  ),
  canvasColor: Colors.blueGrey[100],
  scaffoldBackgroundColor: Color(0xFFEEEEEE),
);

ThemeData dark = ThemeData(
  fontFamily: 'Barlow Semi Condensed',
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Colors.white,
    secondary: Color(0xFF8D021F),
    onSecondary: Color(0xFFEE6484),
    tertiary: Colors.black,
  ),
  textTheme: TextTheme().apply(
    bodyColor: Colors.white60,
    displayColor: Colors.white60,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF8D021F),
    textTheme: ButtonTextTheme.primary,
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.white60,
    selectedTileColor: Colors.grey[800],
  ),
  canvasColor: Colors.blueGrey[800],
  scaffoldBackgroundColor: Color.fromARGB(255, 14, 24, 39),
);

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = false;
    loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? false;
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, darkTheme);
  }
}
