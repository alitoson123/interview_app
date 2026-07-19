import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Brand — Primary
  // ---------------------------------------------------------------------
  static const Color primary = Color(0xFF4F7CFF);
  static const Color primaryGlow = Color(0xFF7A9BFF);

  /// 135° gradient: Primary → Primary Glow.
  /// Used on the FAB, logo mark, hero CTAs, and score-meter fills.
  static const List<Color> primaryGradient = [primary, primaryGlow];

  // ---------------------------------------------------------------------
  // Secondary & Accent
  // ---------------------------------------------------------------------
  static const Color secondary = Color(0xFFF1F3F7);
  static const Color accent = Color(0xFFEAEEF9);
  static const Color muted = Color(0xFFF3F5F8);

  // ---------------------------------------------------------------------
  // Semantic — Feedback
  // ---------------------------------------------------------------------
  static const Color success = Color(0xFF22B57A);
  static const Color warning = Color(0xFFF0B23A);
  static const Color destructive = Color(0xFFE5484D);

  // ---------------------------------------------------------------------
  // Neutral ramp (50 → 900)
  // 50–200 = surfaces · 300–500 = borders / muted text · 600–900 = text / ink
  // ---------------------------------------------------------------------
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F4F9);
  static const Color neutral200 = Color(0xFFE5EAF2);
  static const Color neutral300 = Color(0xFFCBD3E1);
  static const Color neutral400 = Color(0xFF94A0B8);
  static const Color neutral500 = Color(0xFF6B7893);
  static const Color neutral600 = Color(0xFF4C566E);
  static const Color neutral700 = Color(0xFF333B4F);
  static const Color neutral800 = Color(0xFF1F2637);
  static const Color neutral900 = Color(0xFF111624);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ---------------------------------------------------------------------
  // Light mode — semantic surface / text mapping
  // ---------------------------------------------------------------------
  static const Color lightBackground = Color(0xffF8FAFD);
  static const Color lightSurface = neutral50;
  static const Color lightSurfaceElevated = white;
  static const Color lightCard = white;
  static const Color lightPopover = white;
  static const Color lightForeground = neutral900;
  static const Color lightMutedForeground = neutral500;
  static const Color lightPrimaryForeground = white;
  static const Color lightBorder = neutral200;
  static const Color lightInput = neutral200;
  static const Color lightRing = primary;

  // ---------------------------------------------------------------------
  // Dark mode — semantic surface / text mapping
  // ---------------------------------------------------------------------
  static const Color darkBackground = neutral900;
  static const Color darkSurface = Color(0xFF171D2C);
  static const Color darkSurfaceElevated = neutral800;
  static const Color darkCard = neutral800;
  static const Color darkPopover = neutral800;
  static const Color darkForeground = neutral50;
  static const Color darkMutedForeground = neutral400;
  static const Color darkPrimaryForeground = white;
  static const Color darkBorder = neutral700;
  static const Color darkInput = neutral700;
  static const Color darkRing = primaryGlow;
}
