import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class AuthRepository {
  Future<Either<WException, AuthModel>> login(
      {required String email, required String password});
  Future<Either<WException, UserModel>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm});
  Future<Either<WException, AuthModel>> refresh();
  Future<Either<WException, bool>> registerAsOwner(
      {required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address});
  Future<Either<WException, BaseResponse>> saveOrUpdateToken();
  Future<Either<WException, BaseResponse>> logout();
}
