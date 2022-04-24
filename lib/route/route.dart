import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/Register.dart';
import 'package:flutter_appcare/views/page1.dart';
import 'package:flutter_appcare/views/Map.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => PageOne(),
  '/Page1': (context) => Page1(),
  '/Map': (context) => GoogleMaps(),
};
