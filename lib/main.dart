import 'package:flutter/material.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/internal/application.dart';
import 'util/pushes/push_notifications_manager.dart';

//TODO api request with detailed description
//TODO year
//TODO bloc implementation  for filmsDetails

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsManager().init();
  return runApp(const Application());
}
