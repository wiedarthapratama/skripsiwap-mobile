import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PendaftaranRepository {
  Future<Either<WException, BaseResponse>> submitPendaftaran(
      {required int idKost,
      required int idKostStok,
      required File fotoKtp,
      required File fotoPribadi,
      required File fotoKk,
      required String tanggalMulai});
}
