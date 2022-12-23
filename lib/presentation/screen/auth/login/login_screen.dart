import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/assets.gen.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home,
                size: 80.w,
              ),
              WSpacing.vertical.size16,
              const WPrimaryTextField(label: 'Username'),
              WSpacing.vertical.size16,
              const WPasswordTextField(label: 'Password'),
              WSpacing.vertical.size16,
              WPrimaryButton(
                title: 'Login',
                onTap: () => NavigationService().router.push(HomeRoute()),
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
                    onTap: () => NavigationService()
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
        ),
      ),
    );
  }
}
