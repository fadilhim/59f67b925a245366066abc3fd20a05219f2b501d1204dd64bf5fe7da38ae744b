import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/data/models/models.dart';
import 'package:weather/data/utilities/utilities.dart';

part 'weather_api_source.g.dart';

@lazySingleton
@RestApi()
abstract class WeatherApiSource {
  @factoryMethod
  factory WeatherApiSource(Dio dio, ApiConfig apiConfig) => _WeatherApiSource(
        dio,
        baseUrl: apiConfig.url,
      );

  @GET(
    '/data/2.5/forecast?lat={latitude}&lon={longitude}&appid={appId}&units=metric',
  )
  Future<WeatherResponseModel> getWeatherList(
    @Path('latitude') String latitude,
    @Path('longitude') String longitude,
    @Path('appId') String appId,
  );
}
