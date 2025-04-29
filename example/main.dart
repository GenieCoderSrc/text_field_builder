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
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Builder Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              focusNode: _usernameFocus,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
              onFieldSubmitted: (_) => InputFocusHandler.changeFocusField(
                context,
                _usernameFocus,
                _passwordFocus,
              ),
            ),
            const SizedBox(height: 20),
            PasswordField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              labelText: 'Password',
              hintText: 'Enter your password',
              validator: (value) => value!.isEmpty ? 'Password required' : null,
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
