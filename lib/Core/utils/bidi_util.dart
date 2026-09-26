import 'package:flutter/material.dart';

class BidiUtil {
  BidiUtil._();

  static final RegExp _arabicRegex = RegExp(
    r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
  );

  /// Returns true if the string contains any Arabic characters.
  static bool hasArabic(String? text) {
    if (text == null || text.trim().isEmpty) return false;
    return _arabicRegex.hasMatch(text);
  }

  /// Returns [TextDirection.rtl] if the text contains Arabic characters or if [forceRtl] is true.
  /// Otherwise returns [defaultDirection].
  static TextDirection getDirection(
    String? text, {
    TextDirection defaultDirection = TextDirection.rtl,
    bool forceRtl = false,
  }) {
    if (forceRtl) return TextDirection.rtl;
    if (text == null || text.trim().isEmpty) return defaultDirection;
    return hasArabic(text) ? TextDirection.rtl : TextDirection.ltr;
  }
}
