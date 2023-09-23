import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/weather/presentation/city_screen.dart';
import '../features/weather/presentation/home_screen.dart';

enum AppRoute {
  home,
  city,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'citySearch',
            name: AppRoute.city.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const City_Search(),
            ),
          ),
        ]),
  ],
);
