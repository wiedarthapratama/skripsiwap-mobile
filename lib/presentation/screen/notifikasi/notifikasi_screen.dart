import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  static const String name = 'NotifikasiScreen';

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
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
              'Notifikasi',
              style: WTextStyle.headline3.bold,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(border: Border.all(color: WColors.primary)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Notifikasi 1',
                        style: WTextStyle.subtitle1.bold,
                      ),
                      Text(
                        'Ini adalah deskripsi dari notifikasi 1',
                        style: WTextStyle.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(border: Border.all(color: WColors.primary)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Notifikasi 2',
                        style: WTextStyle.subtitle1.bold,
                      ),
                      Text(
                        'Ini adalah deskripsi dari notifikasi 2',
                        style: WTextStyle.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(border: Border.all(color: WColors.primary)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Notifikasi 3',
                        style: WTextStyle.subtitle1.bold,
                      ),
                      Text(
                        'Ini adalah deskripsi dari notifikasi 3',
                        style: WTextStyle.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
