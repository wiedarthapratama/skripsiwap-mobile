import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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
    FirebaseMessaging.onMessage.listen((message) async {
      _handleNotification(message);
    });

    ///! Background Handler only
    FirebaseMessaging.onMessageOpenedApp.listen((message) => selectNotification(
          json.encode(message.data
            ..removeWhere((key, value) => key == 'android_channel_id')),
        ));

    ///! Background or Terminated Handler
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  void _handleNotification(RemoteMessage message) async {
    if (Platform.isAndroid) {
      RemoteNotification? notification = message.notification;
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      DarwinInitializationSettings initializationSettingsIos =
          DarwinInitializationSettings(
              requestSoundPermission: false,
              requestBadgePermission: false,
              requestAlertPermission: false,
              onDidReceiveLocalNotification: (id, title, body, payload) =>
                  selectNotification(
                    json.encode((message.data
                      ..removeWhere(
                          (key, value) => key == 'android_channel_id'))),
                  ));
      InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIos);
      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (response) =>
              selectNotification(response.payload),
          onDidReceiveBackgroundNotificationResponse:
              notificationTapBackground);

      if ((notification?.title ?? '').isEmpty ||
          notification?.title == null ||
          (notification?.body ?? '').isEmpty ||
          notification?.body == null) {
        return;
      }

      if (notification?.title != null ||
          (notification?.title ?? '').isNotEmpty) {
        await _flutterLocalNotificationsPlugin.show(
            message.hashCode,
            notification?.title,
            notification?.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    'com.example.skripsi_wap', 'Skripsi Wap',
                    channelDescription: 'Skripsi Wap',
                    playSound: true,
                    importance: Importance.max,
                    priority: Priority.high,
                    enableVibration: true,
                    styleInformation:
                        BigTextStyleInformation(notification?.body ?? '')),
                iOS: const DarwinNotificationDetails(
                    presentAlert: true,
                    presentBadge: true,
                    presentSound: true)),
            payload: json.encode((message.data
              ..removeWhere((key, value) => key == 'android_channel_id'))));
      }
    }
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
