import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function onSaved;
  final Function validator;

  CustomTextFormField({
    this.text ='',
    this.hintText = '',
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(

            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
