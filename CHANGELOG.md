# Changelog

All notable changes to this project will be documented in this file.

## 0.0.4

### Aug 16, 2025

### ✨ Updated

- Updated `IntlPhoneField` with IntlPhoneFieldState typedef
- Updated `reusable_button` package

## 0.0.3

### Jul 15, 2025

### ✨ Enhancements

- update reusable_button packages

## 0.0.2

### Jul 15, 2025

### ✨ Enhancements

- Improved `InputDecorationStyle.inputDecoration`:
    - All parameters are now nullable with default fallbacks using `??`
    - Added support for customizable:
        - `TextStyle` parameters: `labelStyle`, `hintStyle`, `errorStyle`
        - `borderColor`, `borderWidth`, and `borderRadius`
        - `contentPadding`
        - Support for both `OutlineInputBorder` and `UnderlineInputBorder` via `isUnderlined` flag
- Enabled tappable `prefixIcon` and `suffixIcon` via `IconButton` support

### 🧪 Usage Improvements

- Improved flexibility and reusability for text fields across apps

---

## 0.0.1

- Initial release of `text_field_builder`
- Added `FieldModel` for reusable text field configurations
- Included `PasswordField` with toggle visibility and validation
- Included `PinCodeField` for secure 6-digit inputs
- Utility support with `InputFocusHandler` and `MobileNumberInfo`
- Added basic styling support for text fields
