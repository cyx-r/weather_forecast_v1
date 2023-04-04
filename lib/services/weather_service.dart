import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';

class WeatherService{
  String getImageFromDescription(String? description, DateTime dateTime){
    switch(description){
      case "clear sky": return (dateTime.hour  >= 17) ==  true ? "assets/clear_night.png" :"assets/clear_day.png";

      case "few clouds": return (dateTime.hour  >= 17) ==  true ? "assets/few_clouds_night.png" :"assets/few_clouds_day.png";

      case "scattered clouds": return (dateTime.hour  >= 17) ==  true ? "assets/clouds_night.png" :"assets/clouds_day.png";

      case "broken clouds": return (dateTime.hour  >= 17) ==  true ? "assets/clouds_night.png" :"assets/clouds_day.png";

      case "shower rain": return (dateTime.hour  >= 17) ==  true ? "assets/sh_rain_night.png" :"assets/sh_rain_day.png";

      case "rain": return "assets/rain.png";

      case "thunderstorm": return "assets/thunderstorm.png";

      case "storm": return "assets/storm.png";

      case "mist": return "assets/mist.png";
      default: return (dateTime.hour  >= 17) ==  true ? "assets/clear_night.png" :"assets/clear_day.png";
    }
  }

  Future<Weather> getCurrentWeather(WeatherFactory wf, double? lat, double? long) async{
    if(lat!=null && long != null){
      var weather = await wf.currentWeatherByLocation(lat, long,);
      return weather;
    } else{
      return await wf.currentWeatherByCityName("Omsk");
    }
  }

  Future<List<Weather>> getfiveDayForecast(WeatherFactory wf,  double? lat, double? long) async{
    if(lat!=null && long != null){
      List<Weather> forecast = await wf.fiveDayForecastByLocation(lat, long);
      return forecast;
    } else{
      return await wf.fiveDayForecastByCityName("Omsk");
    }
  }

}