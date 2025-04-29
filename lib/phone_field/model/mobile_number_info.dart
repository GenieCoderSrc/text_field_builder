class MobileNumberInfo {
  String? countryISOCode;
  String? countryCode;
  String? number;

  MobileNumberInfo({
    required this.countryISOCode,
    required this.countryCode,
    required this.number,
  });

  String get completeNumber {
    return '$countryCode$number';
  }
}
