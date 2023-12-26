

import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/utils/validator.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      controller: loginVM.emailController.value,
     // focusNode: loginVM.emailFocusNode.value,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => Validator().validEmail(email ?? ""),
     /* onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },*/
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
            border: const OutlineInputBorder(),
            labelText: "Email",
            //suffixIcon: Icon(Icons.person),
          ),
    );
  }
}
