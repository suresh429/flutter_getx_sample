import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/view/user_list_screen.dart';
import 'package:get/get.dart';

import 'data/repositories/user_repository.dart';
import 'data/services/api_service.dart';
import 'view_models/user_view_model.dart';

void main() {
  // Initialize GetX dependency injection
  Get.put(ApiService(dio: Dio())); // ApiService instance
  Get.put(Repository()); // UserRepository instance
  Get.put(UserViewModel()); // UserViewModel instance
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const UserList(),
    );
  }
}


