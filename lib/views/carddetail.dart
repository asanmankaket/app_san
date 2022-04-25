import 'package:flutter/material.dart';

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<Carddetail> createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ข้อมูลพนักงงาน')),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('ชื่อผู้ใช้ ${widget.data['fname']}'),
              Text('นามสกุล ${widget.data['lname']}'),
              Text('ราคาต่อชั่วโมง ${widget.data['rate']}'),
              Text(''),
            ],
          ),
        )),
      ),
    );
  }
}
