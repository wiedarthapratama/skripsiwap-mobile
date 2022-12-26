part of 'interceptor.dart';

class WDebugInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headers = "";
    options.headers.forEach((key, value) {
      headers += "| $key: $value";
    });

    debugLog('''| [DIO] Request: ${options.method} ${options.uri}
| ${(options.data is FormData ? (options.data as FormData).fields : options.data).toString()}
| Headers:\n$headers''', type: Level.warning);

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugLog(
        "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}",
        type: Level.info);

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugLog("| [DIO] Error: ${err.error}: ${err.response.toString()}",
        type: Level.error, error: err);

    return handler.next(err);
  }
}
