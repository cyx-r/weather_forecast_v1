import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/models/units.dart';
import 'package:weather_forecast_v1/services/weather_service.dart';
import 'package:weather_forecast_v1/ui/AboutPage.dart';

class FiveDayList extends StatelessWidget {
  FiveDayList({required this.isdarkTheme, required this.forecasts, required this.units, super.key});
  bool isdarkTheme;
  List<Weather>? forecasts;
  Units units;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "the next 15 hours",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color:  isdarkTheme ? Colors.white60 : Color.fromARGB(255, 53, 52, 52)
            ),
          ),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder:(context, index) => GestureDetector(
            child: Card(
              color: isdarkTheme? Color.fromARGB(255, 70, 70, 70) : Color.fromARGB(255, 201, 203, 206),
              elevation: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image(image: AssetImage(WeatherService().getImageFromDescription(forecasts![index].weatherDescription, forecasts![index].date),),),
                      Text("${DateTime.now().add(Duration(hours: 3*index)).hour}:${DateTime.now().add(Duration(hours: 3*index)).minute}")
                    ],
                  ),
                  Text("${forecasts![index].weatherDescription}")
                ],
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => AboutPage(weather:forecasts![index] , isdarkTheme: isdarkTheme, units: units),),);
            },
          )
        )
      ],
    );
  }
}