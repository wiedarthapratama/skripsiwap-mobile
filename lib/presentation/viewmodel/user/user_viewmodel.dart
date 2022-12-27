import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/util/util.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository repository = Injection.locator<UserRepository>();
  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  void loadProfile() async {
    isLoading = true;

    final response = await repository.getProfile();
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      showError(message: failure!.message);
      return;
    }

    user = data;
    isLoading = false;
  }
}
