import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<ProvinceModel>>> getProvince();
  Future<Either<Failure, List<CityModel>>> getCity({required int id});
  Future<Either<Failure, List<SubdistrictModel>>> getSubdistrict(
      {required int id});
  Future<Either<Failure, List<VillageModel>>> getVillage({required int id});
}
