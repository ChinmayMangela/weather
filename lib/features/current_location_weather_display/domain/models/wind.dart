
class Wind {
  final double windSpeed;

  const Wind({
    required this.windSpeed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      windSpeed: json['speed'].toDouble(),
    );
  }
}