import 'package:datingapp/main/ui/home/home_page.dart';
import 'package:datingapp/main/ui/setting/noti_service.dart';
import 'package:datingapp/main/ui/video/video_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // init notification
  NotiService().initNotificaion();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/setting', page: () => Container()),
        // GetPage(name: '/video', page: () => VideoPage()),
      ],
    );
  }
}
