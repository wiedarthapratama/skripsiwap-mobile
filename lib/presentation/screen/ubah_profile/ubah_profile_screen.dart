import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class UbahProfileScreen extends StatefulWidget {
  const UbahProfileScreen({Key? key}) : super(key: key);

  static const String name = 'UbahProfileScreen';

  @override
  State<UbahProfileScreen> createState() => _UbahProfileScreenState();
}

class _UbahProfileScreenState extends State<UbahProfileScreen> {
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
              'UbahProfile Kos',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Nama'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Email'),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Telepon'),
            WSpacing.vertical.size8,
            WPrimaryTextField(
              label: 'Foto Pribadi',
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
