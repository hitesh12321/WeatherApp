/*                        
{
   "coord": {
      "lon": 7.367,
      "lat": 45.133
   },
   "weather": [
      {
         "description": "moderate rain",
         "icon": "10d"
      }
   ],
  
   "main": {
      "temp": 284.2,  
      "humidity": 60,  
   },
  
   "name": "Province of Turin",
   
}                    
 */
// ignore: unused_import
import 'dart:convert';

class TemperatureInfo {
  final String? temperature;

  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp']?.toString();

    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo {
  final String? description;
  final String? icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

class WeatherResponse {
  final String? cityName;
  final TemperatureInfo? tempinfo;
  final WeatherInfo? weatherDescription;
  

  WeatherResponse({
    this.cityName,
    this.tempinfo,
    this.weatherDescription,
    
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    
    final cityName =
        json['name']; //here i am storing value in json['name] means value in json as name => to the cityName
    final tempJsoninfo = json['main'];
    final tempinfo = TemperatureInfo.fromJson(tempJsoninfo);

    final weatinfo = json['weather'][0];

    final weatherDescription = WeatherInfo.fromJson(weatinfo);

    return WeatherResponse(
      cityName: cityName,
      tempinfo: tempinfo,
      weatherDescription: weatherDescription,
    );
  }
}
