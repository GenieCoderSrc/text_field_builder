import 'package:flutter/material.dart';

import 'styles/text_field_style.dart';

class AppTextInput extends StatelessWidget {
  // strings
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final bool obscureText;

  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTapPrefixIcon;

  // validation
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  // OnTap
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  final GestureTapCallback? onTap;

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
  final int? errorMaxLines;

  // input decoration
  final double? borderRadius;
  final bool? filled;
  final Color? fillColor;
  final bool? isUnderLine;
  final InputBorder? border;

  // style
  final double? hPadding;
  final double? vPadding;

  final Color? bgColor;

  const AppTextInput({
    super.key,
    this.hintText,
    this.labelText,
    this.textController,
    this.focusNode,
    this.onTapSuffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.errorMsg,
    this.maxLines = 1,
    this.maxTexts,
    this.errorMaxLines,
    this.bgColor,
    this.prefixIcon,
    this.onTapPrefixIcon,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.nextFocus,
    this.hPadding,
    this.vPadding,
    this.borderRadius,
    this.filled,
    this.fillColor,
    this.isUnderLine,
    this.border,
  });

  Widget _buildErrorLabel(BuildContext context) {
    if (errorMsg == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        errorMsg!,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.error),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).cardColor,
        // color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(borderRadius ?? 25),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          TextField(
            onTap: onTap,
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: onSubmitted,
            controller: textController,
            focusNode: focusNode,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            decoration: TextFieldStyle.inputDecoration(
              hintText: hintText,
              labelText: labelText,
              prefixIcon: Icon(prefixIcon),
              onTapPrefixIcon: onTapPrefixIcon,
              suffixIcon: Icon(suffixIcon),
              onTapSuffixIcon: onTapSuffixIcon,
              borderRadius: borderRadius,
              filled: filled,
              fillColor: fillColor,
              isUnderLine: isUnderLine,
              border: border,
            ),
            // decoration: InputDecoration(
            //   hintText: hintText,
            //   suffixIcon: suffixIcon != null
            //       ? InkWell(
            //           onTap: onTapSuffixIcon,
            //           child: Icon(suffixIcon),
            //         )
            //       : null,
            //   border: InputBorder.none,
            // ),
          ),
          _buildErrorLabel(context)
        ],
      ),
    );
  }
}
