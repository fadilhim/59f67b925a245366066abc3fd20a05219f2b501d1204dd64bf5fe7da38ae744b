import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        child: Column(
          children: [
            Text(
              widget.entity.date.EEEEMMMMddyyyy,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              widget.entity.date.jm,
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.entity.temperature} \u00b0 C',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(width: 12),
                widget.entity.image.image(),
              ],
            ),
            Text(
              '${widget.entity.name} (${widget.entity.description})',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Temp (min)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.entity.minTemperature != null
                          ? '${widget.entity.minTemperature} \u00b0C'
                          : 'Not Available',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Temp (max)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.entity.maxTemperature != null
                          ? '${widget.entity.maxTemperature} \u00b0 C'
                          : 'Not Available',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
