import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengaduanRemoteDataSource {
  Future<List<PengaduanModel>> getListPengaduan();
  Future<PengaduanModel> getDetailPengaduan({required int id});
  Future<PengaduanModel> getDetailPengaduanV2({required int id});
  Future<BaseResponse> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi});
  Future<BaseResponse> submitPengaduan(
      {required int idKost,
      required int idKostStok,
      required String judul,
      required String deskripsi,
      required File fotoPengaduan});
}

class PengaduanRemoteDataSourceImpl extends RemoteDataSource
    implements PengaduanRemoteDataSource {
  @override
  Future<List<PengaduanModel>> getListPengaduan() async {
    final response =
        await dio.get(ApiConstant.pengaduan, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List)
        .map((e) => PengaduanModel.fromJson(e))
        .toList()
        .cast<PengaduanModel>();
  }

  @override
  Future<PengaduanModel> getDetailPengaduan({required int id}) async {
    final response = await dio.get('${ApiConstant.pengaduan}/$id',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return PengaduanModel.fromJson(result.data);
  }

  @override
  Future<BaseResponse> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi}) async {
    final data = <String, dynamic>{
      'id_pekerja': idPekerja,
      'durasi_pengerjaan': durasi
    };

    final response = await dio.post(
        '${ApiConstant.pengaduanKirimPekerja}/$idPengaduan',
        data: data,
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<PengaduanModel> getDetailPengaduanV2({required int id}) async {
    final response = await dio.get(
        '${ApiConstant.pengontrakPengaduanDetail}/$id',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return PengaduanModel.fromJson(result.data);
  }

  @override
  Future<BaseResponse> submitPengaduan(
      {required int idKost,
      required int idKostStok,
      required String judul,
      required String deskripsi,
      required File fotoPengaduan}) async {
    final data = {
      'id_kost': idKost,
      'id_kost_stok': idKostStok,
      'judul': judul,
      'deskripsi': deskripsi,
      'foto_pengaduan': await MultipartFile.fromFile(fotoPengaduan.path)
    };
    final response = await dio.post(ApiConstant.pengaduanSubmit,
        data: FormData.fromMap(data), options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
