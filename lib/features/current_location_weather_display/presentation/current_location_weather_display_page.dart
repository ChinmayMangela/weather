import 'package:flutter/material.dart';
import 'package:weather/features/current_location_weather_display/domain/forecast.dart';
import 'package:weather/features/current_location_weather_display/presentation/widgets/custom_progress_indicator.dart';
import 'package:weather/features/current_location_weather_display/presentation/widgets/weather_display.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';

class CurrentLocationWeatherDisplay extends StatefulWidget {
  const CurrentLocationWeatherDisplay({super.key});

  @override
  State<CurrentLocationWeatherDisplay> createState() => _CurrentLocationWeatherDisplayState();
}

class _CurrentLocationWeatherDisplayState extends State<CurrentLocationWeatherDisplay> {
  final _weatherService = WeatherService('3d4a65e3f2ac7c5db9d89b965108697d');

  Future<Forecast?> _fetchWeather() async {
    final cityName = await LocationService().fetchCity();
    final weatherData = await _weatherService.fetchWeather(cityName);
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Forecast?>(future: _fetchWeather(), builder: (context, snapshot) {
      switch(snapshot.connectionState) {
        case ConnectionState.waiting:
          return const CustomProgressIndicator();
        default:
          if(snapshot.hasData) {
            return WeatherDisplay(forecast: snapshot.data);
          } else {
            return const Text('Error fetching data');
          }
      }
    });
  }
}
