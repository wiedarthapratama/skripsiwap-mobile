import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengaduanRemoteDataSource {
  Future<List<PengaduanModel>> getListPengaduan();
  Future<PengaduanModel> getDetailPengaduan({required int id});
  Future<BaseResponse> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi});
}

class PengaduanRemoteDataSourceImpl extends RemoteDataSource
    implements PengaduanRemoteDataSource {
  @override
  Future<List<PengaduanModel>> getListPengaduan() async {
    final response =
        await dio.get(ApiConstant.pengaduan, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List)
        .map((e) => PengaduanModel.fromJson(e))
        .toList()
        .cast<PengaduanModel>();
  }

  @override
  Future<PengaduanModel> getDetailPengaduan({required int id}) async {
    final response = await dio.get('${ApiConstant.pengaduan}/$id',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return PengaduanModel.fromJson(result.data);
  }

  @override
  Future<BaseResponse> kirimPekerja(
      {required int idPengaduan,
      required int idPekerja,
      required String durasi}) async {
    final data = <String, dynamic>{
      'id_pekerja': idPekerja,
      'durasi_pengerjaan': durasi
    };

    final response = await dio.post(
        '${ApiConstant.pengaduanKirimPekerja}/$idPengaduan',
        data: data,
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
