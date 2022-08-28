import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/domain/interactors/interactors.dart';
import 'package:weather/domain/states/states.dart';

part 'weather_event.dart';

part 'weather_state.dart';

part 'weather_bloc.freezed.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherInteractor _getWeatherListInteractor;
  StreamSubscription<ResourceState<List<WeatherEntity>?>>?
      _getWeatherSubscription;

  WeatherBloc(
    this._getWeatherListInteractor,
  ) : super(WeatherState.initial()) {
    on<LoadWeather>(_handleLoadWeather);
    on<LoadWeatherYielded>(_handleLoadWeatherYielded);

    add(const WeatherEvent.loadWeather());
  }

  @override
  Future<void> close() {
    _getWeatherSubscription?.cancel();
    return super.close();
  }

  Future<void> _handleLoadWeather(
    LoadWeather event,
    Emitter<WeatherState> emit,
  ) async {
    await _getWeatherSubscription?.cancel();

    // Set latitude and longitude to Monas coordinate
    const longitude = 106.82708842419382;
    const latitude = -6.175115064391812;

    _getWeatherSubscription = _getWeatherListInteractor(
      latitude: latitude,
      longitude: longitude,
    ).listen((result) {
      add(WeatherEvent.loadWeatherYielded(result));
    });
  }

  Future<void> _handleLoadWeatherYielded(
    LoadWeatherYielded event,
    Emitter<WeatherState> emit,
  ) async {
    event.entity.map(
      loading: (result) {
        Fimber.i('Loading weather list...');
        emit(state.copyWith(
          weatherList: result,
        ));
      },
      success: (result) {
        Fimber.i('Successfully loaded weather list');
        emit(state.copyWith(
          weatherList: result,
        ));
      },
      error: (result) {
        Fimber.i('Failed to load weather list: Code: ${result.code} \n'
            'Message: ${result.message}');
        emit(state.copyWith(
          weatherList: result,
        ));
      },
    );
  }
}
