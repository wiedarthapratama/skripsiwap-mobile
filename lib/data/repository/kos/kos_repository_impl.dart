import 'package:skripsi_wap/data/data_source/kos/remote_data_source.dart';
import 'package:skripsi_wap/data/exception/exception.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';

class KosRepositoryImpl implements KosRepository {
  final KosRemoteDataSource remoteDataSource;

  KosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<KosHomeModel>>> getListKos() async {
    try {
      final response = await remoteDataSource.getListKos();

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }

  @override
  Future<Either<Failure, KosTipeModel>> getDetailKos(
      {required int idKosTipe}) async {
    try {
      final response =
          await remoteDataSource.getDetailKos(idKosTipe: idKosTipe);

      return Right(response);
    } on WException catch (e) {
      return Left(BaseFailure(e.message, e.response?.statusCode ?? 500));
    } catch (_) {
      return const Left(BaseFailure('Terjadi Kesalahan', 500));
    }
  }
}
