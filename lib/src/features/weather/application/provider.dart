//TODO Need to complete the application layer
//TODO There is a better way to implement weatherByLatLonProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherLeaf/src/features/location/data/location_repository.dart';
import 'package:weatherLeaf/src/features/location/domain/location.dart';
import 'package:weatherLeaf/src/features/weather/data/weather_repository.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Toronto';
});

final weatherByCityProvider = FutureProvider.autoDispose<Weather>((ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeatherByCity(city: city);
  return weather;
});

final weatherByLatLonProvider =
    FutureProvider.autoDispose.family<Weather, Location>((ref, location) async {
  print("Fetching weather data by location...");
  final weather = await ref
      .watch(weatherRepositoryProvider)
      .getWeatherByLatLon(location: location);
  return weather;
});
