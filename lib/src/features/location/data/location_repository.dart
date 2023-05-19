import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../domain/location.dart';

class LocationRepository {
  Future<Location> getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // Print the latitude and longitude
      //print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

      return Location(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      //print(e);
      throw Exception('Failed to get location');
    }
  }
}

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final locationFutureProvider =
    FutureProvider.autoDispose<Location>((ref) async {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return locationRepository.getCurrentLocation();
});
