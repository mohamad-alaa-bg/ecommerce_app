import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
            builder :(controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
          );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Explore'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('cart'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_per.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Account'),
            ),
            label: '',
          ),
        ],
        currentIndex: controller.navigationValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },

        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
