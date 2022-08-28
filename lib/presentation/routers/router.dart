// Auto Route doesn't handle import custom entity
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather/presentation/features/weather/weather_detail_page.dart';
import 'package:weather/presentation/features/weather/weather_list_page.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(
      path: '/',
      name: 'WeatherListRouter',
      page: WeatherListPage,
    ),
    AutoRoute<void>(
      path: '/weather-detail',
      name: 'WeatherDetailRouter',
      page: WeatherDetailPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
