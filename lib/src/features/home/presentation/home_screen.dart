import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherLeaf/src/features/home/presentation/widgets/weather_info.dart';
import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/error_message.dart';
import '../../../routing/app_router.dart';
import '../../city_search/presentation/cityScreenController.dart';
import '../../location/data/location_repository.dart';
import '../data/weather_repository.dart';
import '../domain/weather.dart';
import 'loading_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for changes in the city name
    final cityName = ref.watch(cityNameProvider);

    // If a city name is set, use it to get the weather
    if (cityName.isNotEmpty) {
      final weatherAsyncValue = ref.watch(weatherByCityProvider(cityName));
      return _buildWeatherScreen(weatherAsyncValue, context);
    } else {
      // If no city name is set, use the user's location
      final locationAsyncValue = ref.watch(locationFutureProvider);

      return locationAsyncValue.when(
        data: (location) {
          // If the user's location is available, use it to get the weather
          final weatherAsyncValue =
              ref.watch(weatherByLocationProvider(location));
          return _buildWeatherScreen(weatherAsyncValue, context);
        },
        loading: () {
          return LoadingScreen();
        },
        error: (error, stack) {
          return ErrorMessageWidget('$error');
        },
      );
    }
  }

  Widget _buildWeatherScreen(
      AsyncValue<Weather> weatherAsyncValue, BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                        AsyncValueWidget(
                          value: weatherAsyncValue,
                          data: (weather) {
                            return Text(
                              "${weather.cityName}",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        IconButton(
                            onPressed: () =>
                                context.pushNamed(AppRoute.city.name),
                            icon: Icon(
                              Icons.location_city,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: AsyncValueWidget(
                    value: weatherAsyncValue,
                    data: (weather) => Text(
                      "${weather.feelsLike.toStringAsFixed(0)}°",
                      style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Weather now",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherInfo(
                            icon: FaIcon(FontAwesomeIcons.temperatureHigh),
                            iconDescription: "Feels Like",
                            data: AsyncValueWidget(
                              value: weatherAsyncValue,
                              data: (weather) => Text(
                                "${weather.feelsLike.toStringAsFixed(0)}°",
                              ),
                            ),
                          ),
                          WeatherInfo(
                            icon: FaIcon(FontAwesomeIcons.perbyte),
                            iconDescription: "Pressure",
                            data: AsyncValueWidget(
                              value: weatherAsyncValue,
                              data: (weather) => Text(
                                "${weather.pressure.toStringAsFixed(0)} Pa",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherInfo(
                            icon: FaIcon(FontAwesomeIcons.wind),
                            iconDescription: "Wind",
                            data: AsyncValueWidget(
                              value: weatherAsyncValue,
                              data: (weather) => Text(
                                "${weather.windSpeed.toStringAsFixed(1)} km/h",
                              ),
                            ),
                          ),
                          WeatherInfo(
                            icon: FaIcon(FontAwesomeIcons.cloud),
                            iconDescription: "Humidity",
                            data: AsyncValueWidget(
                              value: weatherAsyncValue,
                              data: (weather) => Text(
                                "${weather.humidity.toStringAsFixed(0)} %",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
