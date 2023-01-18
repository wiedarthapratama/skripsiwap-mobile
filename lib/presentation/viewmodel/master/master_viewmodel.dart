import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/domain/repository/notifikasi/notifikasi_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class MasterViewModel extends BaseViewModel {
  final AuthRepository authRepository = Injection.locator<AuthRepository>();
  final NotifikasiRepository notifikasiRepository =
      Injection.locator<NotifikasiRepository>();
  NavigationEnum _navigation = NavigationEnum.search;
  NavigationEnum get navigation => _navigation;
  set navigation(NavigationEnum value) {
    if (value == navigation) return;
    _navigation = value;
    notifyListeners();
  }

  int _notification = 0;
  int get notification => _notification;
  set notification(int value) {
    _notification = value;
    notifyListeners();
  }

  void init() {
    navigation = NavigationEnum.search;
  }

  void saveOrUpdateToken() async {
    await authRepository.saveOrUpdateToken();
  }

  void getNotificationCount() async {
    final response = await notifikasiRepository.getNotificationCount();
    final int data = response.fold((l) => 0, (r) => r);
    notification = data;
  }
}
