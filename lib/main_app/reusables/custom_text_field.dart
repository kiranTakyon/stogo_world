import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextFormField extends StatelessWidget {
  final Color? cursonColor;
  final TextEditingController? controller;
  const CustomTextFormField({super.key, this.cursonColor, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      controller: controller,
      cursorColor: cursonColor ?? white,
      decoration: InputDecoration(
        filled: true,
        fillColor: transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
