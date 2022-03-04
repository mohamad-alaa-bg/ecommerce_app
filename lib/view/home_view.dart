import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  List<String> name = ['s', 's', 's', 's', 's'];
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    _searchTextFormField(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: 'Categories',
                      fontSize: 18.0,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18.0,
                        ),
                        CustomText(
                          text: 'See all',
                          fontSize: 16.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _listViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 95,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 20.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 300,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 20.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  productModel: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        controller.productModel[index].image,
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      fontSize: 16,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: controller.productModel[index].shortDescription,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: '\$' + controller.productModel[index].price,
                      color: primaryColor,
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
