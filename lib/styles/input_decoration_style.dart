import 'package:flutter/material.dart';

class InputDecorationStyle {
  static InputDecoration inputDecoration({
    // Text
    String? hintText,
    String? labelText,
    String? errorMsg,
    int? errorMaxLines,

    // Icons
    Icon? prefixIcon,
    VoidCallback? onTapPrefixIcon,
    Icon? suffixIcon,
    VoidCallback? onTapSuffixIcon,

    // Text styles
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,

    // Border & fill
    bool? isUnderlined,
    bool? filled,
    Color? fillColor,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
    InputBorder? border,

    // Padding
    EdgeInsetsGeometry? contentPadding,
  }) {
    final Color effectiveBorderColor = borderColor ?? Colors.blue;
    final double effectiveBorderWidth = borderWidth ?? 1.5;
    final double effectiveRadius = borderRadius ?? 8.0;
    final bool useUnderline = isUnderlined ?? false;

    final OutlineInputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(effectiveRadius),
      borderSide: BorderSide(
        color: effectiveBorderColor,
        width: effectiveBorderWidth,
      ),
    );

    final UnderlineInputBorder underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: effectiveBorderColor,
        width: effectiveBorderWidth,
      ),
    );

    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      errorText: errorMsg,
      errorMaxLines: errorMaxLines,

      // Text Styles
      labelStyle: labelStyle ?? const TextStyle(color: Colors.blueGrey),
      hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
      errorStyle:
          errorStyle ??
          const TextStyle(fontSize: 12.0, color: Colors.redAccent, height: 1.3),

      // Icons
      prefixIcon: prefixIcon != null && onTapPrefixIcon != null
          ? IconButton(icon: prefixIcon, onPressed: onTapPrefixIcon)
          : prefixIcon,
      suffixIcon: suffixIcon != null
          ? IconButton(icon: suffixIcon, onPressed: onTapSuffixIcon)
          : null,

      // Fill
      filled: filled ?? true,
      fillColor: fillColor ?? Colors.blueGrey.shade50,

      // Padding
      contentPadding: contentPadding ?? const EdgeInsets.all(14.0),

      // Borders
      border: useUnderline ? underlineBorder : (border ?? outlineBorder),
      enabledBorder: useUnderline ? underlineBorder : outlineBorder,
      focusedBorder: useUnderline ? underlineBorder : outlineBorder,
    );
  }
}

// class InputDecorationStyle {
//   static InputDecoration inputDecoration({
//     final String? hintText = "",
//     final String? labelText = "",
//     final String? errorMsg,
//     final int? errorMaxLines,
//     final Icon? prefixIcon,
//     final Function? onTapPrefixIcon,
//     final Icon? suffixIcon,
//     final Function? onTapSuffixIcon,
//     final double? borderRadius,
//     final bool? filled,
//     final Color? fillColor,
//     final bool? isUnderLine,
//     final InputBorder? border,
//   }) {
//     return InputDecoration(
//       labelText: labelText,
//       labelStyle: const TextStyle(color: Colors.blueGrey),
//       contentPadding: const EdgeInsets.all(14.0),
//       errorMaxLines: errorMaxLines,
//       hintText: hintText,
//       errorText: errorMsg,
//       errorStyle:
//           AppTxtStyles.kMidSmallTextStyle.copyWith(color: Colors.redAccent),
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon != null
//           ? IconButton(
//               icon: suffixIcon,
//               onPressed: onTapSuffixIcon as void Function()?,
//             )
//           : null,
//       // For Underline input style
//       border: isUnderLine ?? false
//           ? const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.blue, // Set your desired underline color
//                 width: 2.0, // Set underline width
//               ),
//             )
//           // If border is not defined, use a default OutlineInputBorder
//           : border ??
//               OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // Set your desired border color
//                   width: 1.5, // Set border width
//                 ),
//               ),
//       filled: filled ?? true,
//       fillColor: fillColor ?? Colors.blueGrey.shade50,
//     );

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
//   }
// }
