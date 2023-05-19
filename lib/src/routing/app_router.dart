import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/city_search/presentation/city_screen.dart';
import '../features/home/presentation/home_screen.dart';

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
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'citySearch',
            name: AppRoute.city.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: City_Search(),
            ),
          ),
        ]),
  ],
);
