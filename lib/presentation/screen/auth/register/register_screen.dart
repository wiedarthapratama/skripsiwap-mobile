import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/auth/register_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String name = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ChangeNotifierProvider<RegisterViewModel>(
            create: (_) => RegisterViewModel(),
            child: Consumer<RegisterViewModel>(builder: (_, viewModel, __) {
              return Form(
                key: viewModel.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        size: 80.w,
                      ),
                      WSpacing.vertical.size16,
                      WPrimaryTextField(
                        label: 'Nama',
                        controller: viewModel.nameController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'Nama wajib diisi!'
                            : value!.hasEmoji
                                ? 'Nama tidak boleh mengandung emoji'
                                : null,
                      ),
                      WSpacing.vertical.size16,
                      WPrimaryTextField(
                        label: 'E-mail',
                        textFieldType: WTextFieldType.email,
                        controller: viewModel.emailController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'E-mail wajib diisi!'
                            : value!.hasEmoji
                                ? 'E-mail tidak boleh mengandung emoji'
                                : !EmailValidator.validate(value)
                                    ? 'E-mail tidak valid'
                                    : null,
                      ),
                      WSpacing.vertical.size16,
                      WPrimaryTextField(
                        label: 'No. Handphone',
                        textFieldType: WTextFieldType.numberOnly,
                        controller: viewModel.phoneController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'No. Handphone wajib diisi!'
                            : null,
                      ),
                      WSpacing.vertical.size16,
                      WPasswordTextField(
                        label: 'Password',
                        controller: viewModel.passwordController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'Password wajib diisi!'
                            : !PasswordValidator.validate(value!)
                                ? 'Password minimal 8 karakter, mengandung huruf kecil, huruf besar, dan angka'
                                : null,
                      ),
                      WSpacing.vertical.size16,
                      WPasswordTextField(
                          label: 'Konfirmasi Password',
                          controller: viewModel.passwordConfirmController,
                          validator: (value) =>
                              (value ?? '') != viewModel.passwordController.text
                                  ? 'Konfirmasi password tidak sama'
                                  : null),
                      WSpacing.vertical.size16,
                      WPrimaryButton(
                        title: 'Daftar',
                        onTap: viewModel.register,
                        isLoading: viewModel.isLoading,
                        fullWidth: false,
                      ),
                      WSpacing.vertical.size6,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sudah Punya Akun?',
                            style: WTextStyle.subtitle2,
                          ),
                          GestureDetector(
                            onTap: () => NavigationService()
                                .router
                                .push(const LoginRoute()),
                            child: Text(
                              ' Login',
                              style: WTextStyle.subtitle2.semiBold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
