class Weather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final int cloudiness;
  final String description;
  final String iconUrl;
  final DateTime date;
  final String cityName;
  final int visibility;

  Weather(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.cloudiness,
      required this.description,
      required this.iconUrl,
      required this.date,
      required this.cityName,
      required this.visibility});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final mainData =
        (json['main'] is Map<String, dynamic>) ? json['main'] : json;
    final windData =
        (json['wind'] is Map<String, dynamic>) ? json['wind'] : json;
    final cloudsData =
        (json['clouds'] is Map<String, dynamic>) ? json['clouds'] : json;
    final weatherData = (json['weather'] is List) ? json['weather'][0] : json;
    final dt = (json['dt'] is int) ? json['dt'] : null;

    return Weather(
        temp: (mainData['temp'] ?? 0).toDouble(),
        feelsLike: (mainData['feels_like'] ?? 0).toDouble(),
        tempMin: (mainData['temp_min'] ?? 0).toDouble(),
        tempMax: (mainData['temp_max'] ?? 0).toDouble(),
        pressure: (mainData['pressure'] ?? 0).toInt(),
        humidity: (mainData['humidity'] ?? 0).toInt(),
        windSpeed: (windData['speed'] ?? 0).toDouble(),
        windDeg: (windData['deg'] ?? 0).toInt(),
        cloudiness: (cloudsData['all'] ?? 0).toInt(),
        description: (weatherData['description'] ?? ''),
        iconUrl: (weatherData['icon'] != null)
            ? 'https://openweathermap.org/img/w/${weatherData['icon']}.png'
            : '',
        date: (dt != null)
            ? DateTime.fromMillisecondsSinceEpoch(dt * 1000)
            : DateTime.now(),
        cityName: (json['name'] ?? ''),
        visibility: (json['visibility'] ?? 0).toInt());
  }
}
