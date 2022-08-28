part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.loadWeather({
    double? longitude,
    double? latitude,
  }) = LoadWeather;

  const factory WeatherEvent.loadWeatherYielded(
    ResourceState<List<WeatherEntity>?> entity,
  ) = LoadWeatherYielded;
}
