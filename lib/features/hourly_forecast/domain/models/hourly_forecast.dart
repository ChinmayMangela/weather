

import 'package:weather/features/current_location_weather_display/domain/models/main_data.dart';
import 'package:weather/features/current_location_weather_display/domain/models/weather.dart';
import 'package:weather/features/current_location_weather_display/domain/models/wind.dart';

class HourlyForecast {
  final DateTime time;
  final Main mainData;
  final List<Weather> weather;
  final Wind wind;
  final double pop;

  HourlyForecast({
    required this.time,
    required this.mainData,
    required this.weather,
    required this.wind,
    required this.pop,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    final utcTime = DateTime.parse(json['dt_txt']);
    final localTime = utcTime.toLocal();
    return HourlyForecast(
      time: localTime,
      mainData: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      wind: Wind.fromJson(json['wind']),
      pop: json['pop']?.toDouble() ?? 0.0,
    );
  }

}