import 'package:flutter/material.dart';

class AppStyles {
  static const Color verdePrincipal = Color(0xFF4CAF50);
  static const Color verdeEscuro = Color(0xFF2E7D32);
  static const Color verdeClaro = Color(0xFFE8F5E9);
  static const Color fundo = Color(0xFFF7F9F5);
  static const Color branco = Colors.white;
  static const Color cinza = Color(0xFF757575);

  static ThemeData tema = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: fundo,

    colorScheme: ColorScheme.fromSeed(
      seedColor: verdePrincipal,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: verdePrincipal,
      foregroundColor: branco,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      elevation: 3,
      color: branco,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: verdePrincipal,
        foregroundColor: branco,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}