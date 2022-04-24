import 'package:flutter/material.dart';
import 'package:flutter_appcare/route/route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'views/Login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: routes,
      builder: EasyLoading.init(),
    );
  }
}
