import 'package:ecommerce_app/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String name, image, description, price, size,shortDescription;
  Color color;

  ProductModel({
    this.name,
    this.image,
    this.description,
    this.price,
    this.size,
    this.color,
    this.shortDescription
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
    shortDescription = map['shortDescription'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'size': size,
      'color': color,
      'shortDescription': shortDescription,

    };
  }
}
