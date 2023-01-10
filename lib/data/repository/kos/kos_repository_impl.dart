import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/kos/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';

class KosRepositoryImpl implements KosRepository {
  final KosRemoteDataSource remoteDataSource;

  KosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<KosHomeModel>>> getRecommendation() async {
    try {
      final response = await remoteDataSource.getRecommendation();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<KosModel>>> getListKos() async {
    try {
      final response = await remoteDataSource.getListKos();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, KosTipeModel>> getPengontrakDetailKos(
      {required int idKosTipe}) async {
    try {
      final response =
          await remoteDataSource.getPengontrakDetailKos(idKosTipe: idKosTipe);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, KosModel>> getDetailKos(
      {required int idKos}) async {
    try {
      final response = await remoteDataSource.getDetailKos(idKos: idKos);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> saveKos(
      {required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap}) async {
    try {
      final response = await remoteDataSource.saveKos(
          title: title,
          description: description,
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
  Future<Either<WException, BaseResponse>> updateKos(
      {required String idKos,
      required String title,
      required String description,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address,
      String? urlGoogleMap}) async {
    try {
      final response = await remoteDataSource.updateKos(
          idKos: idKos,
          title: title,
          description: description,
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
  Future<Either<WException, BaseResponse>> deleteKos(
      {required int idKos}) async {
    try {
      final response = await remoteDataSource.deleteKos(idKos: idKos);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> saveKosTipe(
      {required int idKos,
      required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas,
      required bool perabot,
      required bool rumah,
      required bool kamarMandi,
      required bool listrik}) async {
    try {
      final response = await remoteDataSource.saveKosTipe(
          idKos: idKos,
          namaTipe: namaTipe,
          jumlahKos: jumlahKos,
          harga: harga,
          jumlahRuang: jumlahRuang,
          luas: luas,
          perabot: perabot,
          rumah: rumah,
          kamarMandi: kamarMandi,
          listrik: listrik);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, KosTipeModel>> getDetailKosTipe(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getDetailKosTipe(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> updateKosTipe(
      {required int idKosTipe,
      required int idKos,
      required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas,
      required bool perabot,
      required bool rumah,
      required bool kamarMandi,
      required bool listrik}) async {
    try {
      final response = await remoteDataSource.updateKosTipe(
          idKosTipe: idKosTipe,
          idKos: idKos,
          namaTipe: namaTipe,
          jumlahKos: jumlahKos,
          harga: harga,
          jumlahRuang: jumlahRuang,
          luas: luas,
          perabot: perabot,
          rumah: rumah,
          kamarMandi: kamarMandi,
          listrik: listrik);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> deleteKosTipe(
      {required int id}) async {
    try {
      final response = await remoteDataSource.deleteKosTipe(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> saveFotoTipe(
      {required int idKosTipe,
      required bool mainFoto,
      required File file}) async {
    try {
      final response = await remoteDataSource.saveFotoTipe(
          idKosTipe: idKosTipe, mainFoto: mainFoto, file: file);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, PengontrakModel>> getKosSaya() async {
    try {
      final response = await remoteDataSource.getKosSaya();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
