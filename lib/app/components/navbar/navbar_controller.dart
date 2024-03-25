import 'package:get/get.dart';

class NavbarController extends GetxController {
  List navigation = [];
  RxInt selectedIndex = 0.obs;

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
