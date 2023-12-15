import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/res/getx_loclization/languages.dart';
import 'package:flutter_getx_sample/mvvm/res/routes/routes.dart';
import 'package:flutter_getx_sample/view/user_list_screen.dart';
import 'package:get/get.dart';

import 'mvvm/res/routes/routes_name.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}


