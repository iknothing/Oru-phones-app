import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants/colorpallets.dart';

class TextField extends StatelessWidget {
  String labelText;
  String placeholder;
  bool isPasswordTextField;
  double width;
  TextEditingController controller;
  IconData Prefixicon;
  IconData suffixixicon;
  bool isborder;
  int maxline;

  TextField(
      {super.key,
      required this.width,
      required this.controller,
      required this.placeholder,
      required this.labelText,
      required this.isPasswordTextField,
      required this.Prefixicon,
      required this.suffixixicon,
      required this.isborder,
      required this.maxline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
      child: Container(
        width: width,
        child: TextFormField(
            autocorrect: true,
            maxLines: maxline,
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'password field should not be empty ';
              // } else {
              //   return null;
              // }
            },
            controller: controller,
            onChanged: (value) {},
            decoration: InputDecoration(
              prefixIcon: Icon(
                Prefixicon,
                color: TheamColors.primaryColor,
              ),
              hintText: placeholder,
              labelText: labelText,
              labelStyle:  TextStyle(
                color: TheamColors.primaryColor,
              ),
              hintStyle: TextStyle(
                color: TheamColors.primaryColor,
              ),
              filled: true,
              fillColor: TheamColors.primaryColor,
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: TheamColors.primaryColor, width: 1),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: TheamColors.primaryColor, width: 2),
              ),
            )),
      ),
    );
  }
}
