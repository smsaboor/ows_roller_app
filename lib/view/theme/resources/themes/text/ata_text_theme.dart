/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/company_colors.dart';
import '../../themes/text/company_text_theme.dart';

class AtaTextTheme extends CompanyTextTheme {
  AtaTextTheme(CompanyColors colors) : super(colors);

  @override
  TextTheme buildPrimaryTextTheme(Color displayColor, Color bodyColor) => baseTextTheme
      .copyWith(
        button: baseTextTheme.caption!.copyWith(
          fontSize: 14,
          color: displayColor,
        ),
      )
      .apply(
        displayColor: displayColor,
        bodyColor: bodyColor,
      );

  @override
  TextTheme buildSecondaryTextTheme(Color displayColor, Color bodyColor) => baseTextTheme
      .copyWith(
        button: baseTextTheme.caption!.copyWith(
          fontSize: 14,
          color: displayColor,
        ),
      )
      .apply(
        displayColor: displayColor,
        bodyColor: bodyColor,
      );

  @override
  TextTheme buildBaseTextTheme(Color displayColor, Color bodyColor) {
    final currentTextTheme = TextTheme(
      headline1: GoogleFonts.rubik(fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.rubik(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.rubik(fontSize: 49, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.rubik(fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.rubik(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ).apply(
      displayColor: displayColor,
      bodyColor: bodyColor,
    );
    return GoogleFonts.rubikTextTheme(currentTextTheme);
  }
}
