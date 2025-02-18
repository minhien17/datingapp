import 'dart:ui';

import 'package:datingapp/main/util/common.dart';
import 'package:datingapp/main/util/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeLogic extends GetxController {
  XFile? pickedFile;
  PageController pageController = PageController();
  int pageIndex = 0;

  int loveDays = 0;

  XFile? fImage1;
  XFile? fImage2;

  final String nameImage1 = "image1";
  final String nameImage2 = "image2";

  String nameOfMan = "Hiển";
  String nameOfWoman = "Thơ";

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadImage(nameImage1);
    loadImage(nameImage2);
    loadImage("image");
    getDays();
    getName();
  }

  Future pickImageFromGallery(String name) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (name == nameImage1) {
        fImage1 = image;
      } else if (name == nameImage2) {
        fImage2 = image;
      } else {
        pickedFile = image;
      }
      saveImage(image, name);
    }
    update();
  }

  void saveImage(XFile img, String name) async {
    final String path = (await getApplicationDocumentsDirectory()).path;

    File convertImg = File(img.path);

    final File localImage = await convertImg.copy("$path/$name");
    print("Saved image under: $path/$name");
  }

  void loadImage(String name) async {
    final String path = (await getApplicationDocumentsDirectory()).path;

    if (File("$path/$name").existsSync()) {
      print("Image exists, Loading...");
      if (name == nameImage1) {
        fImage1 = XFile("$path/$name");
      } else if (name == nameImage2) {
        fImage2 = XFile("$path/$name");
      } else {
        pickedFile = XFile("$path/$name");
      }
      update();
    }
  }

  getDays() async {
    String loveDay = await SharedPreferenceUtil.getLoveDay();
    loveDays = Common().caculateDays(loveDay);
    update();
  }

  getName() async {
    nameOfMan = await SharedPreferenceUtil.getManName();
    nameOfWoman = await SharedPreferenceUtil.getWomanName();
    update();
  }
}
