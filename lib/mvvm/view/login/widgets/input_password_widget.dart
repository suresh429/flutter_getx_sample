import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/utils/validator.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  bool showPassword = false;
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>TextFormField(
      controller: loginVM.passwordController.value,
      // focusNode: loginVM.passwordFocusNode.value,
     // obscureText: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) => Validator().validPassword(password ?? ""),
      onFieldSubmitted: (value) {},
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          /*suffixIcon: InkWell(
              onTap: () {
                showPassword = !showPassword;
              },
              child: Icon(showPassword
                  ? Icons.visibility
                  : Icons.visibility_off)),*/
          border: const OutlineInputBorder()),
    ));
  }
}
