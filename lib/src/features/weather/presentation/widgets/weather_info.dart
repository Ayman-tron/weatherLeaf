import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo(
      {super.key,
      required this.icon,
      required this.description,
      required this.weatherCondition});
  final IconData icon;
  final String description;
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF00a9d8),
          size: 50,
        )
            .animate(
              onPlay: (controller) => controller.loop(count: 6, reverse: true),
              delay: 600.ms,
            )
            .slideY(begin: 0, curve: Curves.bounceIn, duration: 200.ms)
            .then()
            .slideY(end: -0.25, curve: Curves.bounceOut),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 16, color: Color(0xFF00a9d8)),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          weatherCondition,
          style: const TextStyle(fontSize: 12, color: Color(0xFF00a9d8)),
        ),
      ],
    );
  }
}
