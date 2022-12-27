import 'package:get_it/get_it.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/data/data_source/auth/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/kos/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/user/remote_data_source.dart';
import 'package:skripsi_wap/data/repository/auth/auth_repository_impl.dart';
import 'package:skripsi_wap/data/repository/kos/kos_repository_impl.dart';
import 'package:skripsi_wap/data/repository/user/user_repository_impl.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';

class Injection {
  static GetIt get locator => GetIt.instance;

  static void init() {
    //! Router
    locator.registerSingleton<AppRouter>(AppRouter());

    //! Register Repository
    locator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<KosRepository>(
        () => KosRepositoryImpl(remoteDataSource: locator()));

    //! Register Remote Data Source
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
    locator.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl());
    locator.registerLazySingleton<KosRemoteDataSource>(
        () => KosRemoteDataSourceImpl());
  }
}
