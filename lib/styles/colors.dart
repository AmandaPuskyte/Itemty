import 'package:flutter/material.dart';

abstract class POSColors {
  static const brand = _BrandColors();
  static const state = _StateColors();
  static const grey = _GreyColors();
}

class _BrandColors {
  const _BrandColors();

  final primary = const Color(0xFF5018FB);
  final secondary = const Color(0xFF916BF1);
  final tertiary = const Color(0xFFC1ABE9);
}

class _StateColors {
  const _StateColors();

  final blue = const Color(0xFF196BDE);
  final green = const Color(0xFF27AE60);
  final orange = const Color(0xFFDA8338);
  final purple = const Color(0xFF6C3ABB);
}

class _GreyColors {
  const _GreyColors();

  final darkText = const Color(0xFF1F1F1F);
  final icon = const Color(0xFF8A8A92);
  final lightText = const Color(0xFF949494);
  final selection = const Color(0xFFE2E2E2);
  final line = const Color(0xFFEEEEEF);
}
