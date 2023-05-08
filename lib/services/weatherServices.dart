import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:section9/models/weatherModel.dart';

class weatherServices {
  Future<weatherModel?> getWeather({required String cityName}) async {
    weatherModel? model;
    try{
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'f79021cda50a4932b50114701230705';

      Uri url =
      Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      // var jsonDate = data["location"]["localtime"];
      // var jsonData = data["forecast"]["forecastday"][0];
      // weatherModel model = weatherModel(
      //     date: jsonDate,
      //     temp: jsonData["avgtemp_c"],
      //     maxTemp: jsonData["maxtemp_c"],
      //     minTemp: jsonData["mintemp_c"],
      //     weatherStateName:jsonData['condition']['text'],
      // );
    model=weatherModel.fromJson(data);
    }catch(e)
    {
      print(e);
    }
    return model;
  }
}
