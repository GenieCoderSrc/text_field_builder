# text_field_builder

A customizable and flexible Flutter package that helps you build text input fields, including password fields and PIN code inputs, using reusable models and styling components.

## Features

* `FieldModel` to configure various properties of text fields
* `PasswordField` widget with toggleable visibility and input validation
* `PinCodeField` widget for entering secure codes (e.g., OTPs)
* `AppPhoneField` for formatted phone number input with country picker
* `AppSearchField` for toggleable in-app search with clear button
* `InputFocusHandler` to easily manage input focus between fields
* `MobileNumberInfo` for working with international phone numbers
* Configurable `InputDecorationStyle` for border, padding, radius, etc.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  text_field_builder: latest_version
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

### PhoneField with Country Code Picker

```dart
AppPhoneField(
  onChanged: (info) => print(info.completeNumber),
);
```

### Search Field

```dart
AppSearchField(
  fieldModel: FieldModel(
    hintText: 'Search',
    controller: _searchController,
    onChanged: (value) => print('Searching: $value'),
  ),
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

You can customize input decorations, keyboard types, padding, border styles, colors, icons, and much more through `FieldModel` and widget parameters. The `InputDecorationStyle` class allows you to:

* Set custom `borderRadius`, `borderColor`, and `borderWidth`
* Define padding and filled background
* Use prefix/suffix icons with callbacks
* Style error messages and hints

## License

MIT License. See `LICENSE` file for details.

---

Made with ❤️ by Shohidul Islam
[https://github.com/GenieCoderSrc/text_field_builder](https://github.com/GenieCoderSrc/text_field_builder)
