import 'package:auto_route/auto_route.dart';
import 'package:skripsi_wap/presentation/screen/auth/login/login_screen.dart';
import 'package:skripsi_wap/presentation/screen/auth/register/register_screen.dart';
import 'package:skripsi_wap/presentation/screen/home/home_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_detail_screen.dart';
import 'package:skripsi_wap/presentation/screen/payment/payment_screen.dart';
import 'package:skripsi_wap/presentation/screen/splash/splash_screen.dart';

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
    ])
class $AppRouter {}
