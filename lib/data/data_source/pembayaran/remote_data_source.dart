import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PembayaranRemoteDataSource {
  Future<List<PembayaranModel>> getListPembayaran();
  Future<BaseResponse> terimaPembayaran({required int idPembayaran});
  Future<BaseResponse> tolakPembayaran(
      {required int idPembayaran, required String komentar});
  Future<BaseResponse> submitPembayaran(
      {required int idKost,
      required int idKostStok,
      required File buktiBayar,
      required int jumlahBayar,
      required String namaRekening,
      required String namaBank,
      required int toIdBank});
  Future<PembayaranModel> getDetailPembayaran({required int idPembayaran});
}

class PembayaranRemoteDataSourceImpl extends RemoteDataSource
    implements PembayaranRemoteDataSource {
  @override
  Future<List<PembayaranModel>> getListPembayaran() async {
    final response =
        await dio.get(ApiConstant.pembayaran, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List)
        .map((e) => PembayaranModel.fromJson(e))
        .toList()
        .cast<PembayaranModel>();
  }

  @override
  Future<BaseResponse> terimaPembayaran({required int idPembayaran}) async {
    final response = await dio.get(
        '${ApiConstant.pembayaranTerima}/$idPembayaran',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> tolakPembayaran(
      {required int idPembayaran, required String komentar}) async {
    final data = {'komentar': komentar};
    final response = await dio.post(
        '${ApiConstant.pembayaranTolak}/$idPembayaran',
        data: data,
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> submitPembayaran(
      {required int idKost,
      required int idKostStok,
      required File buktiBayar,
      required int jumlahBayar,
      required String namaRekening,
      required String namaBank,
      required int toIdBank}) async {
    final data = {
      'id_kost': idKost,
      'id_kost_stok': idKostStok,
      'bukti_bayar': await MultipartFile.fromFile(buktiBayar.path),
      'jumlah_bayar': jumlahBayar,
      'nama_rekening': namaRekening,
      'nama_bank': namaBank,
      'to_id_bank': toIdBank
    };

    final response = await dio.post(ApiConstant.pembayaranSubmit,
        data: FormData.fromMap(data), options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<PembayaranModel> getDetailPembayaran(
      {required int idPembayaran}) async {
    final response = await dio.get(
        "${ApiConstant.pembayaranDetail}/$idPembayaran",
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return PembayaranModel.fromJson(result.data);
  }
}
