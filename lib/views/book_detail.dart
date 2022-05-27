// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class bookdetail extends StatefulWidget {
  const bookdetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<bookdetail> createState() => _bookdetailState();
}

class _bookdetailState extends State<bookdetail> {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลลูกค้า'),
        backgroundColor: Color.fromARGB(255, 160, 42, 207),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                //รูปavatar
                child: CircleAvatar(
                  radius: 70,
                  // backgroundImage: ('${widget.data['image']}'),
                  backgroundColor: Color.fromARGB(255, 45, 134, 156),
                ),
              ),
              SizedBox(
                height: 15,
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
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'วันที่ : ' +
                            DateFormat('dd-mm-yy KK:MM').format(
                                DateTime.parse('${widget.data['start_time']}')),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'เวลาตั้งเเต่ :  ' +
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
                height: 30,
              ),
              ClipRRect(
                // borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  // color: Color.fromARGB(255, 150, 217, 234),
                  // padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'อายุ 68 ปี',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '- โรคเบาหวาน',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '- โรคความดัน',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      // Text('ราคาต่อชั่วโมง ${widget.data['rate']}',
                      //     style: TextStyle(fontSize: 18)),
                      // Text('${widget.data['type']}',
                      //     style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: SizedBox(
                          width: 40,
                        ),
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
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: SizedBox(
                          width: 40,
                        ),
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
                      SizedBox(width: 162),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              // TextButton(
              //   style: TextButton.styleFrom(
              //     padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     backgroundColor: Color.fromARGB(255, 232, 92, 22),
              //     primary: Color.fromARGB(255, 255, 255, 255),
              //     textStyle: const TextStyle(fontSize: 20),
              //   ),
              //   onPressed: () {},
              //   child: const Text('ยกเลิกนัด'),
              // ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
