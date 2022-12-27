import 'package:get_it/get_it.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/data/data_source/auth/remote_data_source.dart';
import 'package:skripsi_wap/data/repository/auth/auth_repository_impl.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';

class Injection {
  static GetIt get locator => GetIt.instance;

  static void init() {
    //! Router
    locator.registerSingleton<AppRouter>(AppRouter());

    locator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: locator()));

    //! Register Remote Data Source
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
  }
}
