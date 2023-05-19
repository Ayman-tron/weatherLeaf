import '../../../services/networking.dart';
import '../../location/domain/location.dart';
import '../domain/weather.dart';

class WeatherAPI {
  final NetworkHelper _networkHelper;

  WeatherAPI({required String apiKey})
      : _networkHelper = NetworkHelper(
            'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey');

  Future<Weather> getWeatherByCityName(String cityName) async {
    String encodedCityName = Uri.encodeComponent(cityName);
    final response = await _networkHelper.getData('&q=$encodedCityName');
    return Weather.fromJson(response);
  }

  Future<Weather> getWeatherByLocation(Location location) async {
    final response = await _networkHelper
        .getData('&lat=${location.latitude}&lon=${location.longitude}');
    return Weather.fromJson(response);
  }
}
