// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFormFieldModel extends StatelessWidget {
  const TextFormFieldModel({
    Key? key,
    @required this.labeltext,
    this.hintText,
    @required this.controller,
  }) : super(key: key);

  final String? labeltext;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        print(value);
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 62, 144, 202)),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            borderRadius: BorderRadius.all(Radius.circular(50))),
      ),
    );
  }
}
