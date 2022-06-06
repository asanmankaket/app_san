import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/Register.dart';
import 'package:flutter_appcare/views/booking.dart';
import 'package:flutter_appcare/views/Map.dart';

import '../views/mainpage.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => PageOne(),
  '/MainPage': (context) => MainPage(),
  '/Map': (context) => GoogleMaps(),
  '/book': (context) => Booking(),
};
