import 'package:flutter/material.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool newValue) {
    if (newValue && context != null) {
      FocusScopeNode currentFocus = FocusScope.of(context!);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
    _isLoading = newValue;
    notifyListeners();
  }

  BuildContext? get context => navigationService.currentContext;

  final NavigationService navigationService = NavigationService();
}
