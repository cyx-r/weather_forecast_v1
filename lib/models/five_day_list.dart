import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';
import 'package:weather_forecast_v1/services/weather_service.dart';
import 'package:weather_forecast_v1/ui/AboutPage.dart';

class FiveDayList extends StatelessWidget {
  FiveDayList({required this.isdarkTheme, required this.forecasts,super.key});
  bool isdarkTheme;
  List<Weather>? forecasts;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: forecasts!.length,
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
                  Image(image: AssetImage(WeatherService().getImageFromDescription(forecasts![index].weatherDescription, DateTime.now()),),),
                  Text("${forecasts![index].date!.day}.${forecasts![index].date!.month}.${forecasts![index].date!.year}")
                ],
              ),
              Text("${forecasts![index].weatherDescription}")
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context) => AboutPage(weather:forecasts![index] , isdarkTheme: isdarkTheme),),);
        },
      )
    );
  }
}