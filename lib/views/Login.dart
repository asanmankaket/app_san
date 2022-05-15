// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_appcare/configs/config.dart';
import 'package:flutter_appcare/views/page1.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool hidepassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    CheckToken1();
  }

  CheckToken1() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print(token);
    if (prefs.getString('token') != null) {
      headers?['Authorization'] = "bearer ${prefs.getString('token')}";
      Navigator.pushNamedAndRemoveUntil(
          context, "/Page1", (Route<dynamic> route) => false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 63, 217, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: username,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'username',
                                hintText: 'ชื่อผู้ใช้',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 1, 135, 197),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: password,
                              obscureText: hidepassword,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  labelText: 'password',
                                  hintText: 'รหัสผ่าน',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: (() {
                                        setState(() {
                                          hidepassword = !hidepassword;
                                        });
                                      }),
                                      icon: Icon(
                                        hidepassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 30,
                                        color: Colors.white,
                                      )))),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              print('เข้าสู่ระบบ');
                              await CheckLogin(
                                  username.text, password.text, context);
                              // Navigator.pushNamedAndRemoveUntil(context,
                              //     "/Page1", (Route<dynamic> route) => false);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 45, 134, 156),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              primary: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("สมัครสมาชิก");
                              // Navigator.pushNamed(context, "/PageOne");
                              // Navigator.pushNamed(context, "/PageOne");
                            },
                            child: Text('Register',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 45, 134, 156),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              primary: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ])),
          ),
        ));
  }
}

Future CheckLogin(String username, String password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://192.168.1.9:3000/api/customer/login');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({"username": username, "password": password}),
  )
      .then((req) async {
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('idm', data['id']);
      print('ข้อมูลid');
      print(prefs.get('idm'));
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Page1()),
          (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
    }
  });
}
