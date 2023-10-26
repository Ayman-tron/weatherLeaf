import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherLeaf/src/common_widgets/async_value_widget.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import 'package:weatherLeaf/src/features/weather/presentation/weather_icon_image.dart';
import 'package:weatherLeaf/src/utils/current_date_provider.dart';
import '../../../routing/app_router.dart';

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
              const SizedBox(
                height: 20,
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
              AsyncValueWidget(
                value: weatherData,
                data: (weatherData) => Row(
                  children: [
                    Text(
                      "${weatherData.feelsLike.toStringAsFixed(0)}°",
                      style: const TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    WeatherIconImage(iconUrl: weatherData.iconUrl, size: 60),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
