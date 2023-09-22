//TODO Need to complete the application layer
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherLeaf/src/features/location/domain/location.dart';
import 'package:weatherLeaf/src/features/weather/data/weather_repository.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Toronto';
});

final latLanProvider = StateProvider<Location>((ref) {
  return Location(latitude: 23.4, longitude: 25.6);
});

final weatherByCityProvider = FutureProvider.autoDispose<Weather>((ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeatherByCity(city: city);
  return weather;
});

// final currentWeatherProviderByLatLan = FutureProvider.autoDispose<Weather>((ref) async {
//   final location = ref.watch(latLanProvider);
//   final weather = await ref.watch(weatherRepositoryProvider).getWeatheByLatLon(lat: Location().latitude, lon: lon);
//   return Weather.fromJson(weather);
// });