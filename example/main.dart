import 'package:flutter/material.dart';
import 'package:text_field_builder/text_field_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Builder Demo',
      home: const TextFieldDemoPage(),
    );
  }
}

class TextFieldDemoPage extends StatefulWidget {
  const TextFieldDemoPage({super.key});

  @override
  State<TextFieldDemoPage> createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  MobileNumberInfo? _phoneNumber;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Builder Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextInput(
              labelText: 'Username',
              hintText: 'Enter your username',
              textController: _usernameController,
              focusNode: _usernameFocus,
              nextFocus: _emailFocus,
              onSubmitted: (value) => InputFocusHandler.changeFocusField(
                context,
                _usernameFocus,
                _emailFocus,
              ),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              textController: _emailController,
              focusNode: _emailFocus,
              nextFocus: _passwordFocus,
              validator: (value) => (value == null || !value.contains('@'))
                  ? 'Invalid email'
                  : null,
              onChanged: (value) {},
              onFieldSubmitted: () => InputFocusHandler.changeFocusField(
                context,
                _emailFocus,
                _passwordFocus,
              ),
            ),
            const SizedBox(height: 20),
            AppPhoneField(
              initialCountryCode: 'US',
              onChanged: (MobileNumberInfo? info) {
                setState(() {
                  _phoneNumber = info;
                });

                debugPrint(
                  'phoneNumber: ${_phoneNumber?.completeNumber} info: ${info.toString()}',
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Phone number required';
                return null;
              },
              focusNode: FocusNode(),
              nextFocus: _passwordFocus,
              errorMsg: null,
            ),
            const SizedBox(height: 20),
            PasswordField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              labelText: 'Password',
              hintText: 'Enter your password',
              validator: (value) => value!.isEmpty ? 'Password required' : null,
              nextFocus: null,
            ),
            const SizedBox(height: 20),
            PinCodeField(
              onChanged: (value) {
                debugPrint('PIN code: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
