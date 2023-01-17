import 'package:get_it/get_it.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/data/data_source/auth/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/bank/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/kos/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/notifikasi/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/pekerja/remote_data_souce.dart';
import 'package:skripsi_wap/data/data_source/pembayaran/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/pendaftaran/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/pengaduan/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/pengontrak/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/region/remote_data_source.dart';
import 'package:skripsi_wap/data/data_source/user/remote_data_source.dart';
import 'package:skripsi_wap/data/repository/auth/auth_repository_impl.dart';
import 'package:skripsi_wap/data/repository/bank/bank_repository_impl.dart';
import 'package:skripsi_wap/data/repository/kos/kos_repository_impl.dart';
import 'package:skripsi_wap/data/repository/notifikasi/notifikasi_repository_impl.dart';
import 'package:skripsi_wap/data/repository/pekerja/pekerja_repository_impl.dart';
import 'package:skripsi_wap/data/repository/pembayaran/pembayaran_repository_impl.dart';
import 'package:skripsi_wap/data/repository/pendaftaran/pendaftaran_repository_impl.dart';
import 'package:skripsi_wap/data/repository/pengaduan/pengaduan_repositori_impl.dart';
import 'package:skripsi_wap/data/repository/pengontrak/pengontrak_repository_impl.dart';
import 'package:skripsi_wap/data/repository/region/region_repository_impl.dart';
import 'package:skripsi_wap/data/repository/user/user_repository_impl.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/domain/repository/bank/bank_repository.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/domain/repository/notifikasi/notifikasi_repository.dart';
import 'package:skripsi_wap/domain/repository/pekerja/pekerja_repository.dart';
import 'package:skripsi_wap/domain/repository/pembayaran/pembayaran_repository.dart';
import 'package:skripsi_wap/domain/repository/pendaftaran/pendaftaran_repository.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';
import 'package:skripsi_wap/domain/repository/pengontrak/pengontrak_repository.dart';
import 'package:skripsi_wap/domain/repository/region/region_repository.dart';
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
    locator.registerLazySingleton<RegionRepository>(
        () => RegionRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<PekerjaRepository>(
        () => PekerjaRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<PengontrakRepository>(
        () => PengontrakRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<PengaduanRepository>(
        () => PengaduanRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<PembayaranRepository>(
        () => PembayaranRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<BankRepository>(
        () => BankRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<NotifikasiRepository>(
        () => NotifikasiRepositoryImpl(remoteDataSource: locator()));
    locator.registerLazySingleton<PendaftaranRepository>(
        () => PendaftaranRepositoryImpl(remoteDataSource: locator()));

    //! Register Remote Data Source
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
    locator.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl());
    locator.registerLazySingleton<KosRemoteDataSource>(
        () => KosRemoteDataSourceImpl());
    locator.registerLazySingleton<RegionRemoteDataSource>(
        () => RegionRemoteDataSourceImpl());
    locator.registerLazySingleton<PekerjaRemoteDataSource>(
        () => PekerjaRemoteDataSourceImpl());
    locator.registerLazySingleton<PengontrakRemoteDataSource>(
        () => PengontrakRemoteDataSourceImpl());
    locator.registerLazySingleton<PengaduanRemoteDataSource>(
        () => PengaduanRemoteDataSourceImpl());
    locator.registerLazySingleton<PembayaranRemoteDataSource>(
        () => PembayaranRemoteDataSourceImpl());
    locator.registerLazySingleton<BankRemoteDataSource>(
        () => BankRemoteDataSourceImpl());
    locator.registerLazySingleton<NotifikasiRemoteDataSource>(
        () => NotifikasiRemoteDataSourceImpl());
    locator.registerLazySingleton<PendaftaranRemoteDataSource>(
        () => PendaftaranRemoteDataSourceImpl());
  }
}
