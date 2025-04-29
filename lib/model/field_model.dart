import 'package:flutter/material.dart';

class FieldModel {
  FieldModel({
    this.labelText,
    this.hintText,
    this.errorMsg,
    this.obscureText,
    this.errorMaxLines,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.prefixIcon,
    this.onTapPrefixIcon,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.onSubmitted,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.nextFocus,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.maxTexts,
    this.radius,
    this.filled,
    this.fillColor,
    this.isUnderLine,
    this.border,
    this.bgColor,
  });

  // Define copyWith method
  FieldModel copyWith({
    String? labelText,
    String? hintText,
    String? errorMsg,
    bool? obscureText,
    int? errorMaxLines,
    IconData? suffixIcon,
    VoidCallback? onTapSuffixIcon,
    IconData? prefixIcon,
    VoidCallback? onTapPrefixIcon,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onFieldSubmitted,
    VoidCallback? onEditingComplete,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? maxLines,
    int? maxTexts,
    double? radius,
    bool? filled,
    Color? fillColor,
    bool? isUnderLine,
    InputBorder? border,
    Color? bgColor,
  }) {
    return FieldModel(
      labelText: labelText ?? this.labelText,
      hintText: hintText ?? this.hintText,
      errorMsg: errorMsg ?? this.errorMsg,
      obscureText: obscureText ?? this.obscureText,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      onTapSuffixIcon: onTapSuffixIcon ?? this.onTapSuffixIcon,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      onTapPrefixIcon: onTapPrefixIcon ?? this.onTapPrefixIcon,
      onChanged: onChanged ?? this.onChanged,
      validator: validator ?? this.validator,
      onSaved: onSaved ?? this.onSaved,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      focusNode: focusNode ?? this.focusNode,
      nextFocus: nextFocus ?? this.nextFocus,
      controller: controller ?? this.controller,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      maxLines: maxLines ?? this.maxLines,
      maxTexts: maxTexts ?? this.maxTexts,
      radius: radius ?? this.radius,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      isUnderLine: isUnderLine ?? this.isUnderLine,
      border: border ?? this.border,
      bgColor: bgColor ?? this.bgColor,
    );
  }

  // strings
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final bool? obscureText;
  final int? errorMaxLines;

  // icons
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTapPrefixIcon;

  // validation
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  // save
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onFieldSubmitted;
  final VoidCallback? onEditingComplete;

  // focus
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  // control
  final TextEditingController? controller;

  // keyboard
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxTexts;

  // input decoration
  final double? radius;
  final bool? filled;
  final Color? fillColor;
  final bool? isUnderLine;
  final InputBorder? border;

  // Styles
  final Color? bgColor;
}
