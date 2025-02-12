import 'package:datingapp/main/ui/home/home_logic.dart';
import 'package:get/get.dart';

class DrawerLogic extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  closeDrawer() {
    HomeLogic().closeDrawer();
  }
}
