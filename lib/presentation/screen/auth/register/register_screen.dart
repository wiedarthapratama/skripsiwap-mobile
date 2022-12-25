import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home,
                size: 80.w,
              ),
              WSpacing.vertical.size16,
              const WPrimaryTextField(label: 'Nama'),
              WSpacing.vertical.size16,
              const WPrimaryTextField(
                label: 'E-mail',
                textFieldType: WTextFieldType.email,
              ),
              WSpacing.vertical.size16,
              const WPrimaryTextField(
                label: 'No. Handphone',
                textFieldType: WTextFieldType.numberOnly,
              ),
              WSpacing.vertical.size16,
              const WPasswordTextField(label: 'Password'),
              WSpacing.vertical.size16,
              WPrimaryButton(
                title: 'Daftar',
                onTap: () => NavigationService().router.push(const HomeRoute()),
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
                    onTap: () =>
                        NavigationService().router.push(const LoginRoute()),
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
      ),
    );
  }
}
