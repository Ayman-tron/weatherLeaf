import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityName extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updateCityName(String cityName) {
    state = cityName;
  }
}

final cityNameProvider = NotifierProvider<CityName, String>(CityName.new);
