import 'package:injectable/injectable.dart';
import 'package:weather/domain/entities/entities.dart';
import 'package:weather/domain/repositories/repositories.dart';
import 'package:weather/domain/states/states.dart';

@lazySingleton
class GetWeatherInteractor {
  final WeatherRepository _approvalRepository;

  GetWeatherInteractor(this._approvalRepository);

  Stream<ResourceState<List<WeatherEntity>?>> call({
    required double latitude,
    required double longitude,
  }) async* {
    yield* _approvalRepository.getWeatherList(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
