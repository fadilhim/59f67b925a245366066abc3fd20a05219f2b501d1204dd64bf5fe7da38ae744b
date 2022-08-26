import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/presentation/utilities/utilities.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    this.onTap,
    required this.entity,
  }) : super(key: key);

  final Function()? onTap;
  final WeatherEntity entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          entity.image.image(),
          Expanded(
            child: Column(
              children: [
                Text('${entity.date.EMMMddyyyy} ${entity.date.jm}'),
                Text(entity.name),
                Text('Temp: ${entity.temperature} \u00b0 C'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
