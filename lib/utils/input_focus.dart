import 'package:flutter/material.dart';

class InputFocusHandler {
  static dynamic changeFocusField(
    BuildContext context,
    FocusNode current,
    FocusNode? next,
  ) {
    current.unfocus();

    next != null
        ? FocusScope.of(context).requestFocus(next)
        : hiddenKeyboard(context);
  }

  static void hiddenKeyboard(BuildContext context) {
    return FocusManager.instance.primaryFocus!.unfocus();
  }

  ///On clear text field
  static Future<void> clearTextField(
      TextEditingController textController) async {
    await Future<int>.delayed(const Duration(milliseconds: 2));
    textController.text = '';
  }

  ///Singleton repository
  static final InputFocusHandler _instance = InputFocusHandler._internal();

  factory InputFocusHandler() {
    return _instance;
  }

  InputFocusHandler._internal();
}
