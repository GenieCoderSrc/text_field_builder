import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/input_decoration_style.dart';
import 'utils/input_focus.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.errorMsg,
    this.errorMaxLines,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.prefixIcon,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.textController,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.nextFocus,
    this.maxLines = 1,
    this.maxTexts,
    this.obscureText = false,
    this.borderRadius,
    this.filled,
    this.fillColor,
    this.isUnderLine,
    this.border,
  });

  // strings
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final bool obscureText;
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
  final int? maxTexts;

  // input decoration
  final double? borderRadius;
  final bool? filled;
  final Color? fillColor;
  final bool? isUnderLine;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      focusNode: focusNode,
      controller: textController,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: (_) =>
          InputFocusHandler.changeFocusField(context, focusNode!, nextFocus),
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(maxTexts ?? 100),
        FilteringTextInputFormatter.deny(RegExp("^[ ]*\$")),
      ],
      decoration: InputDecorationStyle.inputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorMsg: errorMsg,
        errorMaxLines: errorMaxLines,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        onTapPrefixIcon: onTapPrefixIcon,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        onTapSuffixIcon: onTapSuffixIcon,
        borderRadius: borderRadius,
        filled: filled,
        fillColor: fillColor,
        isUnderlined: isUnderLine,
        border: border,
      ),
    );
  }
}
