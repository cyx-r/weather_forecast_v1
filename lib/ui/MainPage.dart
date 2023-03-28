import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';


class MainPage extends StatefulWidget {
  final String route = "/";
  MainPage({super.key});

  

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WeatherFactory wf = WeatherFactory(APIkey);
  static const String APIkey = "5715ef1423a2d2f685746cbc6f9d4eca";
  List<Weather> _data = [] ;

  @override 
  void initState(){
    super.initState();
    wf = WeatherFactory(APIkey);
  }

  Future<Weather> getcurrentWeather() async{
    var weather = await wf.currentWeatherByCityName("Omsk");
    return weather;
  }

  void getfiveDayForecast() async{
    List<Weather> forecast = await wf.fiveDayForecastByCityName("Omsk");
    setState(() {
      _data = forecast;
    });  
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast"),
        actions: [
          IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){
            Navigator.of(context).pushNamed("/settings");
          },
        ),
        ]
      ),
      body: FutureBuilder(
        future: getcurrentWeather(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return Center(
                child:  Text(snapshot.data!.tempFeelsLike.toString()),
              );
          }
        }
      ),
    );
  }
}