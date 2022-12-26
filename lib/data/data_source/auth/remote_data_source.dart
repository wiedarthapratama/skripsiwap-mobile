import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});
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
}
