import 'package:flutter/material.dart';
import 'package:weather_forecast_v1/models/settings.dart';

class SettingsPage extends StatefulWidget {
  Settings? settings = Settings.basic();
  SettingsPage({this.settings, super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings")
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: widget.settings!.theme == ThemeData.light() ? Text("Light theme") : Text("Dark theme"),
              onPressed: (){
                setState(() {
                  if(widget.settings!.theme == ThemeData.light()){
                    widget.settings!.theme = ThemeData.dark();
                  } else{
                    widget.settings!.theme = ThemeData.light();
                  }
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}