part of 'extension.dart';

extension TextStyleExt on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get multiLine => copyWith(height: 1.35);

  TextStyle get secondary => copyWith(color: WColors.secondary);
  TextStyle get accient => copyWith(color: WColors.accient);
  TextStyle get primary => copyWith(color: WColors.primary);
  TextStyle get white => copyWith(color: WColors.white);
  TextStyle get warning => copyWith(color: WColors.warning);
  TextStyle get error => copyWith(color: WColors.error);
  TextStyle get success => copyWith(color: WColors.success);

  TextStyle get poppinsStyle =>
      copyWith(fontFamily: GoogleFonts.poppins().fontFamily);
}
