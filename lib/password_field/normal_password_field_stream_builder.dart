import 'package:flutter/material.dart';
import 'package:text_field_builder/app_text_form_field.dart';
import 'package:text_field_builder/constants/widget_txt_const.dart';

class NormalPasswordFieldStreamBuilder extends StatefulWidget {
  const NormalPasswordFieldStreamBuilder({
    super.key,
    this.stream,
    this.textController,
    this.onChanged,
    this.validator,
    this.labelText,
    this.textInputAction,
  });

  final Stream<String>? stream;

  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  final String? labelText;
  final TextInputAction? textInputAction;

  @override
  State<NormalPasswordFieldStreamBuilder> createState() =>
      _NormalPasswordFieldStreamBuilderState();
}

class _NormalPasswordFieldStreamBuilderState
    extends State<NormalPasswordFieldStreamBuilder> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot<String?> snap) {
        return AppTextFormField(
          prefixIcon: Icons.lock,
          suffixIcon: _obscurePassword
              ? Icons.visibility_off
              : Icons.visibility,
          onTapSuffixIcon: _togglePasswordVisibility,
          obscureText: _obscurePassword,
          textController: widget.textController,
          labelText: widget.labelText ?? WidgetTxtConst.password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: widget.textInputAction,
          errorMsg: snap.hasError ? snap.error.toString() : null,
          validator: widget.validator,
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
