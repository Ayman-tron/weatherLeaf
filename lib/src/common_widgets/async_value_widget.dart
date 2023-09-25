import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      error: (e, stack) => ErrorMessageWidget(e.toString()),
    );
  }
}
