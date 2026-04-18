import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/app_colors.dart';



class CustomTextFormField extends StatelessWidget {
  final InputBorder? focusedBorder, enabledBorder, errorBorder;
  final InputDecoration? decoration;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final Color? fillColor, cursorColor, borderColor;
  final bool? filled, obscureText, readOnly;
  final TextStyle? textStyle, hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final BorderRadius? borderRadiusAll;
  final EdgeInsets? contentPadding;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool? enabled;
  const CustomTextFormField(
      {super.key,
        this.hintText,
        required this.controller,
        this.focusNode,
        this.onTapOutside,
        this.onChanged,
        this.prefixIcon,
        this.suffixIcon,
        this.focusedBorder,
        this.enabledBorder,
        this.errorBorder,
        this.decoration,
        this.fillColor,
        this.filled,
        this.cursorColor,
        this.borderColor,
        this.textStyle,
        this.hintStyle,
        this.obscureText,
        this.keyboardType,
        this.validator,
        this.onSaved,
        this.onFieldSubmitted,
        this.onEditingComplete,
        this.autoValidateMode,
        this.maxLines,
        this.maxLength,
        this.textInputAction,
        this.borderRadiusAll,
        this.contentInsertionConfiguration,
        this.contentPadding,
        this.width,
        this.readOnly,
        this.inputFormatters,
        this.onTap,
        this.enabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLength: maxLength,
        minLines: null,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
        onTap: onTap,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        enabled: enabled,
        onSaved: onSaved,
        validator: validator,
        readOnly: readOnly ?? false,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        ///cursorColor: cursorColor ?? AppColors.primary,

        textAlign: TextAlign.left,
        style: textStyle,
        /*
        ??
            poppinsRegularTextstyle.copyWith(
                fontSize: 18, color: AppColors.black),
         */
        keyboardType: keyboardType,
        autovalidateMode: autoValidateMode,
        textInputAction: textInputAction,

        obscureText: obscureText ?? false,
        contentInsertionConfiguration: contentInsertionConfiguration,

        maxLines: maxLines ?? 1,
        // Allow unlimited number of lines for multiline input
        decoration: decoration ??
            InputDecoration(
              contentPadding: contentPadding,
              // counter: Container(),
              counterText: "",

              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.black,
                        width: 1),
                  ),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.black,
                        width: 1),
                  ),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                    borderRadius: borderRadiusAll ??
                        const BorderRadius.all(Radius.circular(12)),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadiusAll ??
                    const BorderRadius.all(Radius.circular(12)),
                borderSide:
                BorderSide(color: borderColor ?? Colors.red, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadiusAll ??
                    const BorderRadius.all(Radius.circular(20)),
                borderSide:
                BorderSide(color: borderColor ?? Colors.red, width: 1),
              ),
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),

              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,

              // errorStyle: poppinsTextStyle.copyWith(fontSize: 10, color: AppColors.errorColor),
              hintText: hintText,
              hintStyle: hintStyle ,
              /*
              ??
                  poppinsRegularTextstyle.copyWith(
                      fontSize: 16, color: AppColors.black.withValues(alpha: 0.5))
               */
              fillColor: fillColor,
              filled: filled ?? true,
            ),
      ),
    );
  }
}