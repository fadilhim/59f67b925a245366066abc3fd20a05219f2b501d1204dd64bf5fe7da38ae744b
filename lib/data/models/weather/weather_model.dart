import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/utilities/utilities.dart';
import 'package:weather/domain/entities/entities.dart';

part 'weather_model.freezed.dart';

part 'weather_model.g.dart';

@freezed
class WeatherResponseModel with _$WeatherResponseModel {
  const factory WeatherResponseModel({
    @JsonKey(name: 'cod') required String code,
    required int message,
    @JsonKey(name: 'list') required List<WeatherModel> data,
  }) = _WeatherResponseModel;

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @MillisToDateTimeConverter() @JsonKey(name: 'dt') required DateTime date,
    required WeatherMainModel main,
    required List<WeatherDataModel> weather,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

extension WeatherModelX on WeatherModel {
  WeatherEntity toEntity() {
    final data = weather.firstOrNull;
    if (data == null) {
      throw 'error parsing data';
    }
    return WeatherEntity(
      name: data.name,
      description: data.description,
      date: date,
      temperature: main.temp,
      minTemperature: main.tempMin,
      maxTemperature: main.tempMax,
      image: WeatherDataConversion.weatherIconStatusFromModel(data.icon),
    );
  }
}

@freezed
class WeatherMainModel with _$WeatherMainModel {
  const factory WeatherMainModel({
    required double temp,
    double? tempMin,
    double? tempMax,
  }) = _WeatherMainModel;

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainModelFromJson(json);
}

@freezed
class WeatherDataModel with _$WeatherDataModel {
  const factory WeatherDataModel({
    required int id,
    @JsonKey(name: 'main') required String name,
    required String description,
    required String icon,
  }) = _WeatherDataModel;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);
}
