import 'package:flutter/material.dart';
import 'package:weather/features/current_location_weather_display/domain/models/forecast.dart';
import 'package:weather/features/current_location_weather_display/presentation/widgets/weather_display.dart';
import 'package:weather/features/search_weather/presentation/widgets/custom_text_field.dart';
import 'package:weather/services/weather_service.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final _controller = TextEditingController();
  final _weatherService = WeatherService('3d4a65e3f2ac7c5db9d89b965108697d');

  Future<Forecast?> fetchForecast(String? cityName) async {
    if (cityName == null) {
      return null;
    }
    final forecastData = await _weatherService.fetchWeather(cityName);
    return forecastData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _controller,
              onSearch: () async {
                await fetchForecast(_controller.text);
                setState(() {});
              },
              onSubmitted: (value) {
                setState(() {});
              },
            ),
            FutureBuilder(
                future: fetchForecast(_controller.text),
                builder: (context, snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapShot.hasData) {
                        return WeatherDisplay(forecast: snapShot.data);
                      } else if (snapShot.hasError) {
                        return Center(
                          child: Text(snapShot.error.toString()),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'No data available',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        );
                      }
                  }
                })
          ],
        ),
      ),
    );
  }
}
