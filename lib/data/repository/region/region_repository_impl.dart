import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/region/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/domain/repository/region/region_repository.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSource remoteDataSource;

  RegionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, List<ProvinceModel>>> getProvince() async {
    try {
      final response = await remoteDataSource.getProvince();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<CityModel>>> getCity({required int id}) async {
    try {
      final response = await remoteDataSource.getCity(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<SubdistrictModel>>> getSubdistrict(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getSubdistrict(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, List<VillageModel>>> getVillage(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getVillage(id: id);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
