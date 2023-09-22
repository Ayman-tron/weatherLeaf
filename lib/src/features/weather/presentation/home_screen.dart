import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherLeaf/src/common_widgets/async_value_widget.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import 'package:weatherLeaf/src/features/weather/presentation/weather_detail.dart';
import '../../../routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //final LocationRepository locationRepository = LocationRepository();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityProvider);
    // print(weatherData);
    final city = ref.watch(cityProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
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
              Align(
                alignment: Alignment.topRight,
                child: AsyncValueWidget(
                  value: weatherData,
                  data: (weatherData) => Text(
                    "${weatherData.feelsLike.toStringAsFixed(0)}°",
                    style: const TextStyle(
                        fontSize: 90,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              const WeatherDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
