import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 30.0,
                  ),
                  SizedBox(
                    height: 47.0,
                  ),
                  CustomTextFormField(
                    text: 'Name',
                    hintText: 'David Spade',
                    onSaved: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("Error");
                      }
                    },
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
                    height: 60,
                  ),
                  CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      _globalKey.currentState.save();
                      if (_globalKey.currentState.validate()) {
                        controller.createUserWithEmailAndPassword();
                      }
                    },
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
