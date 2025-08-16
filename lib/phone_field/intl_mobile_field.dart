import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/countries.dart';
import 'model/mobile_number_info.dart';

/// Public typedef to safely expose the private state if needed
typedef IntlPhoneFieldState = _IntlPhoneFieldState;

class IntlPhoneField extends StatefulWidget {
  final bool obscureText;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final bool readOnly;
  final FormFieldSetter<MobileNumberInfo>? onSaved;

  final ValueChanged<MobileNumberInfo>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool autoValidate;

  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final void Function(String)? onSubmitted;

  final bool enabled;
  final Brightness keyboardAppearance;
  final String? initialValue;

  /// 2 Letter ISO Code
  final String? initialCountryCode;

  final InputDecoration? decoration;
  final TextStyle? style;
  final bool showDropdownIcon;
  final BoxDecoration dropdownDecoration;

  final List<TextInputFormatter>? inputFormatters;

  /// Placeholder Text to Display in Searchbar for searching countries
  final String searchText;

  /// Color of the country code
  final Color? countryCodeTextColor;

  /// Color of the drop down arrow
  final Color? dropDownArrowColor;

  const IntlPhoneField({
    super.key,
    this.initialCountryCode,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType = TextInputType.number,
    this.autoValidate = true,
    this.controller,
    this.focusNode,
    this.decoration,
    this.style,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.inputFormatters,
    this.enabled = true,
    this.keyboardAppearance = Brightness.light,
    this.searchText = 'Search by Country Name',
    this.countryCodeTextColor,
    this.dropDownArrowColor,
  });

  @override
  _IntlPhoneFieldState createState() => _IntlPhoneFieldState();
}

class _IntlPhoneFieldState extends State<IntlPhoneField> {
  late Map<String, String> _selectedCountry;
  late List<Map<String, String>> filteredCountries;
  FormFieldValidator<String>? validator;
  String? _mobileNumber = '';

  @override
  void initState() {
    super.initState();
    _selectedCountry = countries.firstWhere(
          (item) => item['code'] == (widget.initialCountryCode ?? 'US'),
    );
    filteredCountries = countries;

    validator = widget.autoValidate
        ? ((value) => value?.length != 10 ? 'Invalid Mobile Number' : null)
        : widget.validator;
  }

  Future<void> _changeCountry() async {
    filteredCountries = countries;

    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    labelText: widget.searchText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredCountries = countries
                          .where(
                            (country) => country['name']!
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            filteredCountries[index]['flag']!,
                            style: const TextStyle(fontSize: 30),
                          ),
                          title: Text(
                            filteredCountries[index]['name']!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          trailing: Text(
                            filteredCountries[index]['dial_code']!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          onTap: () {
                            _selectedCountry = filteredCountries[index];
                            if (widget.onChanged != null) {
                              widget.onChanged!(
                                MobileNumberInfo(
                                  countryISOCode: _selectedCountry['code'],
                                  countryCode: _selectedCountry['dial_code'],
                                  number: _mobileNumber,
                                ),
                              );
                            }
                            Navigator.of(context).pop();
                            widget.focusNode?.requestFocus();
                          },
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildFlagsButton(),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            textAlign: widget.textAlign,
            textInputAction: TextInputAction.next,
            onTap: widget.onTap,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onSubmitted,
            decoration: widget.decoration,
            style: widget.style,
            onSaved: (value) {
              _mobileNumber = value;
              if (value != null && widget.onSaved != null) {
                widget.onSaved!(
                  MobileNumberInfo(
                    countryISOCode: _selectedCountry['code'],
                    countryCode: _selectedCountry['dial_code'],
                    number: value,
                  ),
                );
              }
            },
            onChanged: (value) {
              _mobileNumber = value;
              if (widget.onChanged != null) {
                widget.onChanged!(
                  MobileNumberInfo(
                    countryISOCode: _selectedCountry['code'],
                    countryCode: _selectedCountry['dial_code'],
                    number: value,
                  ),
                );
              }
            },
            validator: validator,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            keyboardAppearance: widget.keyboardAppearance,
          ),
        ),
      ],
    );
  }

  DecoratedBox _buildFlagsButton() {
    return DecoratedBox(
      decoration: widget.dropdownDecoration,
      child: InkWell(
        borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
        onTap: _changeCountry,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.showDropdownIcon) ...[
                Icon(Icons.arrow_drop_down, color: widget.dropDownArrowColor),
                const SizedBox(width: 4),
              ],
              Text(
                _selectedCountry['flag']!,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 8),
              FittedBox(
                child: Text(
                  _selectedCountry['dial_code']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: widget.countryCodeTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
