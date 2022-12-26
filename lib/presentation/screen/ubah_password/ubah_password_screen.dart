import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

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
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ubah Password',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Password Lama'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Password Baru'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Konfirmasi Password Baru'),
            WSpacing.vertical.size8,
            Center(
              child: WPrimaryButton(
                title: 'Kirim',
                onTap: () => NavigationService().router.navigateBack(),
                fullWidth: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
