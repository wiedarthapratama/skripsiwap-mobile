import 'package:skripsi_wap/data/data_source/user/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }
}
