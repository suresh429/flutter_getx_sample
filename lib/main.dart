import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/res/getx_loclization/languages.dart';
import 'package:flutter_getx_sample/mvvm/res/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mvvm/res/routes/routes_name.dart';
import 'mvvm/view/home/home_view.dart';
import 'mvvm/view/on_board_screens.dart';
import 'mvvm/view/login/login_view.dart';
import 'mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  UserPreference userPreference = UserPreference();
  bool isLoggedIn = false;
  final box = GetStorage();
  try {
    var value = await userPreference.getUser();
    isLoggedIn = value.isLogin == true;
  } catch (e) {
    // Handle any potential errors during user retrieval
    print('Error: $e');
  }

  runApp(buildApp(isLoggedIn,box));
}

Widget buildApp(bool isLoggedIn, GetStorage box) {
  bool isOnBoard  = box.read('isOnBoard') ?? false;

  return GetMaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    translations: Languages(),
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: false,
    ),
   // initialRoute: RouteName.loginView,
    getPages: AppRoutes.appRoutes(),
    home: isLoggedIn ? const HomeView() :  isOnBoard ? const LoginView() :  const OnBoardScreens(),
  );
}


