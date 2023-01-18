import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class NotifikasiRepository {
  Future<Either<WException, List<NotifikasiModel>>> getListNotifikasi();
  Future<Either<WException, int>> getNotificationCount();
  Future<Either<WException, BaseResponse>> readNotification({required int id});
}
