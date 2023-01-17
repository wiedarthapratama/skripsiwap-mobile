import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';

abstract class NotifikasiRepository {
  Future<Either<WException, List<NotifikasiModel>>> getListNotifikasi();
}
