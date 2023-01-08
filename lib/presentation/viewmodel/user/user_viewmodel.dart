import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/util/util.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository repository = Injection.locator<UserRepository>();

  final formKey = GlobalKey<FormState>();
  // ubah profile
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  // ubah profile
  final TextEditingController passwordOldController = TextEditingController();
  final TextEditingController passwordNewController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
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
    namaController.text = data!.name;
    emailController.text = data.email;
    teleponController.text = data.nohp;
    isLoading = false;
  }

  void onSave() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;

    String nama = namaController.text;
    String email = emailController.text;
    String telepon = teleponController.text;

    _doSave(nama: nama, email: email, telepon: telepon);
  }

  _doSave(
      {required String nama,
      required String email,
      required String telepon}) async {
    isLoadingCTA = true;

    final response = await repository.saveProfile(
        nama: nama, email: email, telepon: telepon);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: nama, message: data!.message);
    navigationService.router.popForced(true);
  }

  void onSavePassword() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;

    String passwordOld = passwordOldController.text;
    String passwordNew = passwordNewController.text;
    String passwordConfirmation = passwordConfirmationController.text;

    _doSavePassword(
        passwordOld: passwordOld,
        passwordNew: passwordNew,
        passwordConfirmation: passwordConfirmation);
  }

  _doSavePassword(
      {required String passwordOld,
      required String passwordNew,
      required String passwordConfirmation}) async {
    isLoadingCTA = true;

    final response = await repository.savePassword(
        passwordOld: passwordOld,
        passwordNew: passwordNew,
        passwordConfirmation: passwordConfirmation);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: 'Judul', message: data!.message);
    navigationService.router.popForced(true);
  }

  void init() {
    loadProfile();
  }
}
