import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/models/units.dart';
import 'package:weather_forecast_v1/services/weather_service.dart';

class CurrentWeatherCard extends StatelessWidget {
  bool isdarkTheme;
  Weather? weather;
  Units units;
  CurrentWeatherCard({ required this.isdarkTheme, required this.weather, required this.units,super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Text(
            "Around You Right Now",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color:  isdarkTheme ? Colors.white60 : Color.fromARGB(255, 53, 52, 52)
            ),
          ),

          const Divider( color:  Colors.white60,),

          Card(
            color: isdarkTheme ? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
            elevation: 12,
            child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${weather?.weatherDescription}",
                    style: TextStyle(
                      color:  isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52) ,
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
                    units == Units.metric ? "${weather!.temperature}" : "${weather!.temperature!.kelvin}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color:  isdarkTheme ? Colors.white60: Color.fromARGB(255, 53, 52, 52)
                    ),
                  ),
                  Text(
                    units == Units.metric ? "feels like ${weather!.tempFeelsLike}" : "feels like ${weather!.tempFeelsLike!.fahrenheit}",
                    style: TextStyle(
                      color:  isdarkTheme ? Colors.white60 : Color.fromARGB(255, 53, 52, 52) ,
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