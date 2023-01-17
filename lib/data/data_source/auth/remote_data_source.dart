import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/service/firebase_service.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});
  Future<UserModel> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm});
  Future<AuthModel> refresh();
  Future<bool> registerAsOwner(
      {required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address});
  Future<BaseResponse> saveOrUpdateToken();
  Future<BaseResponse> logout();
}

class AuthRemoteDataSourceImpl extends RemoteDataSource
    implements AuthRemoteDataSource {
  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    final data = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final response = await dio.post(ApiConstant.login,
        data: data, options: Options(headers: baseHeader));
    final result = BaseResponse.fromJson(response.data);
    return AuthModel.fromJson(result.data);
  }

  @override
  Future<UserModel> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm}) async {
    final data = <String, dynamic>{
      'name': name,
      'email': email,
      'nohp': phone,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
    final response = await dio.post(ApiConstant.register,
        data: data, options: Options(headers: baseHeader));

    return UserModel.fromJson(response.data['user']);
  }

  @override
  Future<AuthModel> refresh() async {
    final response = await dio.get(ApiConstant.refreshToken,
        options: Options(headers: baseHeader));
    final result = BaseResponse.fromJson(response.data);
    return AuthModel.fromJson(result.data);
  }

  @override
  Future<bool> registerAsOwner(
      {required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    final data = <String, dynamic>{
      'id_provinsi': provinceId,
      'id_kabupaten': cityId,
      'id_kecamatan': subdistrictId,
      'id_desa': villageId,
      'alamat': address
    };
    final response = await dio.post(ApiConstant.pemilik,
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);
    return result.isSuccess;
  }

  @override
  Future<BaseResponse> saveOrUpdateToken() async {
    final data = <String, dynamic>{
      'fcm_id': await FirebaseService.instance.installationId,
      'fcm_token': await FirebaseService.instance.token,
    };

    final response = await dio.post(ApiConstant.saveOrUpdateToken,
        data: data, options: await baseOption);

    return BaseResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse> logout() async {
    final response =
        await dio.get(ApiConstant.logout, options: await baseOption);

    return BaseResponse.fromJson(response.data);
  }
}
