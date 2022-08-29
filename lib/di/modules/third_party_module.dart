import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:weather/utilities/utilities.dart';

@module
abstract class ThirdPartyModule {
  Dio get dio => Dio()
    ..options.headers.addAll(<String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    })
    ..interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        logPrint: (log) {
          Fimber.d('$log');
        },
      ),
    )
    ..interceptors.add(
      RetryInterceptor(
        logPrint: (log) {
          Fimber.e('$log');
        },
      ),
    )
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(
            maxSize: 20971520,
            maxEntrySize: 1572864,
          ),
          allowPostMethod: true,
        ),
      ),
    );
}
