import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/widgets/widgets.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({Key? key}) : super(key: key);

  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: ListView.separated(
        itemCount: 2,
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemBuilder: (context, index) {
          return WeatherCard(
            entity: WeatherEntity(
              name: 'name',
              description: 'description',
              date: DateTime.now(),
              status: WeatherStatus.brokenClouds,
              temperature: 20,
              minTemperature: 20,
              maxTemperature: 20,
              image: Assets.images.brokenClouds,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
