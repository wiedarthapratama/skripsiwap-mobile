import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRepository {
  Future<Either<WException, List<KosHomeModel>>> getRecommendation();
  Future<Either<WException, List<KosModel>>> getListKos();
  Future<Either<WException, KosTipeModel>> getPengontrakDetailKos(
      {required int idKosTipe});
  Future<Either<WException, KosModel>> getDetailKos({required int idKos});
  Future<Either<WException, BaseResponse>> saveKos(
      {required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<Either<WException, BaseResponse>> updateKos(
      {required String idKos,
      required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<Either<WException, BaseResponse>> deleteKos({required int idKos});
  Future<Either<WException, BaseResponse>> saveKosTipe(
      {required int idKos,
      required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas,
      required bool perabot,
      required bool rumah,
      required bool kamarMandi,
      required bool listrik});
  Future<Either<WException, KosTipeModel>> getDetailKosTipe({required int id});
  Future<Either<WException, BaseResponse>> updateKosTipe(
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
      required bool listrik});
  Future<Either<WException, BaseResponse>> deleteKosTipe({required int id});
  Future<Either<WException, BaseResponse>> saveFotoTipe(
      {required int idKosTipe, required bool mainFoto, required File file});
  Future<Either<WException, KosSayaModel>> getKosSaya();
}
