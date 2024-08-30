
import 'package:weather/features/current_location_weather_display/domain/models/city.dart';
import 'package:weather/features/hourly_forecast/domain/models/hourly_forecast.dart';

class Forecast {
  final City city;
  final List<HourlyForecast> hourlyForecast;

  Forecast({
    required this.city,
    required this.hourlyForecast,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();
    // Filter hourly forecasts to include only those occurring after the current time.
    final hourlyForecasts = (json['list'] as List)
        .map((item) => HourlyForecast.fromJson(item))
        .toList().where((forecast) => forecast.time.isAfter(now)).toList();

    return Forecast(
      city: City.fromJson(json['city']),
      hourlyForecast: hourlyForecasts
    );
  }
}

