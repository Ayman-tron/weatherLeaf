import 'package:flutter_riverpod/flutter_riverpod.dart'; // make sure to import location
import 'package:weatherLeaf/src/features/home/data/weather_service.dart';
import '../../location/data/location_repository.dart';
import '../../location/domain/location.dart';
import '../domain/weather.dart';
import 'package:weatherLeaf/src/api/api_keys.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherByCity(String city);
  Future<Weather> getWeatherByLocation(Location location);
}

class _WeatherRepository implements WeatherRepository {
  final WeatherAPI _weatherAPI;

  _WeatherRepository({required String apiKey}) // take apiKey as parameter
      : _weatherAPI = WeatherAPI(apiKey: apiKey); // and pass it here

  @override
  Future<Weather> getWeatherByCity(String city) async {
    final weather =
        await _weatherAPI.getWeatherByCityName(city); // call the correct method
    //print(weather);
    return weather;
  }

  @override
  Future<Weather> getWeatherByLocation(Location location) async {
    final weather = await _weatherAPI.getWeatherByLocation(location);
    //print(weather);
    return weather;
  }
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return _WeatherRepository(apiKey: apiKey);
});

final weatherByCityProvider =
    FutureProvider.family<Weather, String>((ref, cityName) async {
  final api = ref.watch(weatherRepositoryProvider);
  return api.getWeatherByCity(cityName);
});

final weatherByLocationProvider =
    FutureProvider.family<Weather, Location>((ref, location) async {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return weatherRepository.getWeatherByLocation(location);
});
