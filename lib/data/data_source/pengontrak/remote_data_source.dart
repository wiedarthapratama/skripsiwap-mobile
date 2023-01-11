import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pendaftaran/pendaftaran_model.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengontrakRemoteDataSource {
  Future<List<PengontrakModel>> getListPengontrak();
  Future<List<PendaftaranModel>> getListCalonPengontrak();
  Future<BaseResponse> terimaPendaftaran(
      {required int idPendaftaran, required String nomorKost});
}

class PengontrakRemoteDataSourceImpl extends RemoteDataSource
    implements PengontrakRemoteDataSource {
  @override
  Future<List<PengontrakModel>> getListPengontrak() async {
    final response =
        await dio.get(ApiConstant.pengontrak, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List)
        .map((e) => PengontrakModel.fromJson(e))
        .toList()
        .cast<PengontrakModel>();
  }

  @override
  Future<List<PendaftaranModel>> getListCalonPengontrak() async {
    final response =
        await dio.get(ApiConstant.pendaftaran, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List)
        .map((e) => PendaftaranModel.fromJson(e))
        .toList()
        .cast<PendaftaranModel>();
  }

  @override
  Future<BaseResponse> terimaPendaftaran(
      {required int idPendaftaran, required String nomorKost}) async {
    final data = {'nomor_kost': nomorKost};

    final response = await dio.post(
        '${ApiConstant.pendaftaranTerima}/$idPendaftaran',
        data: data,
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
