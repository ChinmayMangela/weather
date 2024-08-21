class HelperFunctions {
  static String getWeatherAnimatedIcons(String? mainCondition) {
    if (mainCondition == null) return 'assets/clear_day.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return isDay() ? 'assets/rain_day.json' : 'assets/rain_night.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return isDay() ? 'assets/clear_day.json' : 'assets/clear_night.json';
      default:
        return isDay() ? 'assets/clear_day.json' : 'assets/clear_night.json';
    }
  }

  static bool isDay() {
    final now = DateTime.now();
    final sunrise = DateTime(now.year, now.month, now.day, 6, 0);
    final sunset = DateTime(now.year, now.month, now.day, 18, 0);
    return now.isAfter(sunrise) && now.isBefore(sunset);
  }
}
