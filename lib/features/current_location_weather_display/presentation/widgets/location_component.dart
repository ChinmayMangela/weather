import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationComponent extends StatelessWidget {
  const LocationComponent({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cityName, style: GoogleFonts.oswald(
          color: Colors.white,
          fontSize: 30,
        ),),
      ],
    );
  }
}
