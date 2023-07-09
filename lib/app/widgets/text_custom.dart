import 'package:flutter/material.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final double? letterSpacing;
  final String? fontFamily;
  final TextStyle? textStyle;
  final double? fontSize;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final int? maxLines;


  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.letterSpacing,
    this.textStyle,
    this.fontFamily,
    this.fontSize,
    this.textOverflow,
    this.textAlign,
    this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: textStyle ?? TextStyle(
        fontSize: fontSize ?? FontSize.s12,
        color: color ?? ColorManager.black,
        fontFamily: fontFamily ?? FontConstants.fontPoppinsRegular,
        fontWeight: fontWeight ?? FontWeight.w600,
        // overflow: textOverflow ?? TextOverflow.visible,
        wordSpacing: wordSpacing ?? 1,
        letterSpacing: letterSpacing ?? 1,

      ),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      overflow: textOverflow ?? TextOverflow.visible,

    );
  }
}