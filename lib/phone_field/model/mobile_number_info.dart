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

  @override
  String toString() {
    return 'MobileNumberInfo(countryISOCode: $countryISOCode, countryCode: $countryCode, number: $number, completeNumber: $completeNumber)';
  }
}
