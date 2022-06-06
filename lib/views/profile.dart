import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  // datetime() {
  //   final birtday1 = DateFormat('yy, mm, dd')
  //       .format(DateTime.parse('${data['start_time']}'));
  //   DateTime birthday = DateTime.parse(birtday1);
  //   DateDuration duration;
  //   duration = AgeCalculator.age(birthday);
  //   print('$duration');
  //   return duration;
  // }

  // dynamic age = DateTime.now() - DateFormat('mm-yy').format(
  //                                           DateTime.parse(
  //                                               '${data['birtday']}'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: Color.fromARGB(255, 160, 42, 207),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Color.fromARGB(255, 45, 134, 156),
            ),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        '${widget.data['title']} ${widget.data['fname']} ${widget.data['lname']}',
                        // '${data['title']} ${data['fname']} ${data['lname']}',
                        //สำหรับใส่ข้อมูลจากdatabase
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'อายุ : 22  ' + ' เพศ : ${widget.data['title']}',
                        //ใส่อายุ
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'โรคเบาหวาน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'โรคหัวใจ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(width: 80),
              Text('ลักษณะผู้ป่วย', style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: const Text(
                    'ผู้ป่วยติดเตียง',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 80),
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text('${widget.data['phone']}', style: TextStyle(fontSize: 17)),
              SizedBox(width: 105),
              TextButton(
                  onPressed: () {},
                  child: const Text('แก้ไข',
                      style: TextStyle(fontSize: 17, color: Colors.red)))
            ],
          ),
          Row(
            children: [
              SizedBox(width: 80),
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text('''${widget.data['address']}''',
                  style: TextStyle(fontSize: 17)),
              SizedBox(width: 17),
              TextButton(
                  onPressed: () {},
                  child: const Text('แก้ไข',
                      style: TextStyle(fontSize: 17, color: Colors.red)))
            ],
          ),
          SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Color.fromARGB(255, 232, 92, 22),
              primary: Color.fromARGB(255, 255, 255, 255),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('token');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                    //แก้ตรงนี้--------------------------------------------------------------------------------------
                  ),
                  (route) => false);
            },
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}
