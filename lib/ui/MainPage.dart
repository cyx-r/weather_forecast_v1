import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/models/current_weather_card.dart';
import 'package:weather_forecast_v1/services/weather_api_client.dart';
import 'package:location/location.dart';

class MainPage extends StatefulWidget {
  final String route = "/";
  MainPage({super.key});

  late WeatherFactory wf = WeatherFactory(APIkey);
  static const String APIkey = "5715ef1423a2d2f685746cbc6f9d4eca";
  List<Weather> _data = [] ;

  final Location userLocation = Location();
  

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isdarkTheme = true;
  late LocationData currentLocation = Future.value();
  Future<Weather> getCurrentWeather(double? lat, double? long) async{
    try{
      var weather = await widget.wf.currentWeatherByLocation(lat!, long!);
      return weather;
    }
    catch(NullPointerException){
      print("Location is null");
    }
    throw "ooooooooooo";
  }


  void getfiveDayForecast() async{
    List<Weather> forecast = await widget.wf.fiveDayForecastByCityName("Omsk");
    setState(() {
      widget._data = forecast;
    });  
  }

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
        backgroundColor: isdarkTheme ? Color.fromARGB(255, 83, 83, 83) : Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: isdarkTheme ? Colors.black : Color.fromARGB(255, 128, 193, 247),
          title: Text("Weather Forecast"),
          actions: [
            IconButton(
              icon: const Icon(Icons.lightbulb),
              onPressed: (){
                setState(() {
                  isdarkTheme = !isdarkTheme;
                });
              },
            ),
          ] 
        ),
        body: FutureBuilder(
          future: getCurrentWeather(currentLocation.latitude,currentLocation.longitude),
          builder:(context, snapshot) {
            switch(snapshot.connectionState){
              
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator(),);

              case ConnectionState.done:
                return CurrentWeatherCard(isdarkTheme: isdarkTheme, weather: snapshot.data);
            }
          }, 
        ),
      );
  }
}