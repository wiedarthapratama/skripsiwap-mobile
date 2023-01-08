import 'package:dio/dio.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/data/data_source/user/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/response/base_response.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<WException, UserModel>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> saveProfile(
      {required String nama,
      required String email,
      required String telepon}) async {
    try {
      final response = await remoteDataSource.saveProfile(
          nama: nama, email: email, telepon: telepon);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }

  @override
  Future<Either<WException, BaseResponse>> savePassword(
      {required String passwordOld,
      required String passwordNew,
      required String passwordConfirmation}) async {
    try {
      final response = await remoteDataSource.savePassword(
          passwordOld: passwordOld,
          passwordNew: passwordNew,
          passwordConfirmation: passwordConfirmation);

      return Right(response);
    } on DioError catch (e) {
      return Left(e.exception);
    } catch (_) {
      return const Left(WException.internalServerException());
    }
  }
}
