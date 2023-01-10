import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/auth/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/auth/auth_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await remoteDataSource.login(email: email, password: password);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, UserModel>> register(
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
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, AuthModel>> refresh() async {
    try {
      final response = await remoteDataSource.refresh();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, bool>> registerAsOwner(
      {required int provinceId,
      required int cityId,
      required int subdistrictId,
      required int villageId,
      required String address}) async {
    try {
      final response = await remoteDataSource.registerAsOwner(
          provinceId: provinceId,
          cityId: cityId,
          subdistrictId: subdistrictId,
          villageId: villageId,
          address: address);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
