import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_viewModel.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller) => Container(
                padding: EdgeInsets.only(top: 40, left: 16, right: 16),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.network(
                            controller.listCartProducts[index].image,
                            fit: BoxFit.fill,
                            height: 120,
                            width: 120,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.listCartProducts[index].name,
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CustomText(
                                text: '\$' + controller.listCartProducts[index].price.toString(),
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade200,
                                ),
                                width: 95,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: CustomText(
                                        text: controller.listCartProducts[index].quantity.toString(),
                                      ),
                                    ),
                                    Icon(
                                      Icons.remove,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: controller.listCartProducts.length),
              ),
            ),
          ),
          Container(
            width: 375,
            height: 84,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'TOTAL',
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: '\$4500',
                          color: primaryColor,
                        ),
                      ],
                    ),
                    height: 84,
                  ),
                  Container(
                      width: 146,
                      height: 50,
                      child: CustomButton(
                        text: 'CHECKOUT',
                        onPressed: () {},
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
