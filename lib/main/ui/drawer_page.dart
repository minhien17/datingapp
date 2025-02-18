import 'package:datingapp/main/res/app_style.dart';
import 'package:datingapp/main/ui/drawer_logic.dart';
import 'package:datingapp/main/ui/notification/notification_page.dart';
import 'package:datingapp/main/ui/setting_page/change_date_page.dart';
import 'package:datingapp/main/ui/setting_page/change_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DrawerLogic(),
        builder: ((controller) {
          return Drawer(
            width: 250,
            child: SafeArea(
                child: Container(
              color: Color.fromARGB(255, 205, 203, 199),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Box1(
                        context,
                        Icon(Icons.abc_rounded, color: Colors.green),
                        "Change Name"),
                    onTap: () {
                      Get.to(ChangeName());
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Box1(
                        context,
                        Icon(Icons.date_range, color: Colors.green),
                        "Change Date"),
                    onTap: () {
                      Get.to(ChangeDate());
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Box1(
                        context,
                        Icon(
                          Icons.notifications,
                          color: Colors.red,
                        ),
                        "Notification"),
                    onTap: () {
                      Get.to(Notipage());
                    },
                  ),
                  // ExpansionTile(
                  //   title: Text("Change"),
                  //   trailing: Icon(Icons.arrow_drop_down),
                  //   children: [Text('data'), Text('data')],
                  //   onExpansionChanged: (value) {},
                  // )
                ],
              ),
            )),
          );
        }));
  }

  Widget Box1(BuildContext context, Icon icon, String title) {
    return Container(
      height: 40,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: AppStyles.t1,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
