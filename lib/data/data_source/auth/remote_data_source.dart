import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});
  Future<UserModel> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm});
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

    try {
      final result = BaseResponse.fromJson(response.data);
      return AuthModel.fromJson(result.data);
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
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

    try {
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      if (e is DioError) {
        throw WException(e);
      } else {
        throw ServerException();
      }
    }
  }
}
