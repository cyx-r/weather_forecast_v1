import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  bool isdarkTheme;
  Weather? weather;
  CurrentWeatherCard({ required this.isdarkTheme, required this.weather,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Around You Right Now",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color:  isdarkTheme ? Colors.white60 : Colors.black
            ),
          ),
          Text(
            "${weather?.weatherDescription}",
            style: TextStyle(
              color:  isdarkTheme ? Colors.white60: Colors.black ,
              fontWeight: FontWeight.w100,
              fontSize: 15
            ),
          ),
          
          const Divider(),

          Row(
            children: [
              const Image(
                image: AssetImage("assets/rain.png"),
              ),
              SizedBox(width: 30,),
              Column(
                children: [
                  Text(
                    "${weather!.temperature}*C",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color:  isdarkTheme ? Colors.white60: Colors.black
                    ),
                  ),
                  Text(
                    "feels like ${weather!.tempFeelsLike}",
                    style: TextStyle(
                      color:  isdarkTheme ? Colors.white60 : Colors.black ,
                      fontWeight: FontWeight.w100,
                      fontSize: 15
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}