part of 'enum.dart';

enum WTextFieldType {
  defaultType,
  currency,
  numberOnly,
  multiLine,
  password,
  email,
  name
}

extension WTextFieldTypeExt on WTextFieldType {
  List<TextInputFormatter> get inputFormatter {
    List<TextInputFormatter> formatters = [];

    if (this == WTextFieldType.currency) {
      formatters.addAll([
        FilteringTextInputFormatter.digitsOnly,
        // CurrencyTextInputFormatter(decimalDigits: 0, locale: 'ID', symbol: ''),
      ]);
    }

    if (this == WTextFieldType.numberOnly) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return formatters;
  }

  TextInputType? get keyboardType {
    switch (this) {
      case WTextFieldType.currency:
      case WTextFieldType.numberOnly:
        return const TextInputType.numberWithOptions();
      case WTextFieldType.multiLine:
        return TextInputType.multiline;
      case WTextFieldType.email:
        return TextInputType.emailAddress;
      case WTextFieldType.name:
        return TextInputType.name;
      default:
        return null;
    }
  }

  bool get isSecure => this == WTextFieldType.password;
}
