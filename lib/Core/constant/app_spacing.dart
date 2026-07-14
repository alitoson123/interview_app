import 'package:flutter_screenutil/flutter_screenutil.dart';
abstract class AppSpacing {
  AppSpacing._();

  /// 4 — hairline gaps, icon–text pairs.
  static double get s4 => 4.w;

  /// 8 — chip padding, tight groups.
  static double get s8 => 8.w;

  /// 12 — between related fields.
  static double get s12 => 12.w;

  /// 16 — card interior padding.
  static double get s16 => 16.w;

  /// 20 — between card groups.
  static double get s20 => 20.w;

  /// 24 — screen horizontal padding.
  static double get s24 => 24.w;

  /// 32 — section spacing.
  static double get s32 => 32.w;

  /// 40 — hero blocks.
  static double get s40 => 40.w;

  /// 48 — large section separations.
  static double get s48 => 48.w;

  /// 64 — page-level breathing room.
  static double get s64 => 64.w;
}