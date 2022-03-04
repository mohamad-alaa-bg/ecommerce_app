import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    await HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
      }
      print(categoryModel.length);
      _loading.value = false;
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    await HomeServices().getBestSellingProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }
}
