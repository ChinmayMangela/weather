import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/features/current_location_weather_display/domain/models/air_condition.dart';
import 'package:weather/features/current_location_weather_display/domain/models/forecast.dart';

class AirConditionData {
  final Forecast forecast;
  late List<AirCondition> data;

  AirConditionData(this.forecast) {
    data = [
      AirCondition(
        icon: Icons.thermostat,
        label: 'Temperature',
        value: '${forecast.hourlyForecast[0].mainData.temperature.round()}°C',
      ),
      AirCondition(
        icon: Icons.air,
        label: 'Wind',
        value: '${forecast.hourlyForecast[0].wind.windSpeed.toString()} km/h'
      ),
      AirCondition(
        icon: Icons.opacity,
        label: 'Humidity',
        value: '${forecast.hourlyForecast[0].mainData.humidity.toString()}%',
      ),
      AirCondition(
        icon: FontAwesomeIcons.gauge,
        label: 'Pressure',
        value: forecast.hourlyForecast[0].mainData.pressure.toString(),
      ),
    ];
  }
}
