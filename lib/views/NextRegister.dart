// ignore_for_file: prefer_const_constructors, unused_element, avoid_print, duplicate_ignore, dead_code, deprecated_member_use, sized_box_for_whitespace, empty_catches, unused_local_variable

import 'dart:convert';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/textformfieldmodel.dart';
import 'package:flutter_appcare/views/mainpage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../configs/config.dart';
import 'nextRegister.dart';

class NextRegister extends StatefulWidget {
  NextRegister({Key? key}) : super(key: key);

  @override
  State<NextRegister> createState() => _Register();
}

class _Register extends State<NextRegister> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  File? file;

  DateTime? datenow = DateTime.now();

  String? DropdownValue = 'address';
  List<DropdownMenuItem<String>>? items = [
    const DropdownMenuItem(
      value: 'address',
      child: Text(
        'สถานที่',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // void newDate() async {
    //   DateTime? date = await showDatePicker(
    //       context: context,
    //       initialDate: datenow!,
    //       firstDate: DateTime(DateTime.now().year - 70),
    //       lastDate: DateTime(DateTime.now().year, DateTime.now().day));
    //   // firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
    //   // lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30),
    //   // );
    //   print(date);

    //   if (date != null) {
    //     setState(() {
    //       datenow = date;
    //       picdate.text = date.toString();
    //       picdate.text = DateFormat("dd/MM/yyyy").format(date);
    //     });
    //   }
    // }

    void newtime() async {
      TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          // picdate.text = date.toString();
          pictime.text = '${time.hour}:${time.minute}';
        });
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 94, 249),
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
        backgroundColor: Color.fromARGB(255, 160, 42, 207),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'โปรดกรอกหมายเลขโทรศัพท์';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    print(value);
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'เบอร์โทรศัพท์',
                    labelStyle: TextStyle(color: Colors.white),
                    helperText: 'Tyep you Usename for display',
                    hintText: 'เบอร์โทรศัพท์',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 240, 4, 4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(
                      Icons.add_call,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                // TextFormFieldModel(
                //   // key: _formkey,
                //   labeltext: 'Usename',
                //   controller: username,
                //   // as: 'ใส่ส่ะ',
                //   // validator:(String value){},
                // ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'โปรดกรอกหมายเลขบัตรประชาชน';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    print(value);
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'หมายเลขบัตรประชาชน',
                    labelStyle: TextStyle(color: Colors.white),
                    helperText: 'Tyep you password more 6 Charactor',
                    hintText: 'หมายเลขบัตรประชาชน',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 240, 4, 4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(
                      Icons.assignment_ind,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                // TextFormFieldModel(
                //   labeltext: 'password',
                //   controller: password,
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 36.0,
                      ),
                      onPressed: () => chooseImage(ImageSource.camera),
                    ),
                    Container(
                      width: 200.0,
                      child: file == null
                          ? Image.asset('assets/images/one.jpg')
                          : Image.file(file!),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate,
                        size: 36.0,
                      ),
                      onPressed: () => chooseImage(ImageSource.gallery),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                        child:  TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'กรุณาตรวจสอบตำเเหน่งของท่าน';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    print(value);
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'ตำเเหน่ง',
                    labelStyle: TextStyle(color: Colors.white),
                    helperText: 'Tyep you password more 6 Charactor',
                    hintText: 'ตำเเหน่ง',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 240, 4, 4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(
                      Icons.badge,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'กรุณากรอกทักษะของท่านให้เรียบร้อย';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    print(value);
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'ทักษะ',
                    labelStyle: TextStyle(color: Colors.white),
                    helperText: 'Tyep you password more 6 Charactor',
                    hintText: 'ทักษะ',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 240, 4, 4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(
                      Icons.handyman,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                      ),
                ],),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: DropdownValue,
                  items: items,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      DropdownValue = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'สถานที่',
                    helperText: 'Tyep you password more 6 Charactor',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 240, 4, 4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                    }

                    // Navigator.push(
                    // context,
                    // MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => NextRegister()));

                    print('สมัครสมาชิก');

                    await CheckRegister(username.text, password.text, name.text,
                        surname.text, picdate.text, context);

                    // Navigator.pushNamedAndRemoveUntil(context,
                    //     "/Page1", (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 134, 156),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    primary: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

Future<Null> chooseImage(ImageSource imageSource) async {
  try {
    var object = await ImagePicker()
        .getImage(source: imageSource, maxHeight: 800.0, maxWidth: 800.0);

    setState(() {
      File file = File(object!.path);
    });
  } catch (e) {}
}

void setState(Null Function() param0) {}

Widget grorpImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.add_a_photo,
          size: 36.0,
        ),
        onPressed: () {},
      ),
    ],
  );
}

Future CheckRegister(String username, String password, String name,
    String surname, String picdate, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://165.22.63.114:3200/api/customer');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "username": username,
      "password": password,
      "fname": name,
      "lname": surname,
    }),
  )
      .then((req) async {
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);

      print('ข้อมูลid');
      print(prefs.get('idm'));
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainPage()),
          (Route<dynamic> route) => false);
      prefs.setInt('idm', data['id']);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
    }
  });
}
