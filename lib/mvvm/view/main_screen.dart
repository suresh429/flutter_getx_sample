import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/utils/utils.dart';
import 'package:flutter_getx_sample/mvvm/view/dashboard_screen.dart';
import 'package:flutter_getx_sample/mvvm/view/home/home_view.dart';
import 'package:get/get.dart';

import '../res/routes/routes_name.dart';
import '../view_models/controller/landing_page_controller.dart';
import '../view_models/controller/user_preference/user_prefrence_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //String _title = "Home";
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => SafeArea(
      bottom: false,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: landingPageController.changeTabIndex,
        currentIndex: landingPageController.tabIndex.value,
        backgroundColor: Colors.deepPurple,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: unselectedLabelStyle,
        selectedLabelStyle: selectedLabelStyle,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.home,
                size: 20.0,
              ),
            ),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.search,
                size: 20.0,
              ),
            ),
            label: 'Explore',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.location_history,
                size: 20.0,
              ),
            ),
            label: 'Places',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.settings,
                size: 20.0,
              ),
            ),
            label: 'Settings',
            backgroundColor: Colors.deepPurple,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    UserPreference userPreference = UserPreference();
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Obx(() => Text(
              landingPageController.appBarTitle.value,
              style: const TextStyle(color: Colors.white),
            )),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                openDialog(userPreference);

              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.snackBar("title", "message");

        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomeView(),
              DashBoardScreen(),
              DashBoardScreen(),
              DashBoardScreen(),
            ],
          )),
      bottomNavigationBar: buildBottomNavigationMenu(context, landingPageController),
    );
  }

  void openDialog(UserPreference userPreference) {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure want to Logout?'),
        actions: [
          TextButton(
            child: const Text(
              "CLOSE",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("OK", style: TextStyle(fontSize: 16.0)),
            onPressed: () {
              userPreference.removeUser().then((value) {
                Get.offAllNamed(RouteName.loginView);
                //  Get.delete<HomeController>();
              });
            },
          ),
        ],
      ),
    );
  }

}
