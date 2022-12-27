import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRemoteDataSource {
  Future<List<KosModel>> getListKos();
}

class KosRemoteDataSourceImpl extends RemoteDataSource
    implements KosRemoteDataSource {
  @override
  Future<List<KosModel>> getListKos() async {
    final response =
        await dio.post(ApiConstant.pengontrakHome, options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return (result.data as List)
          .map((e) => KosModel.fromJson(e))
          .toList()
          .cast<KosModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }
}
