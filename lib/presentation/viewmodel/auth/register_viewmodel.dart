import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/util/util.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthRepository repository = Injection.locator<AuthRepository>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;
    isLoading = true;

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
    final response = await repository.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        passwordConfirm: passwordConfirm);
    final failure = response.fold((l) => l, (r) => null);

    if (response.isLeft()) {
      isLoading = false;
      showError(message: failure!.message);
      return;
    }

    showSuccess(message: 'Berhasil daftar');
    navigationService.popToRootAndPushTo(const LoginRoute());
  }
}
