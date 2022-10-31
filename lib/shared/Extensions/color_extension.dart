import 'dart:ui';

/// https://stackoverflow.com/questions/55147586/flutter-convert-color-to-hex-string
extension ToHexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true`
  /// (default is `true`).

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
