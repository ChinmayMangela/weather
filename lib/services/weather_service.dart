import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/features/weather_display/domain/weather.dart';

class WeatherService {
  final String apiKey;
  final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  WeatherService(this.apiKey);

  Future<Weather?> fetchWeather(String cityName) async {
    final url = '$baseUrl?q=$cityName&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final body = response.body;
        return Weather.fromJson(jsonDecode(body));
      } else {
        throw http.ClientException('Failed to load data with status code ${response.statusCode}');
      }
    } catch(e) {
      debugPrint('Error fetching weather $e');
      return null;
    }
  }
}