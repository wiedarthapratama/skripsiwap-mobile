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

class PendaftaranScreen extends StatefulWidget {
  const PendaftaranScreen({Key? key}) : super(key: key);

  static const String name = 'PendaftaranScreen';

  @override
  State<PendaftaranScreen> createState() => _PendaftaranScreenState();
}

class _PendaftaranScreenState extends State<PendaftaranScreen> {
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
            Center(
              child: Text(
                'Pendaftaran',
                style: WTextStyle.headline3.bold,
              ),
            ),
            WSpacing.vertical.size8,
            Text(
              'Data Pribadi',
              style: WTextStyle.body1.bold,
            ),
            WSpacing.vertical.size8,
            Text(
              'Nama',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            const WPrimaryTextField(label: 'Nama'),
            WSpacing.vertical.size8,
            Text(
              'Email',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            const WPrimaryTextField(label: 'Email'),
            WSpacing.vertical.size8,
            Text(
              'Telepon',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            const WPrimaryTextField(label: 'Telepon'),
            WSpacing.vertical.size8,
            Text(
              'Tanggal Mulai',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            const WPrimaryTextField(label: 'Tanggal Mulai'),
            WSpacing.vertical.size8,
            Text(
              'Dokumen',
              style: WTextStyle.body1.bold,
            ),
            WSpacing.vertical.size8,
            Text(
              'KTP',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            WPrimaryTextField(
              label: 'KTP',
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
            Text(
              'KK',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
            WPrimaryTextField(
              label: 'KK',
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
            Text(
              'Foto Pribadi',
              style: WTextStyle.body2.bold,
            ),
            WSpacing.vertical.size4,
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
                title: 'Submit',
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
