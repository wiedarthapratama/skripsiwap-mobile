import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/data_source/region/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/domain/repository/region/region_repository.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSource remoteDataSource;

  RegionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProvinceModel>>> getProvince() async {
    try {
      final response = await remoteDataSource.getProvince();

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> getCity({required int id}) async {
    try {
      final response = await remoteDataSource.getCity(id: id);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }

  @override
  Future<Either<Failure, List<SubdistrictModel>>> getSubdistrict(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getSubdistrict(id: id);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }

  @override
  Future<Either<Failure, List<VillageModel>>> getVillage(
      {required int id}) async {
    try {
      final response = await remoteDataSource.getVillage(id: id);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }
}
