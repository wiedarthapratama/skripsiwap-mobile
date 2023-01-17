import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pembayaran/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pembayaran/pembayaran_repository.dart';
import 'package:skripsi_wap/util/util.dart';

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

  @override
  Future<Either<WException, BaseResponse>> submitPembayaran(
      {required int idKost,
      required int idKostStok,
      required File buktiBayar,
      required int jumlahBayar,
      required String namaRekening,
      required String namaBank,
      required int toIdBank}) async {
    try {
      final response = await remoteDataSource.submitPembayaran(
          idKost: idKost,
          idKostStok: idKostStok,
          buktiBayar: buktiBayar,
          jumlahBayar: jumlahBayar,
          namaRekening: namaRekening,
          namaBank: namaBank,
          toIdBank: toIdBank);

      return Right(response);
    } on DioError catch (e, __) {
      debugLog('message', error: e, stackTrace: __);
      return Left(e.exception);
    } catch (_, __) {
      debugLog('message', error: _, stackTrace: __);
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, PembayaranModel>> getDetailPembayaran(
      {required int idPembayaran}) async {
    try {
      final response = await remoteDataSource.getDetailPembayaran(
          idPembayaran: idPembayaran);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
