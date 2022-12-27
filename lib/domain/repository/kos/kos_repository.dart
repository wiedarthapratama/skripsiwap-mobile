import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';

abstract class KosRepository {
  Future<Either<Failure, List<KosModel>>> getListKos();
}
