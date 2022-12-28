import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class DaftarPemilikScreen extends StatefulWidget {
  const DaftarPemilikScreen({Key? key}) : super(key: key);

  static const String name = 'DaftarPemilikScreen';

  @override
  State<DaftarPemilikScreen> createState() => _DaftarPemilikScreenState();
}

class _DaftarPemilikScreenState extends State<DaftarPemilikScreen> {
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
              'Daftar Menjadi Pemilik Kost',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Provinsi'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Kabupaten'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Kecamatan'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Desa'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Alamat Lengkap'),
            WSpacing.vertical.size8,
            Center(
              child: WPrimaryButton(
                title: 'Daftar',
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
