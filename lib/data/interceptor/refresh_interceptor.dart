part of 'interceptor.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  RefreshTokenInterceptor({required this.dio});
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      /* final AuthRepository repository = Injection.locator<AuthRepository>();
      final response = await repository.refresh();
      final data = response.fold((l) => null, (r) => r);

      if (response.isRight() && data != null) {
        final RequestOptions requestOptions = err.response!.requestOptions;
        await StorageService.set<String>(
            StorageKeyEnum.accessToken, data.token.accessToken);

        final retry = await dio.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer ${await StorageService.get<String>(StorageKeyEnum.accessToken)}',
            'apikey': Env.apiKey
          }),
        );

        handler.resolve(retry);
      } */
    }

    handler.reject(err);
  }
}
