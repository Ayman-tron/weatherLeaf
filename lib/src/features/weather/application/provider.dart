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

// final weatherByLatLonProvider =
//     FutureProvider.autoDispose<Location>((ref) async {
//   final location = (ref.watch(locationRepositoryFutureProvider));
//   return location;
// });

final weatherByLatLonProvider =
    FutureProvider.autoDispose<Weather>((ref) async {
  final locationAsyncValue = ref.watch(locationRepositoryFutureProvider);

  // Check if the locationAsyncValue has data and is not an error
  if (locationAsyncValue is AsyncData<Location>) {
    final location = locationAsyncValue.value;
    final weather = await ref
        .watch(weatherRepositoryProvider)
        .getWeatherByLatLon(lat: location.latitude, lon: location.longitude);
    return weather;
  } else if (locationAsyncValue is AsyncLoading) {
    // Handle the loading state if needed
    // You can return a loading indicator or handle it differently
    throw Exception("Loading");
  } else {
    // Handle the case where location data is not available
    throw Exception("Failure");
  }
});
