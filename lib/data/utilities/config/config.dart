import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiConfig {
  String url = 'https://api.openweathermap.org';

  String id = '0be657d20ca56ff47ad380fece76cc3b';
}
