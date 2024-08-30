
class Weather {
  final String mainCondition;
  final String description;

  const Weather({
    required this.mainCondition,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      mainCondition: json['main'],
      description: json['description'],
    );
  }
}