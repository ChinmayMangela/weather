import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/features/serarch_weather/presentation/widgets/custom_text_field.dart';
import 'package:weather/features/serarch_weather/presentation/widgets/temperature_display.dart';
import 'package:weather/features/weather_display/domain/weather.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/helper_functions.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key});

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  final _controller = TextEditingController();
  final _weatherService = WeatherService('3d4a65e3f2ac7c5db9d89b965108697d');
  Weather? _weather;
  bool isLoading = false;

  Future<void> _searchWeather(String cityName) async {
    setState(() {
      isLoading = true;
    });

    final weatherData = await _weatherService.fetchWeather(cityName);
    setState(() {
      _weather = weatherData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              onSearch: () {
                _searchWeather(_controller.text);
              },
              onSubmitted: (value) {
                _searchWeather(value);
              },
            ),
            if (isLoading) ...[
              const CircularProgressIndicator(),
            ] else if (_weather != null) ...[
              const SizedBox(height: 20),
              TemperatureDisplay(temperature: _weather!.temperature),
              const SizedBox(height: 10),
              Lottie.asset(
                HelperFunctions.getWeatherAnimatedIcons(_weather!.mainCondition),
              ),
              const SizedBox(height: 20),
              Text(_weather!.city, style: GoogleFonts.lato(
                color: Colors.grey,
              ),)
            ]
          ],
        ),
      ),
    );
  }
}
