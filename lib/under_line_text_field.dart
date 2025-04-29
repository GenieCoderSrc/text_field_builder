import 'package:flutter/material.dart';

import 'app_text_form_field.dart';

class UnderLineTextField extends StatelessWidget {
  const UnderLineTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.errorMsg,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.textController,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.onTapPrefixIcon,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.nextFocus,
    this.maxLines = 1,
    this.maxTexts = 100,
    this.obscureText = false,
    this.filled = false,
    this.fillColor,
    this.isUnderLine,
    this.border,
  });

  // strings
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final bool obscureText;

  // Icons
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTapPrefixIcon;

  // validation
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  // save
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onFieldSubmitted;
  final VoidCallback? onEditingComplete;

  // focus
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  // control
  final TextEditingController? textController;

  // keyboard
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int maxTexts;

  // input decoration
  final bool? filled;
  final Color? fillColor;
  final bool? isUnderLine;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      labelText: labelText,
      hintText: hintText,
      errorMsg: errorMsg,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onTapSuffixIcon: onTapSuffixIcon,
      onTapPrefixIcon: onTapPrefixIcon,
      textController: textController,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      nextFocus: nextFocus,
      maxLines: maxLines,
      maxTexts: maxTexts,
      obscureText: obscureText,
      filled: filled,
      fillColor: fillColor,
      isUnderLine: true,
    );
  }
}
