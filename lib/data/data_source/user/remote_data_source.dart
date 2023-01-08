import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getProfile();

  Future<BaseResponse> saveProfile(
      {required String nama, required String email, required String telepon});

  Future<BaseResponse> savePassword(
      {required String passwordOld,
      required String passwordNew,
      required String passwordConfirmation});
}

class UserRemoteDataSourceImpl extends RemoteDataSource
    implements UserRemoteDataSource {
  @override
  Future<UserModel> getProfile() async {
    final response =
        await dio.get(ApiConstant.profile, options: await baseOption);

    return UserModel.fromJson(response.data);
  }

  @override
  Future<BaseResponse> saveProfile(
      {required String nama,
      required String email,
      required String telepon}) async {
    final data = <String, dynamic>{
      'name': nama,
      'email': email,
      'nohp': telepon
    };

    final response = await dio.post(ApiConstant.ubahProfile,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return result;
  }

  @override
  Future<BaseResponse> savePassword(
      {required String passwordOld,
      required String passwordNew,
      required String passwordConfirmation}) async {
    final data = <String, dynamic>{
      'password_lama': passwordOld,
      'password_baru': passwordNew,
      'password_konfirmasi': passwordConfirmation
    };

    final response = await dio.post(ApiConstant.ubahPassword,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return result;
  }
}
