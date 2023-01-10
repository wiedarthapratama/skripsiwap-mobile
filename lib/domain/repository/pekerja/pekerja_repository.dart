import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/pekerja/pekerja_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PekerjaRepository {
  Future<Either<WException, List<PekerjaModel>>> getListPekerja();
  Future<Either<WException, PekerjaModel>> getDetailPekerja({required int id});
  Future<Either<WException, BaseResponse>> save({
    required String name,
    required String nohp,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
    required String address,
  });
  Future<Either<WException, BaseResponse>> update({
    required int idPekerja,
    required String name,
    required String nohp,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
    required String address,
  });
  Future<Either<WException, BaseResponse>> delete({
    required int idPekerja,
  });
}
