// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  Weather({
    required this.feelsLike,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
    required this.cityName,
    required this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        feelsLike: (json['main']['feels_like'] as num).toDouble(),
        pressure: json['main']['pressure'] as int,
        windSpeed: (json['wind']['speed'] as num).toDouble(),
        humidity: json['main']['humidity'] as int,
        cityName: json['name'] as String,
        icon: json['weather'][0]['icon'] as String);
  }
  final double feelsLike;
  final int pressure;
  final double windSpeed;
  final int humidity;
  final String cityName;
  final String icon;
  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
  // Since all variables are final, declare the constructor below as const

  @override
  String toString() {
    return 'Weather(feelsLike: $feelsLike, pressure: $pressure, windSpeed: $windSpeed, humidity: $humidity, cityName: $cityName, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.feelsLike == feelsLike &&
        other.pressure == pressure &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.cityName == cityName &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return feelsLike.hashCode ^
        pressure.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        cityName.hashCode ^
        icon.hashCode;
  }
}
