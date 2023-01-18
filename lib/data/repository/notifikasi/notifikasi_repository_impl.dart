import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/notifikasi/remote_data_source.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/notifikasi/notifikasi_repository.dart';

class NotifikasiRepositoryImpl implements NotifikasiRepository {
  final NotifikasiRemoteDataSource remoteDataSource;

  NotifikasiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<NotifikasiModel>>> getListNotifikasi() async {
    try {
      final response = await remoteDataSource.getListNotifikasi();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, int>> getNotificationCount() async {
    try {
      final response = await remoteDataSource.getNotificationCount();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> readNotification(
      {required int id}) async {
    try {
      final response = await remoteDataSource.readNotification(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
