import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/data_source/auth/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await remoteDataSource.login(email: email, password: password);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm}) async {
    try {
      final response = await remoteDataSource.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
          passwordConfirm: passwordConfirm);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }
}
