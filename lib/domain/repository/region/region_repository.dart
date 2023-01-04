import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';

abstract class RegionRepository {
  Future<Either<WException, List<ProvinceModel>>> getProvince();
  Future<Either<WException, List<CityModel>>> getCity({required int id});
  Future<Either<WException, List<SubdistrictModel>>> getSubdistrict(
      {required int id});
  Future<Either<WException, List<VillageModel>>> getVillage({required int id});
}
