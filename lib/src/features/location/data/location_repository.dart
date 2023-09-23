import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherLeaf/src/features/location/domain/location.dart';
import 'package:weatherLeaf/src/features/weather/data/weather_repository.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

class LocationRepository {
  Future<Location> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    debugPrint("Successful");
    // print(Geolocator.getCurrentPosition());

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    //print(Location(latitude: position.latitude, longitude: position.longitude));
    return Future.value(
        Location(latitude: position.latitude, longitude: position.longitude));
  }
}

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final locationRepositoryFutureProvider =
    FutureProvider.autoDispose<Location>((ref) async {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return locationRepository.determinePosition();
});
