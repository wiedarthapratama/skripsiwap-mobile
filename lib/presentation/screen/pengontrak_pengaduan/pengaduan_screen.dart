import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/pengaduan/submit_pengaduan_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class PengontrakPengaduanScreen extends StatefulWidget {
  const PengontrakPengaduanScreen({Key? key, required this.model})
      : super(key: key);

  static const String name = 'PengontrakPengaduanScreen';

  final KosSayaModel model;

  @override
  State<PengontrakPengaduanScreen> createState() =>
      _PengontrakPengaduanScreenState();
}

class _PengontrakPengaduanScreenState extends State<PengontrakPengaduanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const WPrimaryAppBar(
          title: 'Aplikasi',
          elevation: .2,
        ),
        body: ChangeNotifierProvider<SubmitPengaduanViewModel>(
            create: (_) => SubmitPengaduanViewModel()..init(widget.model),
            child:
                Consumer<SubmitPengaduanViewModel>(builder: (_, viewModel, __) {
              return Container(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengaduan Kos',
                        style: WTextStyle.headline3.bold,
                      ),
                      WSpacing.vertical.size16,
                      WPrimaryTextField(
                        label: 'Judul',
                        controller: viewModel.judulController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? 'Judul tidak boleh kosong'
                                : value.hasEmoji
                                    ? 'Judul tidak boleh mengandung emoji'
                                    : null,
                      ),
                      WSpacing.vertical.size8,
                      WPrimaryTextField(
                        maxLines: 3,
                        label: 'Deskripsi',
                        controller: viewModel.deskripsiController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? 'Deskripsi tidak boleh kosong'
                                : value.hasEmoji
                                    ? 'Deskripsi tidak boleh mengandung emoji'
                                    : null,
                      ),
                      WSpacing.vertical.size8,
                      WPrimaryTextField(
                        label: 'Upload Bukti',
                        enable: false,
                        controller: viewModel.buktiController,
                        onTap: viewModel.selectBukti,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? 'Bukti tidak boleh kosong'
                                : null,
                      ),
                      WSpacing.vertical.size8,
                      Center(
                        child: WPrimaryButton(
                          title: 'Kirim',
                          onTap: viewModel.submit,
                          isLoading: viewModel.isLoading,
                          fullWidth: false,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
