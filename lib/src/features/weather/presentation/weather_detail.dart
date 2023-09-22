import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherLeaf/src/common_widgets/async_value_widget.dart';
import 'package:weatherLeaf/src/common_widgets/responsive_center.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import 'package:weatherLeaf/src/features/weather/presentation/widgets/weather_info.dart';

class WeatherDetail extends ConsumerWidget {
  const WeatherDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityProvider);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "Weather now",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            ResponsiveCenter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                      icon: const FaIcon(FontAwesomeIcons.temperatureHigh),
                      iconDescription: "Feels Like",
                      data: AsyncValueWidget(
                        value: weatherData,
                        data: (weather) => Text(
                          "${weather.feelsLike.toStringAsFixed(0)}°",
                        ),
                      )),
                  WeatherInfo(
                      icon: const FaIcon(FontAwesomeIcons.perbyte),
                      iconDescription: "Pressure",
                      data: AsyncValueWidget(
                        value: weatherData,
                        data: (weather) => Text(
                          "${weather.pressure.toStringAsFixed(0)}°",
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ResponsiveCenter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                      icon: const FaIcon(FontAwesomeIcons.wind),
                      iconDescription: "Wind",
                      data: AsyncValueWidget(
                        value: weatherData,
                        data: (weather) => Text(
                          "${weather.windSpeed.toStringAsFixed(1)} km/h",
                        ),
                      )),
                  WeatherInfo(
                    icon: const FaIcon(FontAwesomeIcons.cloud),
                    iconDescription: "Humidity",
                    data: AsyncValueWidget(
                      value: weatherData,
                      data: (weather) => Text(
                        "${weather.humidity.toStringAsFixed(0)}%",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
