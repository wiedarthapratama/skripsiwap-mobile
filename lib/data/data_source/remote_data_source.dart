import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/config/env.dart';
import 'package:skripsi_wap/data/interceptor/interceptor.dart';
import 'package:skripsi_wap/service/storage_service.dart';

class RemoteDataSource {
  int get _timeout => 60000;

  Map<String, String> get baseHeader => {'Accept': 'application/json'};

  Future<Options> get baseOption async => Options(headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${await StorageService.get<String>(StorageKeyEnum.accessToken)}'
      });

  Dio get dio {
    var d = Dio(BaseOptions(
        baseUrl: Env.baseUrl,
        receiveTimeout: _timeout,
        connectTimeout: _timeout,
        sendTimeout: _timeout));

    if (Env.appDebug) {
      d.interceptors.add(WDebugInterceptor());
    }

    d.interceptors.add(WInterceptor());

    return d;
  }
}
