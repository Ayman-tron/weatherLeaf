// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:weatherLeaf/src/features/weather/domain/weather.dart';

class Forecast {
  Forecast({
    required this.forecastList,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Weather> forecastList = list.map((item) {
      return Weather.fromJson(item as Map<String, dynamic>);
    }).toList();

    return Forecast(
      forecastList: forecastList,
    );
  }

  final List<Weather> forecastList;

  @override
  String toString() => 'Forecast(forecastList: $forecastList)';

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) return true;

    return listEquals(other.forecastList, forecastList);
  }

  @override
  int get hashCode => forecastList.hashCode;
}
