import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getProfile();
}

class UserRemoteDataSourceImpl extends RemoteDataSource
    implements UserRemoteDataSource {
  @override
  Future<UserModel> getProfile() async {
    final response =
        await dio.get(ApiConstant.profile, options: await baseOption);

    return UserModel.fromJson(response.data);
  }
}
