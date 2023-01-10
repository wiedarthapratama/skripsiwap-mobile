import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';

abstract class PengontrakRepository {
  Future<Either<WException, List<PengontrakModel>>> getListPengontrak();
}
