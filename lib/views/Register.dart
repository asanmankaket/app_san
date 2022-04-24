// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/textformfieldmodel.dart';
import 'package:intl/intl.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _Register();
}

class _Register extends State<PageOne> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();

  DateTime? datenow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    void newDate() async {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year - 70),
          lastDate: DateTime(DateTime.now().year, DateTime.now().day));
      // firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      // lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30),
      // );
      print(date);

      if (date != null) {
        setState(() {
          datenow = date;
          // picdate.text = date.toString();
          picdate.text = DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

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
      backgroundColor: Color.fromARGB(255, 63, 217, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Register',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldModel(
                labeltext: 'Usename',
                controller: username,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldModel(
                labeltext: 'password',
                controller: password,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldModel(
                labeltext: 'confirm password',
                controller: confirmpassword,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldModel(
                labeltext: 'name',
                controller: name,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldModel(
                labeltext: 'surname',
                controller: surname,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: picdate,

                readOnly: true,
                onTap: () {
                  newDate();
                },
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                },
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'date',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'date',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 62, 144, 202)),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pictime,

                readOnly: true,
                onTap: () {
                  newtime();
                },
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                },
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'time',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'time',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 62, 144, 202)),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print('ลงทะเบียน');
                  // Navigator.pushNamed(context,
                  //     "/PageOne", (Route<dynamic> route) => false);
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
    );
  }
}
