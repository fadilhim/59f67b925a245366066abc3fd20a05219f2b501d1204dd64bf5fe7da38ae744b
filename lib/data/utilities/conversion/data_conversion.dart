import 'package:weather/gen/assets.gen.dart';

class WeatherDataConversion {
  WeatherDataConversion._();

  static AssetGenImage weatherIconStatusFromModel(String id) {
    switch (id) {
      case '01d':
        return Assets.images.clearSkyDay;
      case '01n':
        return Assets.images.clearSkyNight;
      case '02d':
        return Assets.images.fewCloudsDay;
      case '02n':
        return Assets.images.fewCloudsNight;
      case '03d':
      case '03n':
        return Assets.images.scatteredClouds;
      case '04d':
      case '04n':
        return Assets.images.brokenClouds;
      case '09d':
      case '09n':
        return Assets.images.showerRain;
      case '10d':
        return Assets.images.rainDay;
      case '10n':
        return Assets.images.rainNight;
      case '11d':
      case '11n':
        return Assets.images.thunderstorm;
      case '13n':
      case '13d':
        return Assets.images.snow;
      case '50d':
      case '50n':
        return Assets.images.mist;
      default:
        return Assets.images.clearSkyDay;
    }
  }
}
