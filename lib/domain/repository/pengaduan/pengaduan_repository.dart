import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengaduanRepository {
  Future<Either<WException, List<PengaduanModel>>> getListPengaduan();
  Future<Either<WException, PengaduanModel>> getDetailPengaduan(
      {required int id});
  Future<Either<WException, PengaduanModel>> getDetailPengaduanV2(
      {required int id});
  Future<Either<WException, BaseResponse>> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi});
  Future<Either<WException, BaseResponse>> submitPengaduan(
      {required int idKost,
      required int idKostStok,
      required String judul,
      required String deskripsi,
      required File fotoPengaduan});
}
