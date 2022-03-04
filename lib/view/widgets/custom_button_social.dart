import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String imageName;
  final String text;
  final Function onPress;

  CustomButtonSocial({
    this.text,
    this.imageName,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
            shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(imageName),
            ),
            SizedBox(
              width: 60,
            ),
            CustomText(
              text: text,
              fontSize: 14,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
