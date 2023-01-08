import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class UserRepository {
  Future<Either<WException, UserModel>> getProfile();
  Future<Either<WException, BaseResponse>> saveProfile(
      {required String nama, required String email, required String telepon});
  Future<Either<WException, BaseResponse>> savePassword(
      {required String passwordOld,
      required String passwordNew,
      required String passwordConfirmation});
}
