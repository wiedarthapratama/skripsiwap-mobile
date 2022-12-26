import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/screen/payment/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  static const String name = 'PaymentScreen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
              'Pembayaran Kos',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Nama'),
            WSpacing.vertical.size8,
            WPrimaryTextField(
              label: 'Dari Bank',
              enable: false,
              onTap: () {
                WModal.builder(context, child: const SelectBankModal());
              },
            ),
            WSpacing.vertical.size8,
            const WPrimaryTextField(
              label: 'Ke Bank - Pemilik Kos',
              enable: false,
            ),
            WSpacing.vertical.size8,
            WPrimaryTextField(
              label: 'Upload Bukti',
              enable: false,
              onTap: () async {
                var image = await ImagePicker()
                    .pickImage(source: ImageSource.camera, imageQuality: 75);

                if (image != null) {
                  File? file =
                      await FlutterExifRotation.rotateImage(path: image.path);

                  log('berhasil: $file');
                }
              },
            ),
            WSpacing.vertical.size8,
            Center(
              child: WPrimaryButton(
                title: 'Kirim',
                onTap: () =>
                    NavigationService().router.push(const PaymentDetailRoute()),
                fullWidth: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
