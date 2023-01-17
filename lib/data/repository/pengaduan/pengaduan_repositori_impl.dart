import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pengaduan/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';

class PengaduanRepositoryImpl implements PengaduanRepository {
  final PengaduanRemoteDataSource remoteDataSource;

  PengaduanRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<PengaduanModel>>> getListPengaduan() async {
    try {
      final response = await remoteDataSource.getListPengaduan();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, PengaduanModel>> getDetailPengaduan(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getDetailPengaduan(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi}) async {
    try {
      final response = await remoteDataSource.kirimPekerja(
          idPengaduan: idPengaduan, idPekerja: idPekerja, durasi: durasi);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, PengaduanModel>> getDetailPengaduanV2(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getDetailPengaduanV2(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> submitPengaduan(
      {required int idKost,
      required int idKostStok,
      required String judul,
      required String deskripsi,
      required File fotoPengaduan}) async {
    try {
      final response = await remoteDataSource.submitPengaduan(
          idKost: idKost,
          idKostStok: idKostStok,
          judul: judul,
          deskripsi: deskripsi,
          fotoPengaduan: fotoPengaduan);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
