import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Border-radius scale. Base radius is 16 (default cards); small controls
/// use 12–14, large surfaces use 20–28, the phone/hero frame uses 32.
abstract class AppRadius {
  AppRadius._();

  static double get sm => 12.r; // Chips, small buttons
  static double get md => 14.r; // Inputs, dropdowns
  static double get lg => 16.r; // Default cards
  static double get xl => 20.r; // Elevated cards
  static double get xxl => 24.r; // Hero panels
  static double get xxxl => 28.r; // Sheets, modals
  static double get xxxxl => 32.r; // Phone frame inner
  static double get full => 999.r; // Pills, FAB, avatars

  static BorderRadius get smRadius => BorderRadius.circular(sm);
  static BorderRadius get mdRadius => BorderRadius.circular(md);
  static BorderRadius get lgRadius => BorderRadius.circular(lg);
  static BorderRadius get xlRadius => BorderRadius.circular(xl);
  static BorderRadius get xxlRadius => BorderRadius.circular(xxl);
  static BorderRadius get xxxlRadius => BorderRadius.circular(xxxl);
  static BorderRadius get xxxxlRadius => BorderRadius.circular(xxxxl);
  static BorderRadius get fullRadius => BorderRadius.circular(full);
}