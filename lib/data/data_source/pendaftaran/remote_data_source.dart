import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PendaftaranRemoteDataSource {
  Future<BaseResponse> submitPendaftaran(
      {required int idKost,
      required int idKostStok,
      required File fotoKtp,
      required File fotoPribadi,
      required File fotoKk,
      required String tanggalMulai});
}

class PendaftaranRemoteDataSourceImpl extends RemoteDataSource
    implements PendaftaranRemoteDataSource {
  @override
  Future<BaseResponse> submitPendaftaran(
      {required int idKost,
      required int idKostStok,
      required File fotoKtp,
      required File fotoPribadi,
      required File fotoKk,
      required String tanggalMulai}) async {
    final data = {
      'id_kost': idKost,
      'id_kost_stok': idKostStok,
      'foto_ktp': await MultipartFile.fromFile(fotoKtp.path),
      'foto_pribadi': await MultipartFile.fromFile(fotoPribadi.path),
      'foto_kk': await MultipartFile.fromFile(fotoKk.path),
      'tanggal_mulai': tanggalMulai,
    };
    final response = await dio.post(ApiConstant.pendaftaranSubmit,
        data: FormData.fromMap(data), options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
