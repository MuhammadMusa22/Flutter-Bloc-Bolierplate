import 'package:flutter/material.dart';
import 'package:tazah_tech_sale/config/app_colors.dart';
import 'package:tazah_tech_sale/config/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final double? horizontalMargin;
  final double? verticalMargin;
  final String? hintText;
  final Color? filledColor;
  final double? borderRadius;
  final bool? showBorder;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  const CustomTextField(
      {Key? key,
      this.horizontalMargin,
      required this.isPasswordField,
      this.controller,
      this.verticalMargin,
      this.hintText,
      this.filledColor,
      this.showBorder,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 58,
      // width: 341.0   ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFF8F8F8),
        border: Border.all(
          width: 1,
          color: const Color(0xFFE9E9E9),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? 0,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        validator: validator,
        obscureText: isPasswordField,
        keyboardType: keyboardType,
        controller: controller,
        style: TextStyle(
            fontSize: 14,
            letterSpacing: 0.64,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: BorderSide.none),
            errorStyle: TextStyle(fontSize: 10),
            errorBorder: InputBorder.none,
            prefixIconConstraints: BoxConstraints(
              minWidth: 50,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.only(right: 2, left: 8, top: 8),
            fillColor: Colors.transparent,
            filled: true,
            hintStyle: TextStyle(
                fontSize: 12,
                letterSpacing: 0.64,
                color: AppColors.lightGreyTextColor,
                fontWeight: FontWeight.w400),
            hintText: hintText ?? ''),
      ),
    );
  }
}
