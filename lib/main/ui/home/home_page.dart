import 'dart:io';

import 'package:datingapp/main/res/app_style.dart';
import 'package:datingapp/main/ui/drawer_page.dart';
import 'package:datingapp/main/ui/home/home_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: HomeLogic(),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromARGB(255, 125, 159, 127),
                    child:
                        // controller.pickedFile != null
                        //     ? Image.file(
                        //         File(controller.pickedFile!.path),
                        //         fit: BoxFit.cover,
                        //       )
                        //     :
                        Image.asset("assets/image/love1.jpg",
                            fit: BoxFit.cover)),
                SafeArea(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.openDrawer();
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white70,
                              size: 30,
                            )),
                        const Spacer(),
                        Text(
                          "Love Journal",
                          style: AppStyles.title,
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    // add pageview đếm số ngày, ngày kỷ niệm
                    Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: 400,
                      child: PageView(
                        controller: controller.pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          controller.pageIndex = value;
                          controller.update();
                        },
                        children: [
                          Center(
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 221, 80, 129)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Đang yêu",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Beauty",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "${controller.loveDays}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Beauty",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "ngày",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Beauty",
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    tim(controller.loveDays ~/ 365, "Năm"),
                                    tim(controller.loveDays ~/ 30, "Tháng"),
                                    tim((controller.loveDays % 30) ~/ 7,
                                        "Tuần"),
                                    tim(controller.loveDays % 7, "Ngày")
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return buildDot(index);
                      }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: width / 2,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                ),
                                child: ClipOval(
                                    child: controller.fImage1 != null
                                        ? Image.file(
                                            File(controller.fImage1!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/image/love.jpg",
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.pickImageFromGallery(
                                      controller.nameImage1);
                                },
                                icon: Icon(
                                  Icons.change_circle,
                                  color: Color.fromARGB(255, 218, 233, 148),
                                  size: 30,
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.nameOfMan,
                                style: TextStyle(
                                    fontFamily: "Beauty",
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              // Container(
                              //   height: 15,
                              //   width: 35,
                              //   color: Colors.pinkAccent,
                              //   child: Text("Nhân mã"),
                              // )
                            ],
                          ),
                        ),
                        Container(
                          width: width / 2,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                ),
                                child: ClipOval(
                                    child: controller.fImage2 != null
                                        ? Image.file(
                                            File(controller.fImage2!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/image/love.jpg",
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.pickImageFromGallery(
                                      controller.nameImage2);
                                },
                                icon: Icon(
                                  Icons.change_circle,
                                  color: Color.fromARGB(255, 218, 233, 148),
                                  size: 30,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.nameOfWoman,
                                style: TextStyle(
                                    fontFamily: "Beauty",
                                    fontSize: 20,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
            key: controller.scaffoldKey,
            drawer: DrawerPage(),
          );
        });
  }

  // Hàm tạo các chấm tròn
  Widget buildDot(int index) {
    return GetBuilder(
        init: HomeLogic(),
        builder: (controller) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: 12,
            width: controller.pageIndex == index
                ? 16
                : 12, // Chấm tròn của trang hiện tại sẽ lớn hơn
            decoration: BoxDecoration(
              color: controller.pageIndex == index
                  ? Color.fromARGB(255, 112, 61, 61)
                  : Color.fromARGB(255, 241, 211,
                      211), // Chấm tròn của trang hiện tại có màu đậm hơn
              borderRadius: BorderRadius.circular(6),
            ),
          );
        });
  }

  Widget tim(int count, String type) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 80,
              child: Image.asset("assets/image/tim.png"),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Center(
                  child: Text(
                "${count}",
                style: AppStyles.textName,
              )),
            ),
          ],
        ),
        Text(
          type,
          style: AppStyles.title.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
