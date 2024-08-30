import 'package:flutter/material.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/features/current_location_weather_display/domain/models/forecast.dart';
import 'package:weather/features/hourly_forecast/presentation/widgets/hourly_forecast_card.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key, required this.forecast});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
      ),
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final currentHourForecast = forecast.hourlyForecast[index];
          return HourlyForecastCard(
            time: currentHourForecast.time,
            mainCondition: currentHourForecast.weather[0].mainCondition,
            temperature: currentHourForecast.mainData.temperature.round(),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
