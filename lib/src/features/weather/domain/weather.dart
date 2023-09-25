// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  final double feelsLike;
  final int pressure;
  final double windSpeed;
  final int humidity;
  final String cityName;

  // Since all variables are final, declare the constructor below as const
  const Weather({
    required this.feelsLike,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
    required this.cityName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        feelsLike: (json['main']['feels_like'] as num).toDouble(),
        pressure: json['main']['pressure'] as int,
        windSpeed: (json['wind']['speed'] as num).toDouble(),
        humidity: json['main']['humidity'] as int,
        cityName: json['name'] as String);
  }
  @override
  String toString() {
    return 'Weather(feelsLike: $feelsLike, pressure: $pressure, windSpeed: $windSpeed, humidity: $humidity, cityName: $cityName)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.feelsLike == feelsLike &&
        other.pressure == pressure &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.cityName == cityName;
  }

  @override
  int get hashCode {
    return feelsLike.hashCode ^
        pressure.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        cityName.hashCode;
  }
}
