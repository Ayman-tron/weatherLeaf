import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherLeaf/src/common_widgets/async_value_widget.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import 'package:weatherLeaf/src/features/weather/presentation/hourly_weather.dart';
import 'package:weatherLeaf/src/features/weather/presentation/weather_icon_image.dart';
import 'package:weatherLeaf/src/utils/current_date_provider.dart';
import '../../../routing/app_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  //final LocationRepository locationRepository = LocationRepository();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityProvider);
    final dateBuilder = ref.watch(currentDateBuilderProvider);
    final currentDate = dateBuilder();
    // print(weatherData);
    final city = ref.watch(cityProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF233079), Color(0xFF00a9d8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            city,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          IconButton(
                            onPressed: () =>
                                context.pushNamed(AppRoute.city.name),
                            icon: const Icon(
                              Icons.location_city,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Text(
                        currentDate,
                        style: const TextStyle(
                          color: Color(0xFF00a9d8),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                AsyncValueWidget(
                  value: weatherData,
                  data: (weatherData) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${weatherData.temp.toInt().toString()}°",
                        style: const TextStyle(
                            fontSize: 90,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      WeatherIconImage(iconUrl: weatherData.iconUrl, size: 60),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: AsyncValueWidget(
                      value: weatherData,
                      data: (weatherData) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherIcon(
                              icon: Icons.air_outlined,
                              description:
                                  "${weatherData.windSpeed.toStringAsFixed(1)} km/h",
                              weatherCondition: "Wind"),
                          WeatherIcon(
                              icon: Icons.water_drop_outlined,
                              description:
                                  "${weatherData.humidity.toStringAsFixed(0)}%",
                              weatherCondition: "Humidity"),
                          WeatherIcon(
                              icon: Icons.visibility_outlined,
                              description:
                                  "${((weatherData.visibility) / 1000).toStringAsFixed(0)} km",
                              weatherCondition: "Visibility"),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weekly forecast",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      size: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const HourlyWeather(),
                const Spacer(
                  flex: 3,
                ),
              ].animate(interval: 100.ms).fade(duration: 800.ms),
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
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
