import 'package:flutter/material.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/internal/application.dart';
import 'package:list_view/util/pushes/push_notifications_manager.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsManager().init();
  return runApp(const Application());
}
