import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';
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
        final serverLookUp = await InternetAddress.lookup('game-consign.com');
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
      /* subscriptionGlobalConfig?.cancel();
      subscriptionUnilink?.cancel();
      subscriptionJailbreak?.cancel(); */
      // LocalStorageService.dispose();
    }
  }

  /* Future<void> _initUnilink() async {
    subscriptionUnilink = uriLinkStream.listen((uri) async {
      NavigationService().deepLinkRoute(uri);
    });
  }

  Future<void> _checkJbOrRoot() async {
    subscriptionJailbreak = _jailbreakState().listen((isRoot) {
      // await _initUnilink();

      if (isRoot && _appRouter.current.name != SplashRoute.name) {
        GCModal.show(
          NavigationService().currentContext,
          title: 'Maaf',
          message: 'Aplikasi ini tidak bisa diakses oleh ${Platform.isAndroid ? 'rooted' : 'jail break'} device',
          name: 'jailbreak',
          enableDrag: false,
          isDismissible: false,
          canDuplicate: false,
          alignment: CrossAxisAlignment.center,
          image: GCAsset.image.maintenance.image(
            width: 200.w,
            fit: BoxFit.fitWidth,
          ),
          button: PrimaryButton(
            title: 'Tutup',
            onTap: () {
              exit(0);
            },
          ),
        );
        return;
      }
    });
  }

  void _checkRemoteConfig() async {
    try {
      subscriptionGlobalConfig = _globalConfigState().listen((globalConfig) async {
        if (globalConfig == null) return;

        final packageInfo = await PackageInfo.fromPlatform();
        final int currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
        final int newVersion = globalConfig.buildNumber;
        if (currentVersion < newVersion) {
          GCModal.show(
            NavigationService().navigationKey.currentContext,
            title: 'Hai Pengguna Game Consign',
            message: 'Silahkan update aplikasi kamu ke versi terbaru :)',
            name: globalConfig.updateMode,
            enableDrag: false,
            isDismissible: false,
            alignment: CrossAxisAlignment.center,
            canDuplicate: false,
            image: GCAsset.image.maintenance.image(
              width: MediaQuery.of(NavigationService().navigationKey.currentContext!).size.width * 200 / 360,
              fit: BoxFit.fitWidth,
            ),
            button: PrimaryButton(
              title: 'Update',
              onTap: () {
                reviewApp();
              },
            ),
          );
          return;
        }
        globalConfig.removeModalUpdateMode();

        if (globalConfig.maintenance) {
          GCModal.show(NavigationService().navigationKey.currentContext,
              title: 'Hai Pengguna Game Consign',
              message: 'Maaf saat ini Game Consign sedang ada maintenance. Mohon Tunggu ya',
              name: globalConfig.maintenanceMode,
              enableDrag: false,
              isDismissible: false,
              isScrollControlled: true,
              alignment: CrossAxisAlignment.center,
              image: GCAsset.image.noInternet.image(
                width: MediaQuery.of(NavigationService().navigationKey.currentContext!).size.width * 200 / 360,
                fit: BoxFit.fitWidth,
              ),
              canDuplicate: false,
              onSubmit: () => exit(0));
          return;
        }
        globalConfig.removeModalMaintenanceMode();
      });
    } catch (e, stack) {
      debugLog('message', error: e, stackTrace: stack);
    }
  }
 */
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
      /* GCModal.builder(NavigationService().navigationKey.currentContext,
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
          child: GCBottomSheet(
            footer: GCBottomSheetFooter(
                child: PrimaryButton(title: 'Coba lagi', onTap: onRetry)),
            child: WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: GCAsset.image.noInternet.image(
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
                  const GCSpacingModal(),
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
          )); */
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
    return GestureDetector(
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
    );
  }
}

/* import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
  showFlutterNotification(message);
  debugPrint('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
 */