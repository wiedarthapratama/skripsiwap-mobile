import 'package:skripsi_wap/data/data_source/kos/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';

class KosRepositoryImpl implements KosRepository {
  final KosRemoteDataSource remoteDataSource;

  KosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<KosModel>>> getListKos() async {
    try {
      final response = await remoteDataSource.getListKos();

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }
}
