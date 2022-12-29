import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRemoteDataSource {
  Future<List<KosHomeModel>> getListKos();
  Future<KosTipeModel> getDetailKos({required int idKosTipe});
}

class KosRemoteDataSourceImpl extends RemoteDataSource
    implements KosRemoteDataSource {
  @override
  Future<List<KosHomeModel>> getListKos() async {
    final response =
        await dio.post(ApiConstant.pengontrakHome, options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return (result.data as List)
          .map((e) => KosHomeModel.fromJson(e))
          .toList()
          .cast<KosHomeModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<KosTipeModel> getDetailKos({required int idKosTipe}) async {
    final data = {'id_kost_tipe': idKosTipe};

    final response = await dio.post(ApiConstant.pengontrakKosDetail,
        data: data, options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return KosTipeModel.fromJson(result.data);
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }
}
