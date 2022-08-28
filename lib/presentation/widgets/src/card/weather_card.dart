import 'package:flutter/material.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/presentation/utilities/utilities.dart';
import 'package:weather/presentation/widgets/widgets.dart';

class WeatherCard extends StatelessWidget {
  /// Creates a weather card.
  ///
  /// The [onTap] is optional.
  ///
  /// While [entity] must not be null.
  const WeatherCard({
    Key? key,
    this.onTap,
    required this.entity,
  }) : super(key: key);

  /// Data to display on card.
  final WeatherEntity entity;

  /// Called when the card is tapped.
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            entity.image.image(height: 60),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entity.date.EMMMddyyyy} ${entity.date.jm}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(entity.name),
                  const SizedBox(height: 4),
                  Text('Temp: ${entity.temperature} \u00b0 C'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherLoadingCard extends StatelessWidget {
  /// Creates a weather loading card.
  const WeatherLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      child:  Row(
          children: [
            const ShimmerLoading(
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerLoading(
                    height: 12,
                    width: 200,
                  ),
                  SizedBox(height: 4),
                  ShimmerLoading(
                    height: 12,
                    width: 40,
                  ),
                  SizedBox(height: 4),
                  ShimmerLoading(
                    height: 12,
                    width: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
