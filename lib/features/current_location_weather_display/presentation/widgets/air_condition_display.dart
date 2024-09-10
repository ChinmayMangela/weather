import 'package:flutter/material.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/features/current_location_weather_display/data/air_condition_data.dart';
import 'package:weather/features/current_location_weather_display/domain/models/air_condition.dart';
import 'package:weather/features/current_location_weather_display/domain/models/forecast.dart';

class AirConditionDisplay extends StatelessWidget {
  const AirConditionDisplay({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final airConditionData = AirConditionData(forecast).data; // Extract data once

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: containerGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AIR CONDITIONS',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildAirConditionRow(context, airConditionData[0], airConditionData[1]),
            const SizedBox(height: 15),
            _buildAirConditionRow(context, airConditionData[2], airConditionData[3]),
          ],
        ),
      ),
    );
  }

  Widget _buildAirConditionRow(BuildContext context, AirCondition condition1, AirCondition condition2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute items evenly
      children: [
        _buildAirConditionItem(context, condition1),
        _buildAirConditionItem(context, condition2),
      ],);
  }

  // Helper method to build a single air condition item
  Widget _buildAirConditionItem(BuildContext context, AirCondition condition) {
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(condition.icon, color: Colors.grey, size: 30,),
        const SizedBox(width: 8), // Add spacing between icon and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            Text(condition.label, style: bodyLargeStyle.copyWith(
              color: Colors.grey
            ),),
            Text(condition.value, style: bodyLargeStyle.copyWith(
                color: Colors.white,
            ),),
          ],
        ),
      ],
    );
  }
}