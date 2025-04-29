import 'package:flutter/material.dart';

import 'app_text_field.dart';
import 'model/field_model.dart';
import 'utils/input_focus.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key, this.fieldModel});

  final FieldModel? fieldModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: fieldModel?.bgColor,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
              fieldModel?.radius ?? 50), // Adjust the radius as needed
        ),
      ),
      child: AppTextInput(
        onTapSuffixIcon: () async {
          await Future<void>.delayed(
            const Duration(milliseconds: 10),
          );
          if (fieldModel?.onTapSuffixIcon != null) {
            fieldModel?.onTapSuffixIcon?.call();
          }
          fieldModel?.controller?.clear();
          InputFocusHandler.hiddenKeyboard(context);
        },
        textController: fieldModel?.controller,
        onChanged: fieldModel?.onChanged,
        onSubmitted: fieldModel?.onSubmitted ?? fieldModel?.onChanged,
        suffixIcon: fieldModel?.suffixIcon ?? Icons.clear,
        bgColor: fieldModel?.bgColor,
        hintText: fieldModel?.hintText ?? "Search...",
        labelText: fieldModel?.labelText,
        errorMsg: fieldModel?.errorMsg,
        errorMaxLines: fieldModel?.errorMaxLines,
        prefixIcon: fieldModel?.prefixIcon ?? Icons.search,
        onTapPrefixIcon: fieldModel?.onTapPrefixIcon,
        validator: fieldModel?.validator,
        onSaved: fieldModel?.onSaved,
        onFieldSubmitted: fieldModel?.onFieldSubmitted,
        onEditingComplete: fieldModel?.onEditingComplete,
        focusNode: fieldModel?.focusNode,
        nextFocus: fieldModel?.nextFocus,
        keyboardType: fieldModel?.keyboardType,
        textInputAction: fieldModel?.textInputAction,
        obscureText: fieldModel?.obscureText ?? false,
        maxLines: fieldModel?.maxLines,
        maxTexts: fieldModel?.maxTexts,
        borderRadius: fieldModel?.radius ?? 50,
        filled: fieldModel?.filled,
        fillColor: fieldModel?.fillColor,
        isUnderLine: fieldModel?.isUnderLine,
        border: fieldModel?.border,
      ),
    );
  }
}
