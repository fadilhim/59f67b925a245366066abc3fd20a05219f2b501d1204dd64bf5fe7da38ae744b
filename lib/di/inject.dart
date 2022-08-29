import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/di/inject.config.dart';

/// Manually inject the dependencies with GetIt.
///
/// Useful if you want to do field injection.
final inject = GetIt.instance;

/// Initialize and configure the dependencies of this app.
@InjectableInit(
  preferRelativeImports: false,
)
Future<void> configureDependencies() async =>
    $initGetIt(
      inject,
    );
