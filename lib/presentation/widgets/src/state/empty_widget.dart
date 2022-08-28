import 'package:flutter/material.dart';

class WeatherEmptyWidget extends StatelessWidget {
  const WeatherEmptyWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? 'There\'s no data here yet',
          ),
        ],
      ),
    );
  }
}
