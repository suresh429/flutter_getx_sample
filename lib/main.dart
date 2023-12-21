import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/res/getx_loclization/languages.dart';
import 'package:flutter_getx_sample/mvvm/res/routes/routes.dart';
import 'package:get/get.dart';

import 'mvvm/res/routes/routes_name.dart';
import 'mvvm/view/home/home_view.dart';
import 'mvvm/view/login/login_view.dart';
import 'mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';


void main() async {
 // WidgetsFlutterBinding.ensureInitialized();

  UserPreference userPreference = UserPreference();
  bool isLoggedIn = false;

  try {
    var value = await userPreference.getUser();
    isLoggedIn = value.isLogin == true;
  } catch (e) {
    // Handle any potential errors during user retrieval
    print('Error: $e');
  }

  runApp(buildApp(isLoggedIn));
}

Widget buildApp(bool isLoggedIn) {
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
    getPages: AppRoutes.appRoutes(),
    home: isLoggedIn ? const HomeView() : const LoginView(),
  );
}


