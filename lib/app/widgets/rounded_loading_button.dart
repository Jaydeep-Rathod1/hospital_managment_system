import 'package:flutter/material.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomRoundedLoadingButton extends StatelessWidget {
  final Color? color;
  final Color? successColor;
  final RoundedLoadingButtonController controller;
  final VoidCallback onPressed;
  final Color? valueColor;
  final double? borderRadius;
  final String buttonText;
  final Color? textColor;
  final double? fontSize;

  const CustomRoundedLoadingButton({
    Key? key,
     this.color,
     this.successColor,
     this.valueColor,
     this.borderRadius,
     this.fontSize,
     this.textColor,
     required this.controller,
     required this.onPressed,
     required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      color: color ?? ColorManager.primary,
      successColor: successColor ?? ColorManager.success,
      controller: controller,
      onPressed: onPressed,
      valueColor: ColorManager.white,
      loaderStrokeWidth: 2,
      borderRadius: borderRadius??8.0,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          buttonText,
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
