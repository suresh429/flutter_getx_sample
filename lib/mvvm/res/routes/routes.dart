import 'package:flutter_getx_sample/mvvm/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../view/home/home_view.dart';
import '../../view/login/login_view.dart';
import '../../view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
       /* GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),*/
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}