import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  TextInputType keyBoardTybe;
  Widget? icon;
  String hintText;
  bool obsecureText;
  String? Function(String?)? validator;
  Function(String?) onChanged;
  CustomTextFormField({
    this.keyBoardTybe = TextInputType.text,
    this.icon,
    this.hintText = 'hintText',
    this.onChanged = _defaultOnChanged,
    this.validator,
    this.obsecureText = false,
  });
  static void _defaultOnChanged(String? value) {}
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardTybe,
      decoration: InputDecoration(
          hintText: '$hintText',
          suffixIcon: icon,
          fillColor: AppTheme.lightGrey,
          filled: true,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red, width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black, width: 1))),
      validator: validator,
      onChanged: onChanged,
      obscureText: obsecureText,
    );
  }
}
