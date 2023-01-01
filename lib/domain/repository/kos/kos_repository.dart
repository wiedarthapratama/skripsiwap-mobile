import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class KosRepository {
  Future<Either<Failure, List<KosHomeModel>>> getListKos();
  Future<Either<Failure, KosTipeModel>> getDetailKos({required int idKosTipe});
  Future<Either<Failure, List<KosModel>>> getListKosOwner();
  Future<Either<Failure, KosModel>> geDetailKosOwner({required int idKos});
  Future<Either<Failure, BaseResponse>> saveKos(
      {required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<Either<Failure, BaseResponse>> updateKos(
      {required String idKos,
      required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap});
  Future<Either<Failure, BaseResponse>> deleteKos({required int idKos});
}
