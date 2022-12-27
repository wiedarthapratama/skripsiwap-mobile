import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password});
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm});
}
