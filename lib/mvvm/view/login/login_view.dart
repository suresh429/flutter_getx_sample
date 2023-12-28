import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/utils/responsive.dart';
import 'package:flutter_getx_sample/mvvm/view/login/widgets/input_email_widget.dart';
import 'package:flutter_getx_sample/mvvm/view/login/widgets/input_password_widget.dart';
import 'package:flutter_getx_sample/mvvm/view/login/widgets/login_button_widget.dart';
import 'package:get/get.dart';

import '../../view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  // SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLogo(),
                buildForm(),
                const SizedBox(
                  height: 40,
                ),
                LoginButtonWidget(
                  formKey: _formkey,
                )
              ],
            ),
          ),
          tab: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLogo(),
                buildForm(),
                const SizedBox(
                  height: 40,
                ),
                LoginButtonWidget(
                  formKey: _formkey,
                )
              ],
            ),
          ),
          desktop: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: buildLogo()),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildForm(),
                      const SizedBox(
                        height: 40,
                      ),
                      LoginButtonWidget(
                        formKey: _formkey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          InputEmailWidget(),
          const SizedBox(
            height: 20,
          ),
          InputPasswordWidget(),
        ],
      ),
    );
  }

  Padding buildLogo() {
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Image.asset(
          'assets/airplane.png',
          height: 80.0,
          width: 80.0,
          alignment: Alignment.center,
        ));
  }
}
