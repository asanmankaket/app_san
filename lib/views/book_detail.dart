import 'package:flutter/material.dart';

class bookdetail extends StatefulWidget {
  const bookdetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<bookdetail> createState() => _bookdetailState();
}

class _bookdetailState extends State<bookdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ข้อมูลพนักงงาน')),
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
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'ชื่อ ${widget.data['fname']} ${widget.data['lname']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('ราคาต่อชั่วโมง ${widget.data['rate']}',
                          style: TextStyle(fontSize: 18)),
                      Text('${widget.data['type']}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                  TextButton(onPressed: () {}, child: const Text('แก้ไข'))
                ],
              )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
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
                    SizedBox(width: 17),
                    TextButton(onPressed: () {}, child: const Text('แก้ไข'))
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Color.fromARGB(255, 232, 92, 22),
                  primary: Color.fromARGB(255, 255, 255, 255),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('ยกเลิกนัด'),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
