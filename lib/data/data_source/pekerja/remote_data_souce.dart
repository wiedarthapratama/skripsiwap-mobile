import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pekerja/pekerja_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PekerjaRemoteDataSource {
  Future<List<PekerjaModel>> getListPekerja();
  Future<PekerjaModel> getDetailPekerja({required int id});
  Future<BaseResponse> save({
    required String name,
    required String nohp,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
    required String address,
  });
  Future<BaseResponse> update({
    required int idPekerja,
    required String name,
    required String nohp,
    required int provinceId,
    required int cityId,
    required int subdistrictId,
    required int villageId,
    required String address,
  });
  Future<BaseResponse> delete({
    required int idPekerja,
  });
}

class PekerjaRemoteDataSourceImpl extends RemoteDataSource
    implements PekerjaRemoteDataSource {
  @override
  Future<List<PekerjaModel>> getListPekerja() async {
    final response =
        await dio.get(ApiConstant.pekerja, options: await baseOption);

    return (response.data['data'] as List)
        .map((e) => PekerjaModel.fromJson(e))
        .toList()
        .cast<PekerjaModel>();
  }

  @override
  Future<PekerjaModel> getDetailPekerja({required int id}) async {
    final response =
        await dio.get('${ApiConstant.pekerja}/$id', options: await baseOption);

    return PekerjaModel.fromJson(response.data['data']);
  }

  @override
  Future<BaseResponse> save(
      {required String name,
      required String nohp,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    final data = <String, dynamic>{
      'nama': name,
      'nohp': nohp,
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
      'alamat': address,
    };

    final response = await dio.post(ApiConstant.pekerja,
        data: data, options: await baseOption);

    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> update(
      {required int idPekerja,
      required String name,
      required String nohp,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    final data = <String, dynamic>{
      'nama': name,
      'nohp': nohp,
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
      'alamat': address,
    };

    final response = await dio.post('${ApiConstant.pekerja}/$idPekerja',
        data: data, options: await baseOption);

    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> delete({required int idPekerja}) async {
    final response = await dio.delete('${ApiConstant.pekerja}/$idPekerja',
        options: await baseOption);

    return BaseResponse.fromJson(response.data);
  }
}
