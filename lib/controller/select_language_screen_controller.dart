import 'package:get/get.dart';

class SelectLanguageScreenController extends GetxController {
  // RxInt to track selected country index (-1 means none selected)
  var selectedIndex = (-1).obs;

  void selectCountry(int index) {
    selectedIndex.value = index;
  }
}
