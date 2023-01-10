import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class PengontrakRemoteDataSource {
  Future<List<PengontrakModel>> getListPengontrak();
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
}
