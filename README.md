# text_field_builder

A customizable and flexible Flutter package that helps you build text input fields, including password fields and PIN code inputs, using reusable models and styling components.

## Features

- `FieldModel` to configure various properties of text fields
- `PasswordField` widget with toggleable visibility and input validation
- `PinCodeField` widget for entering secure codes (e.g., OTPs)
- Easy management of input focus with `InputFocusHandler`
- Country data list for use in forms (e.g., phone number inputs)
- Simple configuration for border radius and input field decorations

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  text_field_builder: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Getting Started

### Basic TextField using FieldModel
```dart
final fieldModel = FieldModel(
  labelText: 'Username',
  hintText: 'Enter your username',
  errorMsg: 'Username is required',
);
```

### PasswordField
```dart
PasswordField(
  controller: _passwordController,
  labelText: 'Password',
  hintText: 'Enter your password',
  validator: (value) => value!.isEmpty ? 'Required' : null,
);
```

### PinCodeField
```dart
PinCodeField(
  onChanged: (value) {
    print('PIN: $value');
  },
);
```

## Utility Classes

### InputFocusHandler
Change focus between fields easily:
```dart
InputFocusHandler.changeFocusField(context, currentFocus, nextFocus);
```

### MobileNumberInfo
Helper for formatting international numbers:
```dart
final info = MobileNumberInfo(
  countryCode: '+1',
  countryISOCode: 'US',
  number: '1234567890',
);
print(info.completeNumber); // +11234567890
```

## Customization

You can customize input decorations, keyboard types, actions, and much more through `FieldModel` and widget parameters.

## License

MIT License. See `LICENSE` file for details.

