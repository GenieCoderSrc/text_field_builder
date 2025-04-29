import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';

class TextFieldStyle {
  static InputDecoration inputDecoration({
    final String? hintText = "",
    final String? labelText = "",
    final String? errorMsg,
    final int? errorMaxLines,
    final Icon? prefixIcon,
    final Function? onTapPrefixIcon,
    final Icon? suffixIcon,
    final Function? onTapSuffixIcon,
    final double? borderRadius,
    final bool? filled,
    final Color? fillColor,
    final bool? isUnderLine,
    final InputBorder? border,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      contentPadding: const EdgeInsets.all(14.0),
      errorMaxLines: errorMaxLines,
      hintText: hintText,
      errorText: errorMsg,
      errorStyle:
          AppTxtStyles.kMidSmallTextStyle.copyWith(color: Colors.redAccent),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: suffixIcon,
              onPressed: onTapSuffixIcon as void Function()?,
            )
          : null,
      // For Underline input style
      border: isUnderLine ?? false
          ? const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue, // Set your desired underline color
                width: 2.0, // Set underline width
              ),
            )
          // If border is not defined, use a default OutlineInputBorder
          : border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                borderSide: const BorderSide(
                  color: Colors.blue, // Set your desired border color
                  width: 1.5, // Set border width
                ),
              ),
      filled: filled ?? true,
      fillColor: fillColor ?? Colors.blueGrey.shade50,
    );

    // return InputDecoration(
    //   labelText: labelText,
    //   labelStyle: const TextStyle(color: Colors.blueGrey),
    //   contentPadding: const EdgeInsets.all(14.0),
    //   // Adjust the vertical padding
    //   errorMaxLines: errorMaxLines,
    //   hintText: hintText,
    //   errorText: errorMsg,
    //   errorStyle:
    //       AppTxtStyles.kMidSmallTextStyle.copyWith(color: Colors.redAccent),
    //   prefixIcon: prefixIcon,
    //   suffixIcon: suffixIcon != null
    //       ? IconButton(
    //           icon: suffixIcon,
    //           onPressed: onTapSuffixIcon as void Function()?,
    //         )
    //       : null,
    //   border: isUnderLine ?? false
    //       ? OutlineInputBorder(
    //           borderSide: BorderSide(
    //             color: Colors.blue, // Set your desired border color
    //             width: 2.0, // Set border width
    //           ),
    //         )
    //       : border ??
    //           OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
    //             borderSide: const BorderSide(
    //               width: 0,
    //               style: BorderStyle.none,
    //             ),
    //           ),
    //   filled: filled ?? true,
    //   fillColor: fillColor ?? Colors.blueGrey.shade50,
    // );
  }
}
