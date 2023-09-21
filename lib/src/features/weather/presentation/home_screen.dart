import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherLeaf/src/features/weather/presentation/widgets/weather_info.dart';
import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/error_message.dart';
import '../../../common_widgets/responsive_center.dart';
import '../../../routing/app_router.dart';
import '../domain/weather.dart';
import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        const Text(
                          "London",
                          style: TextStyle(
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
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "20°",
                  style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Column(
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
                      ResponsiveCenter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WeatherInfo(
                              icon: FaIcon(FontAwesomeIcons.temperatureHigh),
                              iconDescription: "Feels Like",
                              data: Text(
                                "15°",
                              ),
                            ),
                            WeatherInfo(
                              icon: FaIcon(FontAwesomeIcons.perbyte),
                              iconDescription: "Pressure",
                              data: Text(
                                "10 Pa",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ResponsiveCenter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WeatherInfo(
                              icon: FaIcon(FontAwesomeIcons.wind),
                              iconDescription: "Wind",
                              data: Text(
                                "200 km/h",
                              ),
                            ),
                            WeatherInfo(
                              icon: FaIcon(FontAwesomeIcons.cloud),
                              iconDescription: "Humidity",
                              data: Text(
                                "12 %",
                              ),
                            ),
                          ],
                        ),
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
