import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_forecast_v1/models/weather_model.dart';

class WeatherApiClient {
  Future<WeatherModel>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid={5715ef1423a2d2f685746cbc6f9d4eca}");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return WeatherModel.fromJson(body);
  }
}
