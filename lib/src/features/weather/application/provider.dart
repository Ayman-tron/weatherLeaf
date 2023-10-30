import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherLeaf/src/features/location/data/location_repository.dart';
import 'package:weatherLeaf/src/features/location/domain/location.dart';
import 'package:weatherLeaf/src/features/weather/data/weather_repository.dart';
import 'package:weatherLeaf/src/features/weather/domain/forecast.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';

// Resource: https://codewithandrea.com/articles/flutter-riverpod-async-notifier/
@riverpod
class City extends _$City {
  @override
  String build() {
    return "Toronto";
  }
}

@riverpod
Future<Weather> weatherByCity(WeatherByCityRef ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeatherByCity(city: city);
  return weather;
}

@riverpod
Future<Weather> weatherByLatLon(
    WeatherByLatLonRef ref, Location location) async {
  print("Fetching weather data by location...");
  final weather = await ref
      .watch(weatherRepositoryProvider)
      .getWeatherByLatLon(location: location);
  return weather;
}

final hourlyWeatherProvider = FutureProvider.autoDispose<Forecast>((ref) async {
  final city = ref.watch(cityProvider);
  final forecast =
      await ref.watch(weatherRepositoryProvider).getForecastByCity(city: city);
  print(forecast);
  return forecast;
});

@riverpod
Future<Weather> userLocationAndCity(UserLocationAndCityRef ref) async {
  final location = await ref.watch(locationRepositoryFutureProvider.future);
  final weather = ref.watch(weatherByLatLonProvider(location).future);
  return weather;
}
