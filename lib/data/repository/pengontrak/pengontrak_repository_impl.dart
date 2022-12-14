import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pengontrak/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pendaftaran/pendaftaran_model.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pengontrak/pengontrak_repository.dart';

class PengontrakRepositoryImpl implements PengontrakRepository {
  final PengontrakRemoteDataSource remoteDataSource;

  PengontrakRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<PengontrakModel>>> getListPengontrak() async {
    try {
      final response = await remoteDataSource.getListPengontrak();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<PendaftaranModel>>>
      getListCalonPengontrak() async {
    try {
      final response = await remoteDataSource.getListCalonPengontrak();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> terimaCalonPengontrak(
      {required int idPendaftaran, required String nomorKost}) async {
    try {
      final response = await remoteDataSource.terimaPendaftaran(
          idPendaftaran: idPendaftaran, nomorKost: nomorKost);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
