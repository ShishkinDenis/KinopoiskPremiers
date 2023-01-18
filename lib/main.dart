import 'package:flutter/material.dart';
import 'package:list_view/di/locator.dart';
import 'package:list_view/internal/application.dart';

//TODO api request with detailed description
//TODO year
//TODO bloc implementation  for filmsDetails


void main() {
  configureDependencies();
  return runApp(const Application());
}
