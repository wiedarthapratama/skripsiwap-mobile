import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class MasterViewModel extends BaseViewModel {
  NavigationEnum _navigation = NavigationEnum.search;
  NavigationEnum get navigation => _navigation;
  set navigation(NavigationEnum value) {
    if (value == navigation) return;
    _navigation = value;
    notifyListeners();
  }

  void init() {
    navigation = NavigationEnum.search;
  }
}
