import 'package:flutter/material.dart';
import 'package:weather/features/serarch_weather/presentation/widgets/custom_text_field.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key});

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(
        children: [
        ],
      ),
    );
  }
}
