import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 50),
      enableActiveFill: true,
      obscureText: true,
      autoFocus: true,
      obscuringCharacter: '☬',
      boxShadows: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 1),
          color: Colors.blue.shade100,
          blurRadius: 5,
        ),
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        activeColor: Colors.white,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.blue.shade100,
        selectedFillColor: Colors.white,
      ),
    );
  }
}
