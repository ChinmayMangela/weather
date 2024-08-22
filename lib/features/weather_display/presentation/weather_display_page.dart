import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/features/weather_display/domain/weather.dart';
import 'package:weather/features/weather_display/presentation/widgets/location_component.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/helper_functions.dart';

class WeatherDisplayPage extends StatefulWidget {
  const WeatherDisplayPage({super.key});

  @override
  State<WeatherDisplayPage> createState() => _WeatherDisplayPageState();
}

class _WeatherDisplayPageState extends State<WeatherDisplayPage> {
  final _weatherService = WeatherService('3d4a65e3f2ac7c5db9d89b965108697d');
  Weather? _weather;
  bool isLoading = true;

  _fetchWeather() async {
    final cityName = await LocationService().fetchCity();
    final weatherData = await _weatherService.fetchWeather(cityName);
    setState(() {
      _weather = weatherData;
      isLoading = false;
    });
  }


  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody();
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LocationComponent(cityName: _weather?.city ?? 'Loading city...'),
          Lottie.asset(
            HelperFunctions.getWeatherAnimatedIcons(_weather!.mainCondition),
          ),
          Text(
            '${(_weather!.temperature - 273.15).round()}°C',
            style: GoogleFonts.oswald(
              color: Colors.grey,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
