import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/weather.dart';

class AboutPage extends StatefulWidget {
  final String route = "/about";
  Weather? weather;
  bool isdarkTheme;
  AboutPage({required this.weather,required this.isdarkTheme, super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isdarkTheme ? Color.fromARGB(255, 83, 83, 83) : Color.fromARGB(255, 251, 253, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: widget.isdarkTheme ?  Color.fromARGB(255, 124, 124, 124) : Color.fromARGB(255, 201, 203, 206),
        title: Text(
          "About ${widget.weather!.date!.day}.${widget.weather!.date!.month}",
          style: TextStyle(color: widget.isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52)  ),
        ),
      ),

      body: Column(
        children: [
          ListTile(
            leading: Text(
              "cloudiness:",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60:Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: Text(
              "${widget.weather!.cloudiness}",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w200
              ),
            ),
            tileColor: widget.isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
          ), //clouds

          ListTile(
            leading: Text(
              "humidity:",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60:Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: Text(
              "${widget.weather!.humidity}",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w200
              ),
            ),
            tileColor: widget.isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
          ), //humidity

          ListTile(
            leading: Text(
              "wind speed:",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60:Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: Text(
              "${widget.weather!.windSpeed}",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w200
              ),
            ),
            tileColor: widget.isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
          ), // wind spped

          ListTile(
            leading: Text(
              "temperature:",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60:Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: Text(
              "${widget.weather!.temperature}",
              style: TextStyle(
                color: widget.isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w200
              ),
            ),
            tileColor: widget.isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
          ),
        ],
      ),
    );
  }
}