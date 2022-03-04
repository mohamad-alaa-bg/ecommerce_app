import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_button_social.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              right: 20.0,
              left: 20.0,
            ),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Welcome',
                        fontSize: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: CustomText(
                          text: 'Sign Up',
                          fontSize: 18.0,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  CustomTextFormField(
                    text: 'Email',
                    hintText: 'iamdavid@gmail.com',
                    onSaved: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("Error");
                      }
                    },
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  CustomTextFormField(
                    text: 'Password',
                    hintText: '************',
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("Error");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Forget Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    text: 'SIGN IN',
                    onPressed: () {
                      _globalKey.currentState.save();
                      if (_globalKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  CustomText(
                    text: '-OR-',
                    fontSize: 18.0,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 43.0,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Facebook',
                    imageName: 'assets/images/Facebook.png',
                    onPress: () => controller.facebookSignInMethod(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButtonSocial(
                    text: 'Sign In with Google',
                    imageName: 'assets/images/Google.png',
                    onPress: () => controller.googleSignInMethod(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
