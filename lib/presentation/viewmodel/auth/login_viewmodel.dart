import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/master_viewmodel.dart';
import 'package:skripsi_wap/service/storage_service.dart';
import 'package:skripsi_wap/util/util.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository repository = Injection.locator<AuthRepository>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;
    isLoading = true;

    final response = await repository.login(
        email: usernameController.text.trim(),
        password: passwordController.text.trim());
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      showError(message: failure!.message);
      return;
    }

    await StorageService.set<String>(
        StorageKeyEnum.accessToken, data!.token.accessToken);
    isLoading = false;
    context?.read<MasterViewModel>().navigation = NavigationEnum.search;
    navigationService.popToRootAndReplaceWith(const HomeRoute());
  }
}
