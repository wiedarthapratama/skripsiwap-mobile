import 'package:get_it/get_it.dart';
import 'package:skripsi_wap/config/route.gr.dart';

class Injection {
  static GetIt get locator => GetIt.instance;

  static void init() {
    //! Router
    locator.registerSingleton<AppRouter>(AppRouter());
  }
}
