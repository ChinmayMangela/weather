import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureDisplay extends StatelessWidget {
  const TemperatureDisplay({super.key, required this.temperature,});

  final double temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
        '${(temperature - 273.15).round()}°C',
      style: GoogleFonts.lato(
        fontSize: 25,
        color: Colors.grey,
      ),
    );
  }
}
