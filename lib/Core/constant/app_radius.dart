import 'package:flutter/widgets.dart';

/// Border-radius scale. Base radius is 16 (default cards); small controls
/// use 12–14, large surfaces use 20–28, the phone/hero frame uses 32.
abstract class AppRadius {
  AppRadius._();

  static const double sm = 12; // Chips, small buttons
  static const double md = 14; // Inputs, dropdowns
  static const double lg = 16; // Default cards
  static const double xl = 20; // Elevated cards
  static const double xxl = 24; // Hero panels
  static const double xxxl = 28; // Sheets, modals
  static const double xxxxl = 32; // Phone frame inner
  static const double full = 999; // Pills, FAB, avatars

  static final BorderRadius smRadius = BorderRadius.circular(sm);
  static final BorderRadius mdRadius = BorderRadius.circular(md);
  static final BorderRadius lgRadius = BorderRadius.circular(lg);
  static final BorderRadius xlRadius = BorderRadius.circular(xl);
  static final BorderRadius xxlRadius = BorderRadius.circular(xxl);
  static final BorderRadius xxxlRadius = BorderRadius.circular(xxxl);
  static final BorderRadius xxxxlRadius = BorderRadius.circular(xxxxl);
  static final BorderRadius fullRadius = BorderRadius.circular(full);
}