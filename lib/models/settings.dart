import 'package:flutter/material.dart';

class Settings{
  late ThemeData theme;
  late String units;
  Settings({required this.theme, required this.units});
  Settings.basic(){
    theme = ThemeData.light();
    units = "metric";
  }
}