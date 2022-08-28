
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/domain/states/states.dart';

/// Handles networked data fetching for weather.
abstract class WeatherRepository {
  /// Returns the weather list of a given coordinate.
  ///
  /// Takes a [double] of latitude, and longitude.
  ///
  /// Returns a Stream [ResourceState] of [WeatherEntity]
  Stream<ResourceState<List<WeatherEntity>?>> getWeatherList({
    required double latitude,
    required double longitude,
  });
}
