import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static const Color _textColorStrong = Colors.black;
  static const Color _textColorDefault = Colors.black;
  static const String fontNameDefault = 'Muli';
  static const navBarTitle = TextStyle(
    fontFamily: fontNameDefault,
  );
  static const headerLarge = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeLarge,
      color: _textColorStrong);
  static const textDefault = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeDefault,
      color: _textColorDefault);
}
