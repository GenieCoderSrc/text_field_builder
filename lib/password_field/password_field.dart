import 'package:app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styles/text_field_style.dart';
import '../utils/input_focus.dart';

class PasswordField extends StatefulWidget {
  // strings
  final String? hintText;
  final String? labelText;
  final String? errorMsg;
  final bool obscureText;

  // validation
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  // save
  final FormFieldSetter? onSaved;
  final Function? onFieldSubmitted;
  final Function? onEditingComplete;

  // focus
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  // control
  final TextEditingController? controller;

  // keyboard
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final int maxTexts;

  final IconData? prefixIcon;
  final bool visible;
  final Function? hidePassword;

  // style
  final double? padding;

  const PasswordField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorMsg,
    this.obscureText = false,
    this.focusNode,
    this.nextFocus,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.maxLines = 1,
    this.maxTexts = 30,
    this.prefixIcon,
    this.visible = true,
    this.hidePassword,
    this.padding,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.padding ?? PaddingConstant.kHPadding,
          right: widget.padding ?? PaddingConstant.kHPadding,
          bottom: widget.padding ?? PaddingConstant.kHPadding),
      child: TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          focusNode: widget.focusNode,
          controller: widget.controller,
          obscureText: _visible,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete as void Function()?,
          onFieldSubmitted: (_) => InputFocusHandler.changeFocusField(
              context, widget.focusNode!, widget.nextFocus),
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(widget.maxTexts),
            FilteringTextInputFormatter.deny(RegExp("^[ ]*\$")),
          ],
          decoration: TextFieldStyle.inputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorMsg: widget.errorMsg,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : const Icon(Icons.lock_outline),
            suffixIcon: Icon(
              _visible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              size: 15.0,
            ),
            onTapSuffixIcon: _hidePassword,
          )),
    );
  }

  void _hidePassword() => setState(() {
        _visible = !_visible;
      });
}
