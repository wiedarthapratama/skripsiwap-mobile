part of 'style.dart';

class WTextStyle {
  static TextStyle get overLine =>
      GoogleFonts.openSans(fontSize: 10, color: WColors.primary);

  static TextStyle get caption2 => overLine.multiLine;

  static TextStyle get caption1 =>
      GoogleFonts.openSans(fontSize: 12, color: WColors.primary);

  static TextStyle get body2 => subtitle2.multiLine;

  static TextStyle get body1 => subtitle1.multiLine;

  static TextStyle get subtitle2 =>
      GoogleFonts.openSans(fontSize: 14, color: WColors.primary);

  static TextStyle get subtitle1 =>
      GoogleFonts.openSans(fontSize: 16, color: WColors.primary);

  static TextStyle get headline3 =>
      GoogleFonts.openSans(fontSize: 18, color: WColors.primary).multiLine;

  static TextStyle get headline2 =>
      GoogleFonts.openSans(fontSize: 20, color: WColors.primary).multiLine;

  static TextStyle get headline1 =>
      GoogleFonts.openSans(fontSize: 24, color: WColors.primary).multiLine;

  static TextStyle get display3 =>
      GoogleFonts.openSans(fontSize: 28, color: WColors.primary).multiLine;

  static TextStyle get display2 =>
      GoogleFonts.openSans(fontSize: 40, color: WColors.primary).multiLine;

  static TextStyle get display1 =>
      GoogleFonts.openSans(fontSize: 48, color: WColors.primary).multiLine;
}
