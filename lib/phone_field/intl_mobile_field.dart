import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/countries.dart';
import 'model/mobile_number_info.dart';

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

  const IntlPhoneField(
      {super.key, this.initialCountryCode,
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
      this.dropDownArrowColor});

  @override
  _IntlPhoneFieldState createState() => _IntlPhoneFieldState();
}

class _IntlPhoneFieldState extends State<IntlPhoneField> {
  Map<String, String> _selectedCountry =
      countries.firstWhere((Map<String, String> item) => item['code'] == 'US');
  List<Map<String, String>> filteredCountries = countries;
  FormFieldValidator<String>? validator;

  // declare mobile obj
  String? _mobileNumber = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialCountryCode != null) {
      _selectedCountry = countries.firstWhere((Map<String, String> item) =>
          item['code'] == widget.initialCountryCode);
    }
    validator = widget.autoValidate
        ? ((String? value) =>
            value?.length != 10 ? 'Invalid Mobile Number' : null)
        : widget.validator;
  }

  Future<void> _changeCountry() async {
    filteredCountries = countries;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext ctx, Function setState) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    labelText: widget.searchText,
                  ),
                  onChanged: (String value) {
                    setState(() {
                      filteredCountries = countries
                          .where((Map<String, String> country) =>
                              country['name']!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();

                      debugPrint('filteredCountries: $value');
                    });
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (BuildContext ctx, int index) => Column(
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
                            // call onChanged method here for update country code & phone number
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
                            if (widget.focusNode?.requestFocus != null) {
                              widget.focusNode!.requestFocus();
                            }
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
            onTap: () {
              if (widget.onTap != null) widget.onTap!();
            },
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: (String s) {
              if (widget.onSubmitted != null) widget.onSubmitted!(s);
            },
            decoration: widget.decoration,
            style: widget.style,
            onSaved: (String? value) {
              // set mobile number to mobile obj
              _mobileNumber = value;
              if (widget.onSaved != null && value != null) {
                widget.onSaved!(
                  MobileNumberInfo(
                    countryISOCode: _selectedCountry['code'],
                    countryCode: _selectedCountry['dial_code'],
                    number: value,
                  ),
                );
              }
            },
            onChanged: (String value) {
              // set mobile number to mobile obj
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
              if (widget.showDropdownIcon) ...<Widget>[
                Icon(
                  Icons.arrow_drop_down,
                  color: widget.dropDownArrowColor,
                ),
                const SizedBox(width: 4)
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
                      color: widget.countryCodeTextColor),
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
