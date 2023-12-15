import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/view/user_list_screen.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../utils/validator.dart';
import '../view_models/user_view_model.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  final UserViewModel userViewModel = Get.put(UserViewModel());
  final _formKey = GlobalKey<FormState>();

  bool isShowPassword = false;
  TextEditingController titleEditingController = TextEditingController();

  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts Api'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleEditingController,
                    keyboardType: TextInputType.name,
                    // autovalidateMode: AutovalidateMode.always,
                    validator: (name) =>
                        Validator().usernameValidator(name ?? ""),
                    // maxLength: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Title",
                      //suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: descriptionTextEditingController,
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    // autovalidateMode: AutovalidateMode.always,
                    // maxLength: 10,
                    // validator: (email) => Validator().validEmail(email ?? ""),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description",
                      //suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      //  shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize:
                      const Size(double.infinity, 45), //////// HERE
                    ),
                    onPressed: () async {
                      userViewModel.loading
                          ? const Center(
                        child: CircularProgressIndicator(),
                      )
                          : await userViewModel.postData(titleEditingController.text, descriptionTextEditingController.text);

                      // formValidation();

                      // Check if login was successful
                      if (userViewModel.isLoggedIn.value) {
                        // Navigate to the next screen
                        Get.to(() => const UserList());
                      } else {
                        // Handle login failure
                        Get.snackbar('Login Failed', 'Invalid credentials');
                      }

                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))

                ],
              ),
            ),
          ),
        ));
  }

  formValidation() {
    if (_formKey.currentState!.validate()) {
      debugPrint('data: ${descriptionTextEditingController.text}');
      Utils.showSnackbar(context,
          "Logged in successfully.\n${descriptionTextEditingController.text}\n${titleEditingController.text}");
    } else {}
  }
}
