import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/pendaftaran/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/pendaftaran/pendaftaran_repository.dart';

class PendaftaranRepositoryImpl implements PendaftaranRepository {
  final PendaftaranRemoteDataSource remoteDataSource;

  PendaftaranRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, BaseResponse>> submitPendaftaran(
      {required int idKost,
      required int idKostStok,
      required File fotoKtp,
      required File fotoPribadi,
      required File fotoKk,
      required String tanggalMulai}) async {
    try {
      final response = await remoteDataSource.submitPendaftaran(
          idKost: idKost,
          idKostStok: idKostStok,
          fotoKtp: fotoKtp,
          fotoPribadi: fotoPribadi,
          fotoKk: fotoKk,
          tanggalMulai: tanggalMulai);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
