import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarningDiaLog extends Dialog {
  String text;
  String? textButton;
  bool? isWarning = false;
  Function? onClick;

  WarningDiaLog({super.key, required this.text, this.isWarning, this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isWarning == null // nếu null sẽ gắn false thay thế
                    ? Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.warning,
                        color: Colors.yellow,
                      ),
                const SizedBox(
                  width: 15,
                ),
                Text(isWarning == null ? "Error" : "Warning"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 155, 153, 153), // Màu của đường line
              thickness: 0.5, // Độ dày của đường line
            ),
            const SizedBox(
              width: 15,
            ),
            Container(margin: EdgeInsets.all(10), child: Text(text)),
            onClick == null
                ? OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok"))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("No")),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            if (onClick != null) {
                              onClick!();
                            }
                          },
                          child: Text("Yes"))
                    ],
                  ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
