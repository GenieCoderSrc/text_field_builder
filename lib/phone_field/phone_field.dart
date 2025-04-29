import 'package:app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/input_focus.dart';
import 'intl_mobile_field.dart';
import 'model/mobile_number_info.dart';

class AppPhoneField extends StatelessWidget {
  final FormFieldSetter<MobileNumberInfo>? onSaved;
  final ValueChanged<MobileNumberInfo>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorMsg;
  final Function? onSubmitted;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Icon? icon;
  final VoidCallback? onIconTap;
  final String? initialCountryCode;

  // style
  final double? hPadding;
  final double? vPadding;

  const AppPhoneField(
      {super.key,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.errorMsg,
      this.onSubmitted,
      this.backgroundColor,
      this.focusNode,
      this.nextFocus,
      this.icon,
      this.onIconTap,
      this.initialCountryCode,
      this.vPadding,
      this.hPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: hPadding ?? PaddingConstant.kHPadding,
          right: hPadding ?? PaddingConstant.kHPadding,
          bottom: vPadding ?? PaddingConstant.kVPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 2.0),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: Icon(Icons.local_phone),
                ),
                Expanded(
                  flex: 5,
                  child: IntlPhoneField(
                    initialCountryCode: initialCountryCode ?? 'IN',
                    searchText: 'Search By Country Name',
                    // searchText: translateTxt(context, search_by_country_name),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Input Phone Number',
                      // hintText: translateTxt(context, input_phone),
                      contentPadding: const EdgeInsets.all(5.0),
                      border: InputBorder.none,
                      errorMaxLines: 3,
                      alignLabelWithHint: true,
                      errorStyle: TextStyle(
                        height: 0.1,
                        color: Colors.blueGrey[50],
                      ),
                      errorText: errorMsg != null
                          ? 'Invalid Phone'
                          // ? translateTxt(context, invalid_phone)
                          : errorMsg,
                    ),
                    onSaved: onSaved,
                    onChanged: onChanged,
                    validator: validator,
                    autoValidate: false,
                    focusNode: focusNode,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onSubmitted: (_) => InputFocusHandler.changeFocusField(
                        context, focusNode!, nextFocus),
                  ),
                ),
              ],
            ),
          ),
          _buildErrorLabel(context),
        ],
      ),
    );
  }

  Widget _buildErrorLabel(BuildContext context) {
    return errorMsg == null
        ? Container()
        : Container(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 2.0, top: 2.0),
            child: Text(
              errorMsg!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.error),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
  }
}
