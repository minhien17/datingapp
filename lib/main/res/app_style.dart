import 'package:flutter/material.dart';

class AppStyles {
  static final TextStyle t1 = TextStyle(fontSize: 16);
  static final TextStyle title =
      TextStyle(fontFamily: "Beauty", fontSize: 30, color: Colors.white);
  static final TextStyle textName =
      TextStyle(fontSize: 18, color: Colors.white);

  static final InputDecoration textField = InputDecoration(
      filled: true, // Thêm màu nền
      fillColor: Colors.white, // Màu nền cho TextField
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), // Bo góc tròn
        borderSide: BorderSide.none, // Bỏ viền ngoài khi có màu nền
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), // Bo góc tròn khi chưa focus
        borderSide:
            BorderSide(color: Colors.grey), // Màu viền ngoài khi không focus
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), // Bo góc tròn khi focus
        borderSide:
            BorderSide(color: Colors.blue, width: 2), // Màu viền khi focus
      ),
      hintStyle: TextStyle(color: Color.fromARGB(60, 162, 160, 160)));
}
