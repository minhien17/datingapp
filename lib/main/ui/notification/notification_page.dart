import 'package:datingapp/main/ui/setting/noti_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Notipage extends StatefulWidget {
  const Notipage({super.key});

  @override
  State<Notipage> createState() => _NotipageState();
}

class _NotipageState extends State<Notipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                NotiService()
                    .showNotification(title: "Love", body: "Yêu thêm 1 ngày");
              },
              child: Text("Noti")),

          // schedule notification for later
          ElevatedButton(
              onPressed: () {
                NotiService().scheduleNotification(
                    title: "Title",
                    body: "Bạn đã yêu thêm 1 ngày",
                    hour: 10,
                    minute: 40);
              },
              child: Text("Noti")),
        ],
      )),
    );
  }
}
