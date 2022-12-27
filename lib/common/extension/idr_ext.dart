part of 'extension.dart';

extension IdrFormatStringExt on String {
  String get idrFormat {
    return NumberFormat.currency(locale: 'ID')
        .format(double.tryParse(this) ?? 0)
        .replaceAll('IDR', 'Rp ')
        .replaceAll(',00', '');
  }
}

extension IdrFormatIntExt on int {
  String get idrFormat {
    return NumberFormat.currency(locale: 'ID')
        .format(this)
        .replaceAll('IDR', 'Rp ')
        .replaceAll(',00', '');
  }
}
