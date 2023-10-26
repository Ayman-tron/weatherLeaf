import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDateBuilderProvider = Provider<String Function()>((ref) {
  return () {
    final now = DateTime.now();
    final formattedDate =
        "${now.weekdayToString()} ${now.monthToString()} ${now.day}";
    return formattedDate;
  };
});

extension on DateTime {
  String weekdayToString() {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][weekday - 1];
  }

  String monthToString() {
    return [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ][month - 1];
  }
}
