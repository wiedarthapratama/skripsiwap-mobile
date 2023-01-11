import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PembayaranRepository {
  Future<Either<WException, List<PembayaranModel>>> getListPembayaran();
  Future<Either<WException, BaseResponse>> terimaPembayaran(
      {required int idPembayaran});
  Future<Either<WException, BaseResponse>> tolakPembayaran(
      {required int idPembayaran, required String komentar});
}
