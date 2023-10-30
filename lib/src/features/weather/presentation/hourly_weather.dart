import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import 'package:weatherLeaf/src/features/weather/domain/weather.dart';
import 'package:weatherLeaf/src/features/weather/presentation/weather_icon_image.dart';

class HourlyWeather extends ConsumerWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(hourlyWeatherProvider);
    return forecastDataValue.when(
        data: (forecastData) {
          print('Forecast data: $forecastData');
          if (forecastData.forecastList.isEmpty) {
            // Handle empty list, perhaps return a different widget or display a message
            return const Text('No forecast data available');
          } else {
            final items = [0, 8, 16, 24, 32];
            return HourlyWeatherRow(
              weatherDataItems: [
                for (var i in items)
                  if (i <
                      forecastData
                          .forecastList.length) // Ensure index is within range
                    forecastData.forecastList[i],
              ],
            );
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) {
          print(e); // Add this line
          return Text(e.toString());
        });
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({super.key, required this.weatherDataItems});
  final List<Weather> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => HourlyWeatherItem(data: data))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends ConsumerWidget {
  const HourlyWeatherItem({super.key, required this.data});
  final Weather data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(data);
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp = data.temp.toInt().toString();
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(data.date),
            style: textTheme.bodySmall!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          WeatherIconImage(iconUrl: data.iconUrl, size: 48),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
