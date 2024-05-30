import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:my_flutter_template_application/core/core.dart';
import 'package:nayef_common_data_toolkit/nayef_common_data_toolkit.dart';

const _defaultTimeOut = Duration(milliseconds: 120000);

class MainApiClient with DioMixin, FormUrlEncodedDio, MultiPartDio {
  MainApiClient({required String baseUrl}) {
    httpClientAdapter = IOHttpClientAdapter();
    options = _getDefaultBaseOptions(baseUrl);
    interceptors
      ..add(LoggerInterceptor())
      ..add(
        ResponseParser(
          errorResponseFactory: errorResponseFromDioException,
        ),
      )
      ..add(ResponseResolver());
  }

  BaseOptions _getDefaultBaseOptions(String baseUrl) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _defaultTimeOut,
      receiveTimeout: _defaultTimeOut,
      sendTimeout: _defaultTimeOut,
      contentType: Headers.jsonContentType,
    );
  }
}
