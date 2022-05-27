// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_appcare/configs/config.dart';
// import 'package:flutter_appcare/views/carddetail.dart';
// import 'package:http/http.dart' as http;

// import '../models/sidemenu.dart';

// class cardconfirm extends StatefulWidget {
//  cardconfirm({Key? key, data}) : super(key: key);

//   @override
//   State<cardconfirm> createState() => _cardconfirm();
// }

// class _cardconfirm extends State<cardconfirm> {
//   @override
//   dynamic data;

//   void initState() {
//     super.initState();
//     startApi();
//   }

//   startApi() async {
//     var item = await Getdata();

//     print(item?.first);

//     setState(() {
//       data = item;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 227, 227, 227),
//       appBar: AppBar(
//         title: Text('ยืนยันเเล้ว'),
//         backgroundColor: Color.fromARGB(255, 160, 42, 207),
//       ),
//       body: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: RefreshIndicator(
//             onRefresh: () async {
//               startApi();
//             },
//             child: ListView.builder(
//               itemCount: data?.length ?? 0,
//               itemBuilder: (context, i) => InkWell(
//                 // onTap: () => Navigator.pushNamed(context, "/CDT"),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute<void>(
//                           builder: (BuildContext context) =>
//                               Carddetail(data: data[i])));
//                 },
//                 child: Card(
//                   elevation: 10,
//                   color: Color.fromARGB(255, 229, 179, 249),
//                   shadowColor: Color.fromARGB(255, 10, 91, 111),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Container(
//                                 width: 55.0,
//                                 height: 55.0,
//                                 // color: Color.fromARGB(255, 150, 217, 234),
//                                 // ignore: prefer_const_constructors
//                                 child: CircleAvatar(
//                                     // backgroundColor:
//                                     //     Color.fromARGB(255, 150, 217, 234),
//                                     // foregroundColor:
//                                     //     Color.fromARGB(255, 150, 217, 234),
//                                     // ignore: prefer_const_constructors
//                                     // backgroundImage:
//                                     //     AssetImage('assets/image/$i.jpeg'),

//                                     // backgroundImage:
//                                     //     NetworkImage('${data[i]['image']}'),
//                                     // backgroundImage: NetworkImage(
//                                     //     "https://obs.line-scdn.net/0ho7Hx9FjJMBh1ARpkc9xPT09XM3dGbSMbETdhGylvbiwKMSRPGm4vLVlVO3oNOXdGG297dlEAKylQNXFMSmEv/w644"),
//                                     ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(22),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '${data[i]['title']} ${data[i]['fname']} ${data[i]['lname']}',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                     SizedBox(
//                                       height: 2,
//                                     ),
//                                     Text('Rate/hr: ${data[i]['rate']}'),
//                                     SizedBox(
//                                       height: 2,
//                                     ),
//                                     Text(
//                                       '${data[i]['phone']}',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ])
//                       ]),
//                 ),
//               ),
//             ),
//           )),
//       drawer: SideMenu(),
//     );
//   }
// }

// Future<dynamic> Getdata() async {
//   Uri url = Uri.parse('http://165.22.63.114:3200/api/mentor'); //server
//   // Uri url = Uri.parse('http://192.168.1.9:3200/api/mentor');          //เครื่องกุ
//   return await http
//       .get(
//     url,
//     headers: headers,
//   )
//       .then((req) async {
//     print(req.statusCode);
//     if (req.statusCode == 200) {
//       var data = jsonDecode(req.body);
//       return data;
//     } else {
//       print('error');
//       return null;
//     }
//   });
// }
