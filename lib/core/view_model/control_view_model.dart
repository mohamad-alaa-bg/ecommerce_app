import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();

  int _navigationValue = 0;

  get navigationValue => _navigationValue;
  get currentScreen => _currentScreen;
  @override
  void onInit() {
    // TODO: implement onInit
    changeSelectedValue(0);
    super.onInit();
  }
  void changeSelectedValue(int selectedValue) {
    _navigationValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
