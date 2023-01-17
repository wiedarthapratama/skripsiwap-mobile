import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/bank/remote_data_source.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/bank/bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  final BankRemoteDataSource remoteDataSource;

  BankRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<BankModel>>> getListBankPenyedia() async {
    try {
      final response = await remoteDataSource.getListBankPenyedia();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<BankModel>>> getListBankPemilik(
      {required int idPemilik}) async {
    try {
      final response =
          await remoteDataSource.getListBankPemilik(idPemilik: idPemilik);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BankModel>> getDetailBankPenyedia(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getDetailBankPenyedia(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> saveBankPenyedia(
      {required String namaBank,
      required String namaRekening,
      required String noRekening}) async {
    try {
      final response = await remoteDataSource.saveBankPenyedia(
          namaBank: namaBank,
          namaRekening: namaRekening,
          noRekening: noRekening);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> updateBankPenyedia(
      {required int id,
      required String namaBank,
      required String namaRekening,
      required String noRekening}) async {
    try {
      final response = await remoteDataSource.updateBankPenyedia(
          id: id,
          namaBank: namaBank,
          namaRekening: namaRekening,
          noRekening: noRekening);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> deleteBankPenyedia(
      {required int id}) async {
    try {
      final response = await remoteDataSource.deleteBankPenyedia(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
