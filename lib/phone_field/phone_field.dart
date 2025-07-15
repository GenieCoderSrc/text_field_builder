import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intl_mobile_field.dart';
import 'model/mobile_number_info.dart';

class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.errorMsg,
    this.onFieldSubmitted,
    this.backgroundColor,
    this.focusNode,
    this.nextFocus,
    this.icon,
    this.onIconTap,
    this.initialCountryCode,
    this.hPadding = 16.0,
    this.vPadding = 8.0,
  });

  // Callback handlers
  final FormFieldSetter<MobileNumberInfo>? onSaved;
  final ValueChanged<MobileNumberInfo>? onChanged;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  // Visual config
  final Color? backgroundColor;
  final Icon? icon;
  final VoidCallback? onIconTap;

  // Focus
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  // Initial country for the phone input
  final String? initialCountryCode;

  // Padding
  final double hPadding;
  final double vPadding;

  // Error message
  final String? errorMsg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                if (icon != null)
                  InkWell(
                    onTap: onIconTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: icon,
                    ),
                  ),
                Expanded(
                  child: IntlPhoneField(
                    initialCountryCode: initialCountryCode ?? 'IN',
                    searchText: 'Search by Country Name',
                    focusNode: focusNode,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    validator: validator,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: 'Enter phone number',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                    onSubmitted: (value) {
                      if (focusNode != null && nextFocus != null) {
                        FocusScope.of(context).requestFocus(nextFocus);
                      }
                      if (onFieldSubmitted != null) {
                        onFieldSubmitted!(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (errorMsg != null && errorMsg!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 4.0),
              child: Text(
                errorMsg!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

// class AppPhoneField extends StatelessWidget {
//   final FormFieldSetter<MobileNumberInfo>? onSaved;
//   final ValueChanged<MobileNumberInfo>? onChanged;
//   final FormFieldValidator<String>? validator;
//   final String? errorMsg;
//   final Function? onSubmitted;
//   final Color? backgroundColor;
//   final FocusNode? focusNode;
//   final FocusNode? nextFocus;
//   final Icon? icon;
//   final VoidCallback? onIconTap;
//   final String? initialCountryCode;
//
//   // style
//   final double? hPadding;
//   final double? vPadding;
//
//   const AppPhoneField(
//       {super.key,
//       this.onSaved,
//       this.onChanged,
//       this.validator,
//       this.errorMsg,
//       this.onSubmitted,
//       this.backgroundColor,
//       this.focusNode,
//       this.nextFocus,
//       this.icon,
//       this.onIconTap,
//       this.initialCountryCode,
//       this.vPadding,
//       this.hPadding});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//           left: hPadding ?? PaddingConstant.kHPadding,
//           right: hPadding ?? PaddingConstant.kHPadding,
//           bottom: vPadding ?? PaddingConstant.kVPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//             height: 50,
//             padding: const EdgeInsets.only(bottom: 2.0),
//             decoration: BoxDecoration(
//               color: backgroundColor ?? Colors.blueGrey[50],
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Row(
//               children: <Widget>[
//                 const Expanded(
//                   child: Icon(Icons.local_phone),
//                 ),
//                 Expanded(
//                   flex: 5,
//                   child: IntlPhoneField(
//                     initialCountryCode: initialCountryCode ?? 'IN',
//                     searchText: 'Search By Country Name',
//                     // searchText: translateTxt(context, search_by_country_name),
//                     textAlign: TextAlign.start,
//                     decoration: InputDecoration(
//                       hintText: 'Input Phone Number',
//                       // hintText: translateTxt(context, input_phone),
//                       contentPadding: const EdgeInsets.all(5.0),
//                       border: InputBorder.none,
//                       errorMaxLines: 3,
//                       alignLabelWithHint: true,
//                       errorStyle: TextStyle(
//                         height: 0.1,
//                         color: Colors.blueGrey[50],
//                       ),
//                       errorText: errorMsg != null
//                           ? 'Invalid Phone'
//                           // ? translateTxt(context, invalid_phone)
//                           : errorMsg,
//                     ),
//                     onSaved: onSaved,
//                     onChanged: onChanged,
//                     validator: validator,
//                     autoValidate: false,
//                     focusNode: focusNode,
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     onSubmitted: (_) => InputFocusHandler.changeFocusField(
//                         context, focusNode!, nextFocus),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           _buildErrorLabel(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildErrorLabel(BuildContext context) {
//     return errorMsg == null
//         ? Container()
//         : Container(
//             padding: const EdgeInsets.only(
//                 left: 16, right: 16, bottom: 2.0, top: 2.0),
//             child: Text(
//               errorMsg!,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodySmall!
//                   .copyWith(color: Theme.of(context).colorScheme.error),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           );
//   }
// }
