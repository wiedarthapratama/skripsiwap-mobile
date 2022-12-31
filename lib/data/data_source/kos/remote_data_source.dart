import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRemoteDataSource {
  Future<List<KosHomeModel>> getListKos();
  Future<KosTipeModel> getDetailKos({required int idKosTipe});
  Future<List<KosModel>> getListKosOwner();
  Future<KosModel> geDetailKosOwner({required int idKos});
  Future<BaseResponse> saveKos(
      {required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<BaseResponse> updateKos(
      {required String idKos,
      required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<BaseResponse> deleteKos({required int idKos});
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

  @override
  Future<List<KosModel>> getListKosOwner() async {
    final response = await dio.get(ApiConstant.kos, options: await baseOption);

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

  @override
  Future<BaseResponse> saveKos(
      {required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap}) async {
    final data = <String, dynamic>{
      'judul': title,
      'deskripsi': description,
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
      'alamat': address,
    };

    if (urlGoogleMap != null) {
      data['link_maps'] = urlGoogleMap;
    }

    final response =
        await dio.post(ApiConstant.kos, data: data, options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return result;
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<KosModel> geDetailKosOwner({required int idKos}) async {
    final response =
        await dio.get('${ApiConstant.kos}/$idKos', options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return KosModel.fromJson(result.data);
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BaseResponse> updateKos(
      {required String idKos,
      required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap}) async {
    final data = <String, dynamic>{
      'judul': title,
      'deskripsi': description,
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
      'alamat': address,
    };

    if (urlGoogleMap != null) {
      data['link_maps'] = urlGoogleMap;
    }

    final response = await dio.post('${ApiConstant.kos}/$idKos',
        data: data, options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return result;
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BaseResponse> deleteKos({required int idKos}) async {
    final response = await dio.delete('${ApiConstant.kos}/$idKos',
        options: await baseOption);

    try {
      final result = BaseResponse.fromJson(response.data);
      return result;
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }
}
