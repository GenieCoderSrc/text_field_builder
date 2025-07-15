import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordField extends StatefulWidget {
  // Content
  final String? hintText;
  final String? labelText;
  final String? errorMsg;

  // Behavior
  final bool obscureText;
  final bool visible;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onHidePassword;

  // Focus
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  // Control
  final TextEditingController? controller;

  // Style
  final IconData? prefixIcon;
  final double? horizontalPadding;

  // Input
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final int maxTextLength;

  const PasswordField({
    super.key,
    this.hintText,
    this.labelText,
    this.errorMsg,
    this.obscureText = true,
    this.visible = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.onEditingComplete,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.maxTextLength = 30,
    this.horizontalPadding = 16.0,
    this.onHidePassword,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: !_isPasswordVisible,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: (value) {
          widget.onFieldSubmitted?.call(value);
          if (widget.nextFocus != null) {
            FocusScope.of(context).requestFocus(widget.nextFocus);
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxTextLength),
          FilteringTextInputFormatter.deny(RegExp(r"^[ ]*$")),
        ],
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          errorText: widget.errorMsg,
          prefixIcon: Icon(widget.prefixIcon ?? Icons.lock_outline),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _isPasswordVisible
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
    widget.onHidePassword?.call();
  }
}

// class PasswordField extends StatefulWidget {
//   // strings
//   final String? hintText;
//   final String? labelText;
//   final String? errorMsg;
//   final bool obscureText;
//
//   // validation
//   final ValueChanged<String>? onChanged;
//   final FormFieldValidator<String>? validator;
//
//   // save
//   final FormFieldSetter? onSaved;
//   final Function? onFieldSubmitted;
//   final Function? onEditingComplete;
//
//   // focus
//   final FocusNode? focusNode;
//   final FocusNode? nextFocus;
//
//   // control
//   final TextEditingController? controller;
//
//   // keyboard
//   final TextInputType? keyboardType;
//   final TextInputAction textInputAction;
//   final int maxLines;
//   final int maxTexts;
//
//   final IconData? prefixIcon;
//   final bool visible;
//   final Function? hidePassword;
//
//   // style
//   final double? padding;
//
//   const PasswordField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.labelText,
//     this.errorMsg,
//     this.obscureText = false,
//     this.focusNode,
//     this.nextFocus,
//     this.onSaved,
//     this.onEditingComplete,
//     this.onFieldSubmitted,
//     this.onChanged,
//     this.validator,
//     this.textInputAction = TextInputAction.next,
//     this.keyboardType,
//     this.maxLines = 1,
//     this.maxTexts = 30,
//     this.prefixIcon,
//     this.visible = true,
//     this.hidePassword,
//     this.padding,
//   });
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool _visible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           left: widget.padding ?? PaddingConstant.kHPadding,
//           right: widget.padding ?? PaddingConstant.kHPadding,
//           bottom: widget.padding ?? PaddingConstant.kHPadding),
//       child: TextFormField(
//           validator: widget.validator,
//           onChanged: widget.onChanged,
//           onSaved: widget.onSaved,
//           focusNode: widget.focusNode,
//           controller: widget.controller,
//           obscureText: _visible,
//           maxLines: widget.maxLines,
//           keyboardType: widget.keyboardType ?? TextInputType.text,
//           textInputAction: widget.textInputAction,
//           onEditingComplete: widget.onEditingComplete as void Function()?,
//           onFieldSubmitted: (_) => InputFocusHandler.changeFocusField(
//               context, widget.focusNode!, widget.nextFocus),
//           inputFormatters: <TextInputFormatter>[
//             LengthLimitingTextInputFormatter(widget.maxTexts),
//             FilteringTextInputFormatter.deny(RegExp("^[ ]*\$")),
//           ],
//           decoration: InputDecorationStyle.inputDecoration(
//             hintText: widget.hintText,
//             labelText: widget.labelText,
//             errorMsg: widget.errorMsg,
//             prefixIcon: widget.prefixIcon != null
//                 ? Icon(widget.prefixIcon)
//                 : const Icon(Icons.lock_outline),
//             suffixIcon: Icon(
//               _visible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
//               size: 15.0,
//             ),
//             onTapSuffixIcon: _hidePassword,
//           )),
//     );
//   }
//
//   void _hidePassword() => setState(() {
//         _visible = !_visible;
//       });
// }
