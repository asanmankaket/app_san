// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/DatePicker.dart';
import 'package:flutter_appcare/views/mainpage.dart';
import 'package:flutter_appcare/views/selectModel.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'booking.dart';

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<Carddetail> createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  get childrer => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลลูกค้า'),
        backgroundColor: Color.fromARGB(255, 160, 42, 207),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                //รูปavatar
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Color.fromARGB(255, 45, 134, 156),
                  // backgroundImage: ('widget.data['image']'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลานัด',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('วันที่'
                           +
                              DateFormat('dd-mm-yy KK:MM').format(
                                  DateTime.parse('${widget.data['start_time']}')),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('เวลาตั้งเเต่'
                           +
                              DateFormat('dd-mm-yy KK:MM').format(
                                  DateTime.parse('${widget.data['end_time']}')),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ 68 ปี',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   'ชื่อ ${widget.data['fname']} ${widget.data['lname']}',
              //   style: TextStyle(fontSize: 18),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'โรคประจำตัว',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '- โรคหัวใจ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '- โรคเบาหวาน',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '- โรคความดัน',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ลักษณะผู้ป่วย',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '- ผู้ป่วยติดเตียง',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text(
                    '   ${widget.data['phone']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.map,
                      color: Colors.blue,
                    ),
                    Text(
                      '''   ${widget.data['adr1']} ${widget.data['adr2']} 
            ${widget.data['city']}''',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 45.0,
                    child: RaisedButton(
                      color: Color.fromARGB(255, 192, 19, 0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => MainPage()));
                      },
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 45.0,
                    child: RaisedButton(
                      color: Color.fromARGB(255, 7, 168, 4),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => Booking()));
                      },
                      child: Text(
                        'ยืนยัน',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),

              // Column(
              //   children: <Widget>[
              //     TextButton(
              //       style: TextButton.styleFrom(
              //         padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //         backgroundColor: Color.fromARGB(255, 4, 117, 21),
              //         primary: Color.fromARGB(255, 255, 255, 255),
              //         textStyle: const TextStyle(fontSize: 20),
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute<void>(
              //                 builder: (BuildContext context) => Booking()));
              //       },
              //       child: const Text(
              //         'ยืนยัน',
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}