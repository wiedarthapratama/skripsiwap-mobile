import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';

abstract class KosRepository {
  Future<Either<Failure, List<KosHomeModel>>> getListKos();
  Future<Either<Failure, KosTipeModel>> getDetailKos({required int idKosTipe});
}
