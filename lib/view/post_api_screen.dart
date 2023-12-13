import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/user_view_model.dart';

class PostApi extends StatelessWidget {
  const PostApi({super.key});

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = Get.put(UserViewModel());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts Api'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                userViewModel.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : userViewModel.errorMessage.isNotEmpty
                        ? Center(
                            child: Text(userViewModel.errorMessage),
                          )
                        : userViewModel.postData();
              },
              child: const Text("Click")),
        ));
  }
}
