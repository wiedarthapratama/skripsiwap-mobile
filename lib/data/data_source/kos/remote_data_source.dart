import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRemoteDataSource {
  Future<List<KosHomeModel>> getRecommendation({
    required String nama,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
  });
  Future<List<KosModel>> getListKos();
  Future<KosTipeModel> getPengontrakDetailKos({required int idKosTipe});
  Future<KosModel> getDetailKos({required int idKos});
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
  Future<BaseResponse> saveKosTipe({
    required int idKos,
    required String namaTipe,
    required String jumlahKos,
    required String harga,
    required String jumlahRuang,
    required String luas,
    required bool perabot,
    required bool rumah,
    required bool kamarMandi,
    required bool listrik,
  });
  Future<KosTipeModel> getDetailKosTipe({required int id});
  Future<BaseResponse> updateKosTipe({
    required int idKosTipe,
    required int idKos,
    required String namaTipe,
    required String jumlahKos,
    required String harga,
    required String jumlahRuang,
    required String luas,
    required bool perabot,
    required bool rumah,
    required bool kamarMandi,
    required bool listrik,
  });
  Future<BaseResponse> deleteKosTipe({required int id});
  Future<BaseResponse> saveFotoTipe(
      {required int idKosTipe, required bool mainFoto, required File file});
  Future<KosSayaModel> getKosSaya();
}

class KosRemoteDataSourceImpl extends RemoteDataSource
    implements KosRemoteDataSource {
  @override
  Future<List<KosHomeModel>> getRecommendation({
    required String nama,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
  }) async {
    final data = {
      'nama': nama,
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
    };
    final response = await dio.post(ApiConstant.pengontrakHome,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return (result.data as List)
        .map((e) => KosHomeModel.fromJson(e))
        .toList()
        .cast<KosHomeModel>();
  }

  @override
  Future<KosTipeModel> getPengontrakDetailKos({required int idKosTipe}) async {
    final data = {'id_kost_tipe': idKosTipe};

    final response = await dio.post(ApiConstant.pengontrakKosDetail,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return KosTipeModel.fromJson(result.data);
  }

  @override
  Future<List<KosModel>> getListKos() async {
    final response = await dio.get(ApiConstant.kos, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return (result.data as List)
        .map((e) => KosModel.fromJson(e))
        .toList()
        .cast<KosModel>();
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
    final result = BaseResponse.fromJson(response.data);
    return result;
  }

  @override
  Future<KosModel> getDetailKos({required int idKos}) async {
    final response =
        await dio.get('${ApiConstant.kos}/$idKos', options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return KosModel.fromJson(result.data);
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
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> deleteKos({required int idKos}) async {
    final response = await dio.delete('${ApiConstant.kos}/$idKos',
        options: await baseOption);

    final result = BaseResponse.fromJson(response.data);
    return result;
  }

  @override
  Future<BaseResponse> saveKosTipe(
      {required int idKos,
      required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas,
      required bool perabot,
      required bool rumah,
      required bool kamarMandi,
      required bool listrik}) async {
    final data = <String, dynamic>{
      'id_kost': idKos,
      'jumlah_kontrakan': jumlahKos,
      'harga_per_bulan': harga,
      'jumlah_ruang': jumlahRuang,
      'is_perabot': perabot ? 1 : 0,
      'is_rumah': rumah ? 1 : 0,
      'is_kamar_mandi_dalam': kamarMandi ? 1 : 0,
      'is_listrik': listrik ? 1 : 0,
      'luas': luas,
      'nama_tipe': namaTipe,
    };
    final response = await dio.post(ApiConstant.kosTipe,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<KosTipeModel> getDetailKosTipe({required int id}) async {
    final response =
        await dio.get('${ApiConstant.kosTipe}/$id', options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return KosTipeModel.fromJson(result.data);
  }

  @override
  Future<BaseResponse> updateKosTipe(
      {required int idKosTipe,
      required int idKos,
      required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas,
      required bool perabot,
      required bool rumah,
      required bool kamarMandi,
      required bool listrik}) async {
    final data = <String, dynamic>{
      'id_kost': idKos,
      'jumlah_kontrakan': jumlahKos,
      'harga_per_bulan': harga,
      'jumlah_ruang': jumlahRuang,
      'is_perabot': perabot ? 1 : 0,
      'is_rumah': rumah ? 1 : 0,
      'is_kamar_mandi_dalam': kamarMandi ? 1 : 0,
      'is_listrik': listrik ? 1 : 0,
      'luas': luas,
      'nama_tipe': namaTipe,
    };
    final response = await dio.post('${ApiConstant.kosTipe}/$idKosTipe',
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> deleteKosTipe({required int id}) async {
    final response = await dio.delete('${ApiConstant.kosTipe}/$id',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> saveFotoTipe(
      {required int idKosTipe,
      required bool mainFoto,
      required File file}) async {
    final data = FormData.fromMap({
      'id_kost_jenis': idKosTipe,
      'main_foto': mainFoto ? 1 : 0,
      'foto': MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last)
    });
    final response = await dio.post(ApiConstant.kosFoto,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<KosSayaModel> getKosSaya() async {
    final response =
        await dio.get(ApiConstant.pengontrakKosSaya, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return KosSayaModel.fromJson(result.data);
  }
}
