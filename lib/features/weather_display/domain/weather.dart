class Weather {
  final String city;
  final String mainCondition;
  final String description;
  final double temperature;

  const Weather({
    required this.city,
    required this.mainCondition,
    required this.description,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
