import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

abstract class UserRepository {
  Future<Either<WException, UserModel>> getProfile();
}
