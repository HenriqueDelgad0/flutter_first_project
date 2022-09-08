extension StringMask on String {
  String maskCurrentString() {
    return replaceAll(RegExp("[1234567890]"), "*");
  }
}