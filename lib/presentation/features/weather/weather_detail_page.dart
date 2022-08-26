import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/utilities/utilities.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final WeatherEntity entity;

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Column(
        children: [
          Text(widget.entity.date.EEEEMMMMddyyyy),
          Text(widget.entity.date.jm),
          Row(
            children: [
              Text('${widget.entity.temperature} \u00b0 C'),
              widget.entity.image.image(),
            ],
          ),
          Text('${widget.entity.name} (${widget.entity.description})'),
          Row(
            children: [
              Column(
                children: [
                  const Text('Temp (min)'),
                  Text('${widget.entity.minTemperature} \u00b0 C'),
                ],
              ),
              Column(
                children: [
                  const Text('Temp (max)'),
                  Text('${widget.entity.maxTemperature} \u00b0 C'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
