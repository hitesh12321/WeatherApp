// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/modals.dart';

class DataServices {
  final String _apiKey = "7ae3231e75e1d0ba073af9734fa6eb5b";
  final String _path = "data/2.5/weather";
  final String _baseUrl = "api.openweathermap.org";
  

  // just below in Future i will return Weatherresponse class
  Future<WeatherResponse?> getWeather(String? location) async {
    final query = {'q': location, 'appid': _apiKey, 'units': 'metric'};

    final uri = Uri.https(_baseUrl, _path, query);

    final response = await http.get(uri);

    // final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final Json = json.decode(response.body);
      return WeatherResponse.fromJson(Json);
    } else {
      throw Exception("Failed to load weather data");
    }
    
  }
}

//  "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7ae3231e75e1d0ba073af9734fa6eb5b&units=metric"
