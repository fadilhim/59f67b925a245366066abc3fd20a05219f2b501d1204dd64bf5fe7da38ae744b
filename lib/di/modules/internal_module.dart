import 'package:injectable/injectable.dart';
import 'package:weather/presentation/routers/router.dart';

@module
abstract class InternalModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();
}
