import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  fontFamily: 'Barlow Semi Condensed',
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Colors.black,
    secondary: Colors.blueGrey,
    tertiary: Colors.white,
  ),
  textTheme: TextTheme().apply(
    bodyColor: Colors.grey[850],
    displayColor: Colors.grey[850],
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.indigo,
    textTheme: ButtonTextTheme.primary,
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.grey[850],
    selectedTileColor: Colors.grey[200],
  ),
  canvasColor: Colors.blueGrey[100],
  scaffoldBackgroundColor: Colors.blueGrey[50],
);

ThemeData dark = ThemeData(
    fontFamily: 'Barlow Semi Condensed',
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: Colors.white,
    ).copyWith(
      primary: Colors.white,
      secondary: Colors.blueGrey,
      tertiary: Colors.black,
    ),
    textTheme: TextTheme().apply(
      bodyColor: Colors.white60,
      displayColor: Colors.white60,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
      textTheme: ButtonTextTheme.primary,
    ),
    listTileTheme: ListTileThemeData(
      textColor: Colors.white60,
      selectedTileColor: Colors.grey[800],
    ),
    canvasColor: Colors.blueGrey[800],
    scaffoldBackgroundColor: Colors.blueGrey[900]);

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = true;
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
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, darkTheme);
  }
}
