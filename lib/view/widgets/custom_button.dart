import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(18),
          backgroundColor: primaryColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
