import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/config/env.dart';
import 'package:skripsi_wap/data/interceptor/interceptor.dart';
import 'package:skripsi_wap/service/storage_service.dart';

class RemoteDataSource {
  int get _timeout => 60000;

  String get apikey => Env.apiKey;

  Map<String, String> get baseHeader =>
      {'Accept': 'application/json', 'apikey': apikey};

  Future<Options> get baseOption async => Options(headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${await StorageService.get<String>(StorageKeyEnum.accessToken)}',
        'apikey': apikey
      });

  Dio get dio {
    var d = Dio(BaseOptions(
        baseUrl: Env.baseUrl,
        receiveTimeout: _timeout,
        connectTimeout: _timeout,
        sendTimeout: _timeout));

    d.interceptors.add(RefreshTokenInterceptor(dio: d));

    if (Env.appDebug) {
      d.interceptors.add(WDebugInterceptor());
    }

    d.interceptors.add(WInterceptor());

    return d;
  }
}
