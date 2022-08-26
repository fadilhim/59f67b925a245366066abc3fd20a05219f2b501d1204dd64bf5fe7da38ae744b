import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/gen/assets.gen.dart';

part 'weather_entity.freezed.dart';

@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String name,
    required String description,
    required DateTime date,
    required WeatherStatus status,
    required double temperature,
    required double minTemperature,
    required double maxTemperature,
    required AssetGenImage image,
  }) = _WeatherEntity;
}

enum WeatherStatus {
  clearSky, // 1
  fewClouds, // 2
  scatteredClouds, // 3
  brokenClouds, //4
  showerRain, // 9
  rain, //10
  thunderstorm, // 11
  snow, // 13
  mist, // 50
  unknown,
}
