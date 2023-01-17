import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class BankRepository {
  Future<Either<WException, List<BankModel>>> getListBankPenyedia();
  Future<Either<WException, List<BankModel>>> getListBankPemilik(
      {required int idPemilik});
  Future<Either<WException, BankModel>> getDetailBankPenyedia(
      {required int id});
  Future<Either<WException, BaseResponse>> saveBankPenyedia(
      {required String namaBank,
      required String namaRekening,
      required String noRekening});
  Future<Either<WException, BaseResponse>> updateBankPenyedia(
      {required int id,
      required String namaBank,
      required String namaRekening,
      required String noRekening});
  Future<Either<WException, BaseResponse>> deleteBankPenyedia({
    required int id,
  });
}
