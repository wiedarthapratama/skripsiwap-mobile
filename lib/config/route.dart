import 'package:auto_route/auto_route.dart';
import 'package:skripsi_wap/presentation/screen/auth/login/login_screen.dart';
import 'package:skripsi_wap/presentation/screen/auth/register/register_screen.dart';
import 'package:skripsi_wap/presentation/screen/daftar_pemilik/daftar_pemilik_screen.dart';
import 'package:skripsi_wap/presentation/screen/home/home_screen.dart';
import 'package:skripsi_wap/presentation/screen/notifikasi/notifikasi_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/bank/bank_form_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/bank/bank_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/calon_pengontrak/calon_pengontrak_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/kos/kos_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/kos/kos_form_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/kos/kos_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/kos/tipe/kos_tipe_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/kos/tipe/kos_tipe_form_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pekerja/pekerja_form_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pekerja/pekerja_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pembayaran/pembayaran_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pemilik_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pengaduan/pengaduan_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pengaduan/pengaduan_screen.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pengontrak/pengontrak_screen.dart';
import 'package:skripsi_wap/presentation/screen/pengontrak_pengaduan/pengaduan_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/pengontrak_pengaduan/pengaduan_screen.dart';
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
        path: PengontrakPengaduanScreen.name,
        page: PengontrakPengaduanScreen,
      ),
      AutoRoute(
        path: PengontrakPengaduanDetailScreen.name,
        page: PengontrakPengaduanDetailScreen,
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
      AutoRoute(
        path: PemilikScreen.name,
        page: PemilikScreen,
      ),
      AutoRoute(
        path: KosScreen.name,
        page: KosScreen,
      ),
      AutoRoute(
        path: KosFormScreen.name,
        page: KosFormScreen,
      ),
      AutoRoute(
        path: KosDetailScreen.name,
        page: KosDetailScreen,
      ),
      AutoRoute(
        path: KosTipeFormScreen.name,
        page: KosTipeFormScreen,
      ),
      AutoRoute(
        path: KosTipeDetailScreen.name,
        page: KosTipeDetailScreen,
      ),
      AutoRoute(
        path: PekerjaScreen.name,
        page: PekerjaScreen,
      ),
      AutoRoute(
        path: PekerjaFormScreen.name,
        page: PekerjaFormScreen,
      ),
      AutoRoute(
        path: PengontrakScreen.name,
        page: PengontrakScreen,
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
        path: PembayaranScreen.name,
        page: PembayaranScreen,
      ),
      AutoRoute(
        path: CalonPengontrakScreen.name,
        page: CalonPengontrakScreen,
      ),
      AutoRoute(
        path: BankScreen.name,
        page: BankScreen,
      ),
      AutoRoute(
        path: BankFormScreen.name,
        page: BankFormScreen,
      ),
    ])
class $AppRouter {}
