import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherLeaf/src/features/weather/data/api_exception.dart';
import 'package:weatherLeaf/src/features/weather/presentation/widgets/weather_info.dart';
import 'error_message.dart';

// Credit: The following code snippet is adapted from the Original Project
// (https://github.com/bizz84/complete-flutter-course) by Andrea Bizztto (GitHub: @bizz84).
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Container(
              constraints: const BoxConstraints(minWidth: 400),
              child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //ErrorMessageWidget(e.toString()), // Display the error message
                    // Display WeatherInfo widgets with default values
                    WeatherInfo(
                      icon: Icons.error_outline, // Placeholder icon
                      content: 'N/A', // Placeholder content
                      weatherCondition:
                          'Unknown', // Placeholder weather condition
                    ),
                  ]),
            ));
  }
}
