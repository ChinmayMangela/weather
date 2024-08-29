
import 'package:weather/utils/helper_functions.dart';

class Forecast {
  final City city;
  final List<HourlyForecast> hourlyForecast;

  Forecast({
    required this.city,
    required this.hourlyForecast,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      city: City.fromJson(json['city']),
      hourlyForecast: (json['list'] as List)
          .map((item) => HourlyForecast.fromJson(item))
          .toList(),
    );
  }
}

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
    return HourlyForecast(
      time: HelperFunctions.getFormattedTime(json['dt']),
      mainData: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      wind: Wind.fromJson(json['wind']),
      pop: json['pop']?.toDouble() ?? 0.0,
    );
  }
}

class Main {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double pressure;

  const Main({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temperature: json['temp'].toDouble() - 273.15,
      minTemperature: json['temp_min'].toDouble() - 273.15,
      maxTemperature: json['temp_max'].toDouble() - 273.15,
      humidity: json['humidity'].toDouble(),
      pressure: json['pressure'].toDouble(),
    );
  }
}

class Weather {
  final String mainCondition;
  final String description;

  const Weather({
    required this.mainCondition,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      mainCondition: json['main'],
      description: json['description'],
    );
  }
}

class Wind {
  final double windSpeed;

  const Wind({
    required this.windSpeed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      windSpeed: json['speed'].toDouble(),
    );
  }
}

class City {
  final String name;
  final String country;

  const City({
    required this.name,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      country: json['country'],
    );
  }
}
