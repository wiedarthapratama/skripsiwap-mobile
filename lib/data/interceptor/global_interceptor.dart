part of 'interceptor.dart';

class WInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.reject(WException(err));
  }
}
