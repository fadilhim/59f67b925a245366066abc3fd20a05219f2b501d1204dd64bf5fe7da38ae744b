import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/di/inject.dart';
import 'package:weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather/presentation/routers/router.dart';
import 'package:weather/utilities/utilities.dart';

void main() async {
  // Make sure all is initialized before we configure everything.
  WidgetsFlutterBinding.ensureInitialized();

  // Logging
  if (kDebugMode) {
    Fimber.plantTree(DevTree());
  }

  await configureDependencies();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<WeatherBloc>(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return MaterialApp.router(
            routeInformationParser: inject<AppRouter>().defaultRouteParser(),
            routerDelegate: inject<AppRouter>().delegate(),
            title: 'Weather',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
