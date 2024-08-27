import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/features/current_location_weather_display/domain/forecast.dart';
import 'package:weather/features/search_weather/presentation/widgets/custom_text_field.dart';
import 'package:weather/features/search_weather/presentation/widgets/temperature_display.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/helper_functions.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final _controller = TextEditingController();
  final _weatherService = WeatherService('3d4a65e3f2ac7c5db9d89b965108697d');
  Weather? _weather;
  bool isLoading = false;

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

              },
              onSubmitted: (value) {

              },
            ),
            if (isLoading) ...[
              const CircularProgressIndicator(),
            ] else if (_weather != null) ...[
              const SizedBox(height: 20),
              TemperatureDisplay(temperature: 0),
              const SizedBox(height: 10),
              Lottie.asset(
                HelperFunctions.getWeatherAnimatedIcons(_weather!.mainCondition),
              ),
              const SizedBox(height: 20),
              Text('', style: GoogleFonts.lato(
                color: Colors.grey,
              ),)
            ]
          ],
        ),
      ),
    );
  }
}
