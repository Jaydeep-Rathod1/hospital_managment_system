import 'package:flutter/material.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/strings_manager.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String titleText;
  final Color? buttonColor;
  final Color? textColor;
  final bool widthSmall;
  final double? fontSize;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;
  final BorderRadius? borderRadius;

  const ElevatedButtonCustom({
    Key? key,
    required this.titleText,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.borderSide,
    this.borderRadius,
    this.widthSmall = false,
    this.fontSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? ColorManager.primary,
          side: borderSide ?? const BorderSide(width: 0, color: Colors.transparent),
          shape: RoundedRectangleBorder(borderRadius: borderRadius??BorderRadius.circular(8.0)),
          textStyle: TextStyle(
            letterSpacing: 1.0
          ),
          padding: padding ?? const EdgeInsets.all(10)),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          titleText,
          style: TextStyle(
            color: textColor ?? ColorManager.white,
            fontWeight: FontWeight.w600,
            fontSize: fontSize ?? 18,
            fontFamily: FontConstants.fontPoppinsMedium
          ),
        ),
      ),
    );
  }
}
