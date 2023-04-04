import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/models/current_weather_card.dart';
import 'package:location/location.dart';
import 'package:weather_forecast_v1/models/five_day_list.dart';

import '../models/units.dart';
import '../services/weather_service.dart';

class MainPage extends StatefulWidget {
  final String route = "/";
  MainPage({super.key});

  late WeatherFactory wf = WeatherFactory(APIkey);
  static const String APIkey = "5715ef1423a2d2f685746cbc6f9d4eca";

  final Location userLocation = Location();
  
  Units units = Units.metric;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isdarkTheme = true;

  LocationData? currentLocation;

  
  
  Future<LocationData> checkLocationPermission() async{
    var serviceEnabled = await widget.userLocation.serviceEnabled();
    if(!serviceEnabled){
      serviceEnabled = await widget.userLocation.requestService();
    }
    var permissionGranted = await widget.userLocation.hasPermission();
    if(permissionGranted != PermissionStatus.granted) {
      permissionGranted = await widget.userLocation.requestPermission();
    }
    if(permissionGranted == PermissionStatus.granted || permissionGranted == PermissionStatus.grantedLimited ){
      return widget.userLocation.getLocation();
    }
    return widget.userLocation.getLocation();
  }

  @override
  Widget build(BuildContext context) {

    checkLocationPermission();
    return Scaffold(
        backgroundColor: isdarkTheme ? Color.fromARGB(255, 83, 83, 83) : Color.fromARGB(255, 251, 253, 255),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: isdarkTheme ?  Color.fromARGB(255, 124, 124, 124) : Color.fromARGB(255, 201, 203, 206),
          title: Text(
            "Weather Forecast",
            style: TextStyle(color: isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52)  ),
          ),
          actions: [
            IconButton(
              color: isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52) ,
              icon: const Icon(Icons.lightbulb),
              onPressed: (){
                setState(() {
                  isdarkTheme = !isdarkTheme;
                });
              },
            ),
            TextButton(
              
              onPressed:(){
                setState(() {
                  switch(widget.units){
                    
                    case Units.metric:
                      widget.units = Units.imperial;
                      break;
                    case Units.imperial:
                      widget.units = Units.metric;
                      break;
                  }
                });
              },
              child: Text(
                widget.units == Units.metric ?"°C" :"°F",
                style: TextStyle(
                  color: isdarkTheme ? Colors.white60 : Color.fromARGB(255, 53, 52, 52)
                ),
              ) 
            )
          ] 
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder(
              future: WeatherService().getCurrentWeather(widget.wf, currentLocation?.latitude, currentLocation?.longitude),
              builder:(context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator(),);
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator(),);
                  case ConnectionState.active:
                    return Center(child: CircularProgressIndicator(),);

                  case ConnectionState.done:
                    return CurrentWeatherCard(isdarkTheme: isdarkTheme, weather: snapshot.data, units: widget.units );
                }
              }, 
            ),
            FutureBuilder(
              future: WeatherService().getfiveDayForecast(widget.wf, currentLocation?.latitude, currentLocation?.longitude),
              builder:(context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator(),);
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator(),);
                  case ConnectionState.active:
                    return Center(child: CircularProgressIndicator(),);

                  case ConnectionState.done:
                    return FiveDayList(isdarkTheme: isdarkTheme, forecasts: snapshot.data, units: widget.units);
                }
              },
            )
          ],
        ),
      );
  }
}