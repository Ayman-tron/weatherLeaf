// Import the necessary package(s) and/or class file(s)
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

class Forecast {
  // Define the forecastList field
  final List<Weather> forecastList;

  // Initialize the forecastList field in the constructor
  Forecast({
    required this.forecastList,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'];
    if (list == null) {
      //print('Error: Missing "list" field in JSON.');
      throw const FormatException("Missing 'list' field in JSON.");
    }
    if (list is! List) {
      //print('Error: "list" field should be a List.');
      throw const FormatException("'list' field should be a List.");
    }

    List<Weather> forecastList = [];
    for (var i = 0; i < list.length; i++) {
      try {
        var item = list[i];
        if (item is! Map<String, dynamic>) {
          // print(
          //     'Error: List item at index $i should be a Map<String, dynamic>, but is ${item.runtimeType}.');
          continue; // Skip to next iteration
        }
        forecastList.add(Weather.fromJson(item));
      } catch (e) {
        //print('Error parsing weather data at index $i: $e');
      }
    }

    if (forecastList.isEmpty) {
      print(
          'Warning: No valid forecast data was parsed from the "list" field.');
    }

    return Forecast(
      forecastList: forecastList,
    );
  }

  @override
  String toString() => 'Forecast(forecastList: $forecastList)';
}
