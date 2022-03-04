import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_viewModel.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel productModel;

  DetailsView({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 270,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name,
                        fontSize: 26,
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: productModel.size,
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: productModel.color,
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  width: 22,
                                  height: 22,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 33.7,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 15.3,
                      ),
                      CustomText(
                        text: productModel.description,
                        fontSize: 14,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      CustomText(
                        text: '\$' + productModel.price,
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) =>
                        Container(
                          width: 146,
                          height: 50,
                          child: CustomButton(
                            onPressed: () {
                              controller.addProduct(
                                CartProductModel(
                                  name: productModel.name,
                                  image: productModel.image,
                                  price: productModel.price,
                                  quantity: 1,
                                ),
                              );

                            },
                            text: 'ADD',
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
