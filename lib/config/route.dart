import 'package:auto_route/auto_route.dart';
import 'package:skripsi_wap/presentation/screen/auth/login/login_screen.dart';
import 'package:skripsi_wap/presentation/screen/auth/register/register_screen.dart';
import 'package:skripsi_wap/presentation/screen/daftar_pemilik/daftar_pemilik_screen.dart';
import 'package:skripsi_wap/presentation/screen/home/home_screen.dart';
import 'package:skripsi_wap/presentation/screen/notifikasi/notifikasi_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_screen.dart';
import 'package:skripsi_wap/presentation/screen/pengaduan/pengaduan_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/pengaduan/pengaduan_screen.dart';
import 'package:skripsi_wap/presentation/screen/splash/splash_screen.dart';
import 'package:skripsi_wap/presentation/screen/ubah_password/ubah_password_screen.dart';
import 'package:skripsi_wap/presentation/screen/ubah_profile/ubah_profile_screen.dart';
import 'package:skripsi_wap/presentation/screen/detail_kost/detail_kost_screen.dart';
import 'package:skripsi_wap/presentation/screen/pendaftaran/pendaftaran_screen.dart';

@CustomAutoRouter(
    preferRelativeImports: false,
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 200,
    replaceInRouteName: 'Screen,Route',
    routes: [
      AutoRoute(
        path: SplashScreen.name,
        page: SplashScreen,
        initial: true,
      ),
      AutoRoute(
        path: LoginScreen.name,
        page: LoginScreen,
      ),
      AutoRoute(
        path: RegisterScreen.name,
        page: RegisterScreen,
      ),
      AutoRoute(
        path: HomeScreen.name,
        page: HomeScreen,
      ),
      AutoRoute(
        path: PaymentScreen.name,
        page: PaymentScreen,
      ),
      AutoRoute(
        path: PaymentDetailScreen.name,
        page: PaymentDetailScreen,
      ),
      AutoRoute(
        path: PengaduanScreen.name,
        page: PengaduanScreen,
      ),
      AutoRoute(
        path: PengaduanDetailScreen.name,
        page: PengaduanDetailScreen,
      ),
      AutoRoute(
        path: UbahProfileScreen.name,
        page: UbahProfileScreen,
      ),
      AutoRoute(
        path: UbahPasswordScreen.name,
        page: UbahPasswordScreen,
      ),
      AutoRoute(
        path: NotifikasiScreen.name,
        page: NotifikasiScreen,
      ),
      AutoRoute(
        path: DetailKostScreen.name,
        page: DetailKostScreen,
      ),
      AutoRoute(
        path: PendaftaranScreen.name,
        page: PendaftaranScreen,
      ),
      AutoRoute(
        path: DaftarPemilikScreen.name,
        page: DaftarPemilikScreen,
      ),
    ])
class $AppRouter {}
