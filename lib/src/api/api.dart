import '../features/location/domain/location.dart';

class OpenWeatherMapAPI {
  OpenWeatherMapAPI(this.apiKey);
  final String apiKey;

  static const String _apiBaseUrl = "api.openweathermap.org";
  static const String _apiPath = "/data/2.5/";

  Uri weatherByCity(String city) => _buildUri(
        endpoint: "weather",
        parameters: cityQueryParameters(city),
      );

  Uri weatherByLatLon(Location location) => _buildUri(
        endpoint: "weather",
        parameters: latLonQueryParameters(location),
      );

  Uri forecastByCity(String city) => _buildUri(
        endpoint: "forecast",
        parameters: cityQueryParameters(city),
      );

  Uri forecastByLatLon(Location location) => _buildUri(
        endpoint: "forecast",
        parameters: latLonQueryParameters(location),
      );

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> parameters,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
      queryParameters: parameters,
    );
  }

  Map<String, dynamic> cityQueryParameters(String city) => {
        "q": city,
        "appid": apiKey,
        "units": "metric",
      };

  Map<String, dynamic> latLonQueryParameters(Location location) => {
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
        "appid": apiKey,
        "units": "metric",
      };
}
