import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/auth/login_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String name = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ChangeNotifierProvider(
            create: (_) => LoginViewModel(),
            child: Consumer<LoginViewModel>(builder: (_, viewModel, __) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      size: 80.w,
                    ),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                      label: 'Username',
                      controller: viewModel.usernameController,
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? 'Username tidak boleh kosong'
                              : null,
                    ),
                    WSpacing.vertical.size16,
                    WPasswordTextField(
                        label: 'Password',
                        controller: viewModel.passwordController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? 'Password tidak boleh kosong'
                                : null),
                    WSpacing.vertical.size16,
                    WPrimaryButton(
                      title: 'Login',
                      onTap: viewModel.login,
                      isLoading: viewModel.isLoading,
                      fullWidth: false,
                    ),
                    WSpacing.vertical.size6,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Belum Punya Akun?',
                          style: WTextStyle.subtitle2,
                        ),
                        GestureDetector(
                          onTap: viewModel.isLoading
                              ? null
                              : () => NavigationService()
                                  .router
                                  .replace(const RegisterRoute()),
                          child: Text(
                            ' Daftar',
                            style: WTextStyle.subtitle2.semiBold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
