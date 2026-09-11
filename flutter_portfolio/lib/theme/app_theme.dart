import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors converted from the web design tokens (oklch -> hex).
class AppColors {
  static const background = Color(0xFFF7F9FC);
  static const foreground = Color(0xFF10233F);
  static const card = Color(0xFFFFFFFF);
  static const primary = Color(0xFF1E88E5);
  static const primaryForeground = Color(0xFFFFFFFF);
  static const secondary = Color(0xFFE8EFF8);
  static const muted = Color(0xFFF0F3F8);
  static const mutedForeground = Color(0xFF667792);
  static const accent = Color(0xFFDCE9F7);
  static const border = Color(0xFFD6DFEA);
  static const cyan = Color(0xFF3FB6D8);
  static const navy = Color(0xFF20344F);
  static const surface = Color(0xFFF2F5FA);

  static const shadow = BoxShadow(
    color: Color(0x1420344F),
    blurRadius: 40,
    offset: Offset(0, 14),
  );
}

class AppTheme {
  static const maxContentWidth = 1040.0;
  static const mobileBreakpoint = 760.0;

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.primaryForeground,
        surface: AppColors.card,
        brightness: Brightness.light,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: AppColors.foreground,
        displayColor: AppColors.foreground,
      ),
      dividerColor: AppColors.border,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.foreground,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
    );
  }

  static TextStyle eyebrow() => const TextStyle(
        fontSize: 12,
        height: 1,
        fontWeight: FontWeight.w800,
        letterSpacing: 2.2,
        color: AppColors.primary,
      );

  static TextStyle heading1() => const TextStyle(
        fontSize: 48,
        height: 1.1,
        fontWeight: FontWeight.w800,
      );

  static TextStyle heading2() => const TextStyle(
        fontSize: 34,
        height: 1.2,
        fontWeight: FontWeight.w800,
      );

  static TextStyle body({double size = 15, Color? color}) => TextStyle(
        fontSize: size,
        height: 1.7,
        color: color ?? AppColors.mutedForeground,
      );
}
