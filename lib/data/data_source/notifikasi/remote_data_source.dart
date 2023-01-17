import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';

abstract class NotifikasiRemoteDataSource {
  Future<List<NotifikasiModel>> getListNotifikasi();
}

class NotifikasiRemoteDataSourceImpl extends RemoteDataSource
    implements NotifikasiRemoteDataSource {
  @override
  Future<List<NotifikasiModel>> getListNotifikasi() async {
    final response =
        await dio.get(ApiConstant.notifikasi, options: await baseOption);

    return (response.data['data'] as List)
        .map((e) => NotifikasiModel.fromJson(e))
        .toList()
        .cast<NotifikasiModel>();
  }
}
