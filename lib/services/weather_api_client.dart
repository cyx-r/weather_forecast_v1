import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_forecast_v1/models/weather_model.dart';

class WeatherApiClient {

  static Future<WeatherModel>? getCurrentWeather(String? city) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=5715ef1423a2d2f685746cbc6f9d4eca");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(WeatherModel.fromJson(body).toString());
    return WeatherModel.fromJson(body);
  }

  // static Future<List<WeatherModel>> getfiveDayForecast(String? city) async{


  // }
}
