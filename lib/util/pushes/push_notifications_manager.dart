import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:list_view/domain/enum/month.dart';
import 'package:list_view/util/strings.dart';

class PushNotificationsManager {
  static final PushNotificationsManager _instance = PushNotificationsManager._internal();

  factory PushNotificationsManager() {
    return _instance;
  }

  PushNotificationsManager._internal();

  late Month month;
  late String? token;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    Strings.channelId, // id
    Strings.channelTitle, // title
    description: Strings.channelDescription, // description
    importance: Importance.high,
  );

  late Function(Month month) onPushClick;

  Future<void> init() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  Future<void> listenToMessages(Function(Month month) onPushClick) async {
    this.onPushClick = onPushClick;
    _setupNotificationSettings();
    _listenNotificationFromTerminatedState();
    _listenNotificationFromForeground();
    _listenNotificationFromBackground();
    _getToken();
  }

  void _setupNotificationSettings() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(Strings.notificationIcon);
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
        onDidReceiveNotificationResponse: _onSelectNotification);
  }

  void _listenNotificationFromForeground() {
    FirebaseMessaging.onMessage.listen(_showNotification);
  }

  void _listenNotificationFromBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      month = getMonth(message);
      onPushClick(month);
    });
  }

  Future<void> _listenNotificationFromTerminatedState() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      month = getMonth(initialMessage);
      onPushClick(month);
    }
  }

  _getToken() async {
    token = await FirebaseMessaging.instance.getToken();
  }

  _onSelectNotification(NotificationResponse notificationResponse) async {
    onPushClick(month);
  }

  void _showNotification(RemoteMessage message) {
    month = getMonth(message);
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: Strings.notificationIcon,
            ),
          ));
    }
  }

  Month getMonth(RemoteMessage message) {
    return Month.values.byName(message.data[Strings.month] ?? Month.january.name);
  }
}
