

class Main {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double pressure;

  const Main({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temperature: json['temp'].toDouble() - 273.15,
      minTemperature: json['temp_min'].toDouble() - 273.15,
      maxTemperature: json['temp_max'].toDouble() - 273.15,
      humidity: json['humidity'].toDouble(),
      pressure: json['pressure'].toDouble(),
    );
  }
}
