import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sidemenu.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  dynamic data;

  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    final prefs =
        await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
    int? idUser = prefs.getInt(
        'idm'); //เอาตัวidของcustomerมาใช้กับหน้านี้แล้วเอาค่าไปใส่ในidUser
    dynamic item = await Getdata(idUser); //ส่งค่าไปยัง getdataหรือตัวรับapi

    setState(() {
      data = item;
    });

    print('หลังจากรับ:'); //ทดสอบprintตัวdataที่รับมาจากapi
    print(data);
    print('จำนวนdata:');
    print(data.length); //ทดสอบprint จำนวนของdata
  }

  late AsyncSnapshot snapshot; //ยังไม่รู้จะใช้ยังไง
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('นัดหมาย'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
          onRefresh: () async {
            startApi();
          },
          child: ListView.builder(
            // itemCount: data?.length ?? 0, //เอาออกไปก่อนเพราะตัวdata.lengthยังพังอยู่
            itemCount: 3, //ใช้ตัวนี้แทนเพราะตัวdataพัง
            itemBuilder: (context, i) => InkWell(
              // onTap: () => Navigator.pushNamed(context, "/CDT"),
              onTap: () {
                // print('หน้านัดหมาย');
                // // Navigator.push(
                // //     context,
                // //     MaterialPageRoute<void>(
                // //         builder: (BuildContext context) =>
                // //             Carddetail(data: data[i])));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //         builder: (BuildContext context) =>
                //             bookdetail(data: data[i])));
              },
              child: Card(
                elevation: 10,
                color: Color.fromARGB(255, 150, 217, 234),
                shadowColor: Color.fromARGB(255, 10, 91, 111),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 15,
                            ),
                            const SizedBox(
                              width: 55.0,
                              height: 55.0,
                              // color: Color.fromARGB(255, 150, 217, 234),
                              // ignore: prefer_const_constructors
                              child: CircleAvatar(
                                  // backgroundColor:
                                  //     Color.fromARGB(255, 150, 217, 234),
                                  // foregroundColor:
                                  //     Color.fromARGB(255, 150, 217, 234),
                                  // ignore: prefer_const_constructors
                                  // backgroundImage:
                                  // NetworkImage('${data[i]['image']}'),
                                  // backgroundImage: NetworkImage(
                                  //     "https://obs.line-scdn.net/0ho7Hx9FjJMBh1ARpkc9xPT09XM3dGbSMbETdhGylvbiwKMSRPGm4vLVlVO3oNOXdGG297dlEAKylQNXFMSmEv/w644"),
                                  ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data['title']} ${data['fname']} ${data['lname']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'เริ่ม : ' +
                                        DateFormat('dd-mm-yy KK:MM').format(
                                            DateTime.parse(
                                                '${data['start_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'ถึง :  ' +
                                        DateFormat('dd-mm-yy KK:MM').format(
                                            DateTime.parse(
                                                '${data['end_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ),
      drawer: SideMenu(), //หน้าปุ่มsidemenu
    );
  }
}

Future<dynamic> Getdata(dynamic idUser) async {
  Uri url = Uri.parse(
      'http://192.168.1.9:3000/api/booking/$idUser'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      print('error');
      return null;
    }
  });
}
