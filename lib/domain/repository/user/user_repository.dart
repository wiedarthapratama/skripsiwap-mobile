import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getProfile();
}
