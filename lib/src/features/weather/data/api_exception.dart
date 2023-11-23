// Credit: The following code snippet is adapted from the Original Project
// (https://github.com/bizz84/open_weather_example_flutter/tree/main) by Andrea Bizztto (GitHub: @bizz84).

sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class InvalidApiKeyException extends APIException {
  InvalidApiKeyException() : super('Invalid API key');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class CityNotFoundException extends APIException {
  CityNotFoundException() : super('City not found');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
