import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/services/weather_service.dart';

class CurrentWeatherCard extends StatelessWidget {
  bool isdarkTheme;
  Weather? weather;
  CurrentWeatherCard({ required this.isdarkTheme, required this.weather,super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Text(
            "Around You Right Now",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color:  isdarkTheme ? Colors.white60 : Colors.white70
            ),
          ),

          const Divider( color:  Colors.white60,),

          Card(
            color: isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 154, 209, 253),
            elevation: 12,
            child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${weather?.weatherDescription}",
                    style: TextStyle(
                      color:  isdarkTheme ? Colors.white60: Colors.white70 ,
                      fontWeight: FontWeight.w100,
                      fontSize: 15
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    width: 85,
                    child: Image(image: AssetImage(WeatherService().getImageFromDescription(weather!.weatherDescription, DateTime.now()),)),
                  ),
                ],
              ),
              // SizedBox(width: 25,),
              Column(
                children: [
                  Text(
                    "${weather!.temperature}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color:  isdarkTheme ? Colors.white60: Colors.white70
                    ),
                  ),
                  Text(
                    "feels like ${weather!.tempFeelsLike}",
                    style: TextStyle(
                      color:  isdarkTheme ? Colors.white60 : Colors.white70 ,
                      fontWeight: FontWeight.w100,
                      fontSize: 15
                    ),
                  ),
                ],
              )
            ],
          ),
          )
        ],
      );
    
  }
}