import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/pendaftaran/pendaftaran_model.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengontrakRepository {
  Future<Either<WException, List<PengontrakModel>>> getListPengontrak();
  Future<Either<WException, List<PendaftaranModel>>> getListCalonPengontrak();
  Future<Either<WException, BaseResponse>> terimaCalonPengontrak(
      {required int idPendaftaran, required String nomorKost});
}
