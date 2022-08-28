part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    required ResourceState<List<WeatherEntity>?> weatherList,
  }) = _WeatherState;

  factory WeatherState.initial() => const WeatherState(
    weatherList: ResourceState.loading(),
  );
}