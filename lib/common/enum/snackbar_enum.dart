part of 'enum.dart';

enum WSnackBarType { defaultSnackbar, success, error }

extension WSnackBarExt on WSnackBarType {
  Color get color {
    switch (this) {
      case WSnackBarType.success:
        return WColors.success;
      case WSnackBarType.error:
        return WColors.error;

      case WSnackBarType.defaultSnackbar:
      default:
        return WColors.grey20;
    }
  }
}
