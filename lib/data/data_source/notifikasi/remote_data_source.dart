import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class NotifikasiRemoteDataSource {
  Future<List<NotifikasiModel>> getListNotifikasi();
  Future<int> getNotificationCount();
  Future<BaseResponse> readNotification({required int id});
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

  @override
  Future<int> getNotificationCount() async {
    final response =
        await dio.get(ApiConstant.notifikasiCount, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result.data != null && result.data is int ? result.data : 0;
  }

  @override
  Future<BaseResponse> readNotification({required int id}) async {
    final response = await dio.get('${ApiConstant.notifikasiRead}/$id',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
