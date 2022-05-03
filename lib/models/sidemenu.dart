// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/login.dart';

class SideMenu extends StatefulWidget {
  SideMenu({
    Key? key,
    this.routeName,
  }) : super(key: key);

  final String? routeName;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 45, 134, 156),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/LOGO.png'),
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'name',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                routeItem(
                  context,
                  Icon(Icons.house),
                  //แก้ตรงนี้--------------------------------------------------------------------------------------
                  'หาพี่เลี้ยง',
                  '/Page1',
                ),
                routeItem(
                  context,
                  Icon(Icons.house),
                  //แก้ตรงนี้--------------------------------------------------------------------------------------
                  'นัดหมาย',
                  '/book',
                ),
                routeItem(
                  context,
                  Icon(Icons.map),
                  //แก้ตรงนี้--------------------------------------------------------------------------------------
                  'Map',
                  '/Map',
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // leading: Icon(FontAwesomeIcons.rightFromBracket),
                  title: Text(
                    'ออกจากระบบ',
                    style: TextStyle(color: Colors.red),
                  ), //แก้ตรงนี้--------------------------------------------------------------------------------------
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('token');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                          //แก้ตรงนี้--------------------------------------------------------------------------------------
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile routeItem(BuildContext context, Widget? leading, String name,
      String routeItemName) {
    return ListTile(
      selected: widget.routeName == routeItemName,
      selectedColor: Colors.lightGreen,
      leading: leading,
      title: Text(name),
      onTap: () {
        widget.routeName == routeItemName
            ? Navigator.pop(context, true)
            : Navigator.pushReplacementNamed(context, routeItemName);
      },
    );
  }
}
