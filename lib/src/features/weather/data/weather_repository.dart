import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherLeaf/src/api/api.dart';
import 'package:weatherLeaf/src/api/api_keys.dart';
import 'package:weatherLeaf/src/features/location/domain/location.dart';
import 'package:weatherLeaf/src/features/weather/data/api_exception.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';
// Credit: The following code snippet is adapted from the Original Project
// (https://github.com/bizz84/open_weather_example_flutter/tree/main) by Andrea Bizztto (GitHub: @bizz84).

class HttpWeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});
  final OpenWeatherMapAPI api;
  final http.Client client;

  Future<Weather> getWeatherByCity({required String city}) => _getData(
        uri: api.weatherByCity(city),
        builder: (data) => Weather.fromJson(data),
      );
  Future<Weather> getWeatherByLatLon({required Location location}) => _getData(
        uri: api.weatherByLatLon(location),
        builder: (data) => Weather.fromJson(data),
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw InvalidApiKeyException();
        case 404:
          throw CityNotFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}

final weatherRepositoryProvider = Provider<HttpWeatherRepository>((ref) {
  return HttpWeatherRepository(
      api: OpenWeatherMapAPI(apiKey), client: http.Client());
});
