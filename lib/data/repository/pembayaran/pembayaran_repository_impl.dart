import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pembayaran/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pembayaran/pembayaran_repository.dart';

class PembayaranRepositoryImpl implements PembayaranRepository {
  final PembayaranRemoteDataSource remoteDataSource;

  PembayaranRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<PembayaranModel>>> getListPembayaran() async {
    try {
      final response = await remoteDataSource.getListPembayaran();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> terimaPembayaran(
      {required int idPembayaran}) async {
    try {
      final response =
          await remoteDataSource.terimaPembayaran(idPembayaran: idPembayaran);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> tolakPembayaran(
      {required int idPembayaran, required String komentar}) async {
    try {
      final response = await remoteDataSource.tolakPembayaran(
          idPembayaran: idPembayaran, komentar: komentar);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
