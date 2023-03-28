import 'package:flutter/material.dart';
import 'package:weather_forecast_v1/ui/MainPage.dart';
import 'package:weather_forecast_v1/models/settings.dart';

import 'SettingsPage.dart';

class MyApp extends StatelessWidget {
  Settings _settings = Settings.basic();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => MainPage(),
        "/settings": (context) => SettingsPage(settings: _settings)
      },
    );
  }
}
