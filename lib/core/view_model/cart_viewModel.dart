import 'package:ecommerce_app/core/services/database/cart_database_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _listCartProducts = [];

  List<CartProductModel> get listCartProducts => _listCartProducts;

  CartViewModel(){
    getAllProduct();
  }
  addProduct(CartProductModel cartProductModel) async {
    var dbClient = CartDataBaseHelper.db;
    await dbClient.insert(cartProductModel);
    print('add');
    update();
  }

  getAllProduct() async {
    var dbClient = CartDataBaseHelper.db;
    _listCartProducts = await dbClient.getAllProducts();

    print(_listCartProducts.length);
    update();
  }
}
