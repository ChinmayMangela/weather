import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/utils/helper_functions.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    super.key,
    required this.time,
    required this.mainCondition,
    required this.temperature,
  });

  final DateTime time;
  final int temperature;
  final String mainCondition;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Colors.white
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('h:mm a').format(time),
            style: style,
          ),
          Lottie.asset(HelperFunctions.getWeatherAnimatedIcons(mainCondition), width: 80, height: 80),
          Text(temperature.toString(), style: style,),
        ],
      ),
    );
  }
}
