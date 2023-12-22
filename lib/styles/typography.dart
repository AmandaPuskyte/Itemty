import 'package:flutter/material.dart';
import 'package:pos/styles/colors.dart';

abstract class AppTypography {
  static const inter = 'Inter';

  // H1: Bold, 20pt
  static final h1 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal,
    fontSize: 20.0,
    color: POSColors.grey.lightText,
  );

  // H2: Semi-Bold, 16pt
  static final h2 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
    color: POSColors.grey.lightText,
  );

  // H3: Semi-Bold, 14pt
  static final h3 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
    color: POSColors.grey.lightText,
  );

  // H4: Medium, 14pt
  static final h4 = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
    color: POSColors.grey.lightText,
  );

  // BODY: Regular, 14pt
  static final body = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
    color: POSColors.grey.lightText,
  );

  // DETAILS: Regular, 12pt
  static final details = TextStyle(
    fontFamily: inter,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
    color: POSColors.grey.lightText,
  );
}
