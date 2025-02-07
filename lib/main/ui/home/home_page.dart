import 'dart:io';

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
                      Image.asset("assets/image/love.jpg", fit: BoxFit.cover)),
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
                            controller.pickImageFromGallery("image");
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white70,
                            size: 30,
                          )),
                      const Spacer(),
                      const Text(
                        "Love Story",
                        style: TextStyle(
                            fontFamily: "Beauty",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 400,
                    width: 400,
                    child: Stack(
                      children: [
                        const Center(
                          child: Text(
                            "150 ngày",
                            style:
                                TextStyle(fontSize: 25, fontFamily: "Roboto"),
                          ),
                        ),
                        Image.asset("assets/image/love_shape.png")
                      ],
                    ),
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
                            const Text(
                              "Minh Hiển",
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
                            const Text(
                              "Hải Thơ",
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
          ));
        });
  }
}
