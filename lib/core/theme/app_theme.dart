import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF2D5E4C);
  static const accent = Color(0xFFF2923B);
  static const muted = Color(0xFFB4B6D6);
  static const title = Color(0xFF2B2D52);
  static const subtitle = Color(0xFF7D7F96);
  static const actionBg = Color(0xFFEAF0EE);
}

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    fontFamily: GoogleFonts.urbanist().fontFamily,
  );
}
