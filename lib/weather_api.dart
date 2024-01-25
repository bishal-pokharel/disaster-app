// lib/weather_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeatherData(String city) async {
  final apiKey = '05d61071432ddab21ddc7dbb0d5a9e5b';
  final Lat = '25.2744';
  final long = '133.7751';
  final city = 'Australia';
  final apiUrl = Uri.parse(
      // 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'
      'https://api.openweathermap.org/data/2.5/weather?lat=${Lat}&lon=${long}&appid=${apiKey}');
  final response = await http.get(apiUrl);
  // final response = await http.get(
  //     'https://api.openweathermap.org/data/3.0/onecall?q=London&exclude=hourly&appid=05d61071432ddab21ddc7dbb0d5a9e5b');

  if (response.statusCode == 200) {
    return json.decode(response.body);
    print(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
