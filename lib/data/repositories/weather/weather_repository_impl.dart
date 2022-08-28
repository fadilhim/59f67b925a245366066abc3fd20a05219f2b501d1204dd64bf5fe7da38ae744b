import 'package:injectable/injectable.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/data/repositories/weather/src/weather_api_source.dart';
import 'package:weather/data/utilities/utilities.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/domain/repositories/repositories.dart';
import 'package:weather/domain/states/states.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiSource _weatherApiSource;
  final ApiConfig _apiConfig;

  WeatherRepositoryImpl(
    this._weatherApiSource,
    this._apiConfig,
  );

  @override
  Stream<ResourceState<List<WeatherEntity>?>> getWeatherList({
    required double latitude,
    required double longitude,
  }) async* {
    yield const ResourceState.loading();

    try {
      final result = await _weatherApiSource.getWeatherList(
        latitude.toString(),
        longitude.toString(),
        _apiConfig.id,
      );

      yield ResourceState.success(
        code: int.tryParse(result.code) ?? 5001,
        message: 'success',
        data: result.data.map((e) => e.toEntity()).toList(),
      );
    } catch (e) {
      yield ResourceState.error(code: 5000, message: '$e');
    }
  }
}
