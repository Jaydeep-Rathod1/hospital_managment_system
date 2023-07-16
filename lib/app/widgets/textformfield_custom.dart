import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/strings_manager.dart';


class TextFormFieldCustom extends StatefulWidget {
  final String? titleText;
  final String? hintText;
  final AlignmentGeometry? titleAlign;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;
  final Color? fillColor;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final BoxShadow? boxShadow;
  final FocusNode? focusNode;

  final List<TextInputFormatter>? textInputFormatter;

  const TextFormFieldCustom({
    Key? key,
    this.titleText,
    this.hintText,
    this.titleAlign,
    required this.textController,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.textCapitalization,
    this.obscureText,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.margin,
    this.fontWeight,
    this.fontFamily,
    this.floatingLabelBehavior,
    this.onTap, this.boxShadow, this.textInputFormatter, this.focusNode, this.fillColor,
  }) : super(key: key);

  @override
  TextFormFieldCustomState createState() => TextFormFieldCustomState();
}

class TextFormFieldCustomState extends State<TextFormFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: widget.margin??const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.textController,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType??TextInputType.text,
        readOnly: widget.readOnly ?? false,
        maxLines: (widget.maxLines == null) ? 1 : widget.maxLines,
        textCapitalization:widget.textCapitalization ?? TextCapitalization.none,
        validator: widget.validator??(val){
          if(val!.isEmpty) {
            return "Please Enter ${widget.hintText}";
          } else {
            return null;
          }
        },
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        enabled: widget.enabled,
        maxLength: widget.maxLength,
        style: TextStyle(
            fontSize: FontSize.s14,
            color: Colors.black,
            fontWeight: widget.fontWeight??FontWeight.normal,
            fontFamily: widget.fontFamily??FontConstants.fontPoppinsRegular
        ),
        inputFormatters: widget.textInputFormatter??[],
        cursorColor: ColorManager.black.withOpacity(0.8),
        decoration: InputDecoration(
          labelText: widget.titleText,
          hintText: widget.hintText,
          counterText: "",
          filled: true,
          isDense: true,
          errorMaxLines: 3,
          floatingLabelBehavior: widget.floatingLabelBehavior??FloatingLabelBehavior.auto,
          contentPadding: widget.contentPadding ?? const EdgeInsets.fromLTRB(13, 13, 13, 13),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          fillColor: widget.fillColor ?? Colors.white.withOpacity(0.1),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          labelStyle: const TextStyle(color: Colors.black,fontFamily: FontConstants.fontPoppinsRegular),
          hintStyle:  TextStyle(color: ColorManager.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: ColorManager.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
