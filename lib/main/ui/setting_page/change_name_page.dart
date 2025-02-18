import 'package:datingapp/main/ui/setting_page/change_name_logic.dart';
import 'package:datingapp/main/util/common.dart';
import 'package:datingapp/main/util/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../res/app_style.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChangeNameLogic(),
        builder: (controller) {
          void datePicker() async {
            DateTime? picked = await showDatePicker(
                context: context,
                initialDate: controller.date,
                firstDate: DateTime(2024),
                lastDate: DateTime(2026));
            if (picked != null && picked != controller.date) {
              controller.date = picked;
              controller.update();
            }
          }

          return Scaffold(
              body: SafeArea(
                  child: Stack(
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
                      Image.asset("assets/image/love1.jpg", fit: BoxFit.cover)),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white70,
                            size: 30,
                          )),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Love Journal",
                        style: AppStyles.title,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Name of man: ",
                            style: AppStyles.textName,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: AppStyles.textField
                                .copyWith(hintText: controller.nameOfMan),
                            onChanged: (value) {
                              controller.textMan = value;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Name of woman: ",
                            style: AppStyles.textName,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: AppStyles.textField
                                .copyWith(hintText: controller.nameOfWoman),
                            onChanged: (value) {
                              controller.textWoman = value;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),

                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black), // Màu chữ
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 32), // Padding cho nút
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Bo góc 20 pixels
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (controller.textMan == "" ||
                                controller.textWoman == "") {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WarningDiaLog(
                                      text: "You need to type the name",
                                    );
                                  });
                            } else {
                              controller.saveName();
                            }
                          },
                          child: Text("Save")),
                    ),
                  )
                ],
              )
            ],
          )));
        });
  }
}
