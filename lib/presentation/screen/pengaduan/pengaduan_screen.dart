import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class PengaduanScreen extends StatefulWidget {
  const PengaduanScreen({Key? key}) : super(key: key);

  static const String name = 'PengaduanScreen';

  @override
  State<PengaduanScreen> createState() => _PengaduanScreenState();
}

class _PengaduanScreenState extends State<PengaduanScreen> {
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
              'Pengaduan Kos',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            const WPrimaryTextField(label: 'Judul'),
            WSpacing.vertical.size8,
            const WPrimaryTextField(
              maxLines: 3,
              label: 'Deskripsi',
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
                onTap: () => NavigationService()
                    .router
                    .push(PengaduanDetailRoute(id: 0)),
                fullWidth: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
