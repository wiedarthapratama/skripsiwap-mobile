import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/user/user_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({Key? key}) : super(key: key);

  static const String name = 'UbahPasswordScreen';

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<UserViewModel>(
        create: (_) => UserViewModel(),
        child: Consumer<UserViewModel>(builder: (_, viewModel, __) {
          return Form(
            key: viewModel.formKey,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ubah Password',
                    style: WTextStyle.headline3.bold,
                  ),
                  WSpacing.vertical.size16,
                  WPasswordTextField(
                      label: 'Password Lama',
                      controller: viewModel.passwordOldController,
                      validator: (value) => (value ?? '').isEmpty
                          ? 'Password Lama wajib diisi!'
                          : null),
                  WSpacing.vertical.size16,
                  WPasswordTextField(
                      label: 'Password Baru',
                      controller: viewModel.passwordNewController,
                      validator: (value) => (value ?? '').isEmpty
                          ? 'Password Baru wajib diisi!'
                          : !PasswordValidator.validate(value!)
                              ? 'Password minimal 8 karakter, mengandung huruf kecil, huruf besar, dan angka'
                              : null),
                  WSpacing.vertical.size16,
                  WPasswordTextField(
                      label: 'Konfirmasi Password Baru',
                      controller: viewModel.passwordConfirmationController,
                      validator: (value) => (value ?? '').isEmpty
                          ? 'Password Konfirmasi wajib diisi!'
                          : !PasswordValidator.validate(value!)
                              ? 'Password minimal 8 karakter, mengandung huruf kecil, huruf besar, dan angka'
                              : null),
                  WSpacing.vertical.size8,
                  Center(
                    child: WPrimaryButton(
                      title: 'Kirim',
                      onTap: viewModel.onSavePassword,
                      fullWidth: false,
                      isLoading: viewModel.isLoadingCTA,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
