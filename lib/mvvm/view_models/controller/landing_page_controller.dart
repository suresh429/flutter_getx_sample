import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;
  var appBarTitle = "Home".obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    switch (index) {
      case 0:
        appBarTitle.value = 'Home';
        break;
      case 1:
        appBarTitle.value = 'Explore';
        break;
      case 2:
        appBarTitle.value = 'Places';
        break;
      case 3:
        appBarTitle.value = 'Settings';
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void onTabChanged(int index) {
    tabIndex.value = index;
  }
}