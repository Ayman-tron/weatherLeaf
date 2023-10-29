// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  Weather({
    required this.feelsLike,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
    required this.cityName,
    required this.icon,
    required this.visibility,
    required this.date,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      pressure: json['main']['pressure'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      cityName: json['name'] as String,
      icon: json['weather'][0]['icon'] as String,
      visibility: json['visibility'] as int,
      date: json['dt'] as DateTime,
    );
  }
  final double feelsLike;
  final int pressure;
  final double windSpeed;
  final int humidity;
  final String cityName;
  final String icon;
  final int visibility;
  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
  final DateTime date;
  // Since all variables are final, declare the constructor below as const
}
