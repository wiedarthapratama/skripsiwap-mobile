import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class RegionRemoteDataSource {
  Future<List<ProvinceModel>> getProvince();
  Future<List<CityModel>> getCity({required int id});
  Future<List<SubdistrictModel>> getSubdistrict({required int id});
  Future<List<VillageModel>> getVillage({required int id});
}

class RegionRemoteDataSourceImpl extends RemoteDataSource
    implements RegionRemoteDataSource {
  @override
  Future<List<ProvinceModel>> getProvince() async {
    final response = await dio.get(ApiConstant.province,
        options: Options(headers: baseHeader));

    try {
      final result = BaseResponse.fromJson(response.data);

      return (result.data as List)
          .map((e) => ProvinceModel.fromJson(e))
          .toList()
          .cast<ProvinceModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<CityModel>> getCity({required int id}) async {
    final response = await dio.get(ApiConstant.city(id),
        options: Options(headers: baseHeader));

    try {
      final result = BaseResponse.fromJson(response.data);

      return (result.data as List)
          .map((e) => CityModel.fromJson(e))
          .toList()
          .cast<CityModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<SubdistrictModel>> getSubdistrict({required int id}) async {
    final response = await dio.get(ApiConstant.subdistrict(id),
        options: Options(headers: baseHeader));

    try {
      final result = BaseResponse.fromJson(response.data);

      return (result.data as List)
          .map((e) => SubdistrictModel.fromJson(e))
          .toList()
          .cast<SubdistrictModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<VillageModel>> getVillage({required int id}) async {
    final response = await dio.get(ApiConstant.village(id),
        options: Options(headers: baseHeader));

    try {
      final result = BaseResponse.fromJson(response.data);

      return (result.data as List)
          .map((e) => VillageModel.fromJson(e))
          .toList()
          .cast<VillageModel>();
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }
}
