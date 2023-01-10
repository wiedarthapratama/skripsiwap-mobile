import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/config/assets.gen.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/master_viewmodel.dart';
import 'package:skripsi_wap/presentation/viewmodel/user/user_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/firebase_service.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 5
      ..connectionTimeout = const Duration(seconds: 20)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await FirebaseService.instance.init();
  await initializeDateFormatting('id');
  Injection.init();

  runApp(const MyApp());
}

void configureDepedencies() {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isNoInternet = false;
  StreamSubscription<bool>? subscription;
  final _appRouter = Injection.locator<AppRouter>();

  Stream<bool> customConnectionState() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        final serverLookUp =
            await InternetAddress.lookup('dev.myfashiongrosir.id');
        if ((serverLookUp.isNotEmpty &&
                serverLookUp[0].rawAddress.isNotEmpty) &&
            connectivityResult != ConnectivityResult.none) {
          yield true;
        } else {
          yield false;
        }
      } on SocketException catch (_) {
        yield false;
      }
    }
  }

  @override
  void initState() {
    FirebaseService.instance.initNotification();
    _checkConnection();
    // _initFirebase();
    // _initUnilink();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      subscription?.cancel();
    }
  }

  void _checkConnection() {
    subscription = customConnectionState().listen((val) async {
      if (val) {
        onConnected();
      } else {
        onNoInternet();
      }
    });
  }

  onNoInternet() async {
    if (!isNoInternet) {
      setState(() => isNoInternet = true);
      WModal.builder(NavigationService().navigationKey.currentContext,
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
          child: WBottomSheet(
            footer: WBottomSheetFooter(
                child: WPrimaryButton(title: 'Coba lagi', onTap: onRetry)),
            child: WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: WAssets.image.noInternet.image(
                      width: MediaQuery.of(NavigationService()
                                  .navigationKey
                                  .currentContext!)
                              .size
                              .width *
                          200 /
                          360,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  WSpacing.vertical.size32,
                  const Text(
                    'Yah, internetnya mati',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      'Cek koneksi Wi-Fi atau kuota internetmu dan coba lagi ya.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ));
    }
  }

  onConnected() async {
    if (isNoInternet) {
      Navigator.of(NavigationService().navigationKey.currentContext!).pop();
      setState(() => isNoInternet = false);
    }
  }

  onRetry() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none && isNoInternet) {
      setState(() => isNoInternet = false);
      Navigator.of(NavigationService().navigationKey.currentContext!).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MasterViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp.router(
          title: 'Game Consign',
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AutoRouterObserver()],
          ),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
              primarySwatch: WColors.primary,
              fontFamily: GoogleFonts.openSans().fontFamily,
              scaffoldBackgroundColor: WColors.bgGrey),
          builder: (ctx, child) {
            ScreenUtil.init(ctx,
                designSize: const Size(360, 720), minTextAdapt: true);

            return child!;
          },
          locale: const Locale('id'),
        ),
      ),
    );
  }
}
