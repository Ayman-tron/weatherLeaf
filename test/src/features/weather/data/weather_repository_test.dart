import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:weatherLeaf/src/api/api.dart';
import 'package:weatherLeaf/src/features/weather/data/api_exception.dart';
import 'package:weatherLeaf/src/features/weather/data/weather_repository.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

// This code is a unit test for the HttpWeatherRepository class. It checks whether the repository correctly
// fetches weather data and parses it from a JSON response using a mocked HTTP client. The expected result is
// compared to the actual result obtained from the repository's method. If they match, the test case passes; otherwise,
// it fails, indicating a potential issue in the code being tested.
class MockHttpClient extends Mock implements http.Client {}

// Given
const sampleWeatherJsonResponse = """{
    "coord": {
        "lon": -79.3839,
        "lat": 43.6535
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 17.79,
        "feels_like": 17.4,
        "temp_min": 16.79,
        "temp_max": 19.06,
        "pressure": 1021,
        "humidity": 68
    },
    "visibility": 10000,
    "wind": {
        "speed": 6.17,
        "deg": 60,
        "gust": 10.29
    },
    "clouds": {
        "all": 0
    },
    "dt": 1695648497,
    "sys": {
        "type": 1,
        "id": 718,
        "country": "CA",
        "sunrise": 1695640068,
        "sunset": 1695683445
    },
    "timezone": -14400,
    "id": 6167863,
    "name": "Toronto",
    "cod": 200
}""";

const expectedWeatherFromJson = Weather(
    feelsLike: 17.4,
    pressure: 1021,
    windSpeed: 6.17,
    humidity: 68,
    cityName: 'Toronto');

void main() {
  test('repository with mocked http client, success ...', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository =
        HttpWeatherRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.weatherByCity('Toronto'))).thenAnswer(
        (_) => Future.value(http.Response(sampleWeatherJsonResponse, 200)));
    final weather = await weatherRepository.getWeatherByCity(city: 'Toronto');
    expect(weather, expectedWeatherFromJson);
  });

  test('repository with mocked http client, failure ...', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository =
        HttpWeatherRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.weatherByCity('Toronto')))
        .thenAnswer((_) => Future.value(http.Response('{}', 404)));

    expect(() => weatherRepository.getWeatherByCity(city: 'Toronto'),
        throwsA(isA<APIException>()));
  });
}
