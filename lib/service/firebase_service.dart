import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_installations/firebase_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:skripsi_wap/config/injection.dart';

class FirebaseService {
  FirebaseService._();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static FirebaseService get instance => FirebaseService._();

  Future<String?> get token async =>
      await FirebaseMessaging.instance.getToken();

  Future<String?> get installationId async => await FirebaseInstallations.id;

  Future<void> get deleteToken async =>
      await FirebaseMessaging.instance.deleteToken();

  Future<void> init() async {
    await Firebase.initializeApp();
    await requestPermission();
  }

  Future<void> initNotification() async {
    ///! Receive data if opened from terminated  state
    final RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (remoteMessage != null) {
      log('message: $remoteMessage');
      selectNotification(
        json.encode(remoteMessage.data
          ..removeWhere((key, value) => key == 'android_channel_id')),
      );
    }

    ///! Foreground Handler
    FirebaseMessaging.onMessage.listen((message) async {});

    ///! Background Handler only
    FirebaseMessaging.onMessageOpenedApp.listen((message) => selectNotification(
          json.encode(message.data
            ..removeWhere((key, value) => key == 'android_channel_id')),
        ));

    ///! Background or Terminated Handler
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  Future<void> requestPermission() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: true,
        sound: true,
      );

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } catch (e) {
      // debugLog("error Firebase", error: e);
    }
  }

  void selectNotification(String? payload) async {}
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  // debugLog(message.toMap().toString());
  Injection.init();
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  FirebaseService.instance.selectNotification(notificationResponse.payload);
}
