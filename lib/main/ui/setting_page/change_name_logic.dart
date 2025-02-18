import 'package:datingapp/main/ui/home/home_logic.dart';
import 'package:datingapp/main/util/common.dart';
import 'package:datingapp/main/util/share_preference.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeNameLogic extends GetxController {
  String textMan = "";
  String textWoman = "";

  String nameOfMan = "";
  String nameOfWoman = "";

  DateTime date = DateTime.now();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    getName();
  }

  Future getName() async {
    nameOfMan = await SharedPreferenceUtil.getManName();
    nameOfWoman = await SharedPreferenceUtil.getWomanName();
    update();
  }

  saveName() async {
    await SharedPreferenceUtil.saveManName(textMan);
    await SharedPreferenceUtil.saveWomanName(textWoman);
    Get.back();
    Get.find<HomeLogic>().getName();
  }

  saveDate() async {
    print("save");
    String loveDay = Common().switchDateToString(date);
    await SharedPreferenceUtil.saveLoveDay(loveDay);
    Get.back();
    Get.find<HomeLogic>().getDays();
  }
}
