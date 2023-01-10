import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pekerja/remote_data_souce.dart';
import 'package:skripsi_wap/data/model/pekerja/pekerja_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pekerja/pekerja_repository.dart';
import 'package:skripsi_wap/util/util.dart';

class PekerjaRepositoryImpl implements PekerjaRepository {
  final PekerjaRemoteDataSource remoteDataSource;

  PekerjaRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<PekerjaModel>>> getListPekerja() async {
    try {
      final response = await remoteDataSource.getListPekerja();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, PekerjaModel>> getDetailPekerja(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getDetailPekerja(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_, __) {
      debugLog('message', error: _, stackTrace: __);
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> save(
      {required String name,
      required String nohp,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    try {
      final response = await remoteDataSource.save(
          name: name,
          nohp: nohp,
          provinceId: provinceId,
          cityId: cityId,
          subdistrictId: subdistrictId,
          villageId: villageId,
          address: address);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> update(
      {required int idPekerja,
      required String name,
      required String nohp,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    try {
      final response = await remoteDataSource.update(
          idPekerja: idPekerja,
          name: name,
          nohp: nohp,
          provinceId: provinceId,
          cityId: cityId,
          subdistrictId: subdistrictId,
          villageId: villageId,
          address: address);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> delete(
      {required int idPekerja}) async {
    try {
      final response = await remoteDataSource.delete(idPekerja: idPekerja);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
