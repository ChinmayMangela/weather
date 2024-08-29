import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/features/current_location_weather_display/domain/forecast.dart';
import 'package:weather/features/current_location_weather_display/presentation/widgets/hourly_forecast_list.dart';
import 'package:weather/features/current_location_weather_display/presentation/widgets/location_component.dart';
import 'package:weather/utils/helper_functions.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    super.key,
    required this.forecast,
  });

  final Forecast? forecast;

  @override
  Widget build(BuildContext context) {
    return forecast == null
        ? const Center(child: Text('No weather data available'))
        : _buildUI();
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LocationComponent(cityName: forecast!.city.name),
            Lottie.asset(
              HelperFunctions.getWeatherAnimatedIcons(
                forecast!.hourlyForecast.map((hourly) {
                  return hourly.weather.map((weather) {
                    return weather.mainCondition;
                  }).toList();
                }).toString(),
              ),
            ),
            Text(
              '${forecast!.hourlyForecast[0].mainData.temperature.round()}°C',
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            HourlyForecastList(forecast: forecast!),
          ],
        ),
      ),
    );
  }
}
