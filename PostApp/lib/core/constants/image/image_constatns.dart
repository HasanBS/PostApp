//import 'package:flutter/material.dart';

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get iconLoti => toLotti('splash');

  String toLotti(String name) => 'assets/images/lottie/$name.json';
}
