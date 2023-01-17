import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/pendaftaran/pendaftaran_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class PendaftaranScreen extends StatefulWidget {
  const PendaftaranScreen({Key? key, required this.model}) : super(key: key);

  static const String name = 'PendaftaranScreen';

  final KosTipeModel model;

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
        body: ChangeNotifierProvider<PendaftaranViewModel>(
            create: (_) => PendaftaranViewModel()..init(widget.model),
            child: Consumer<PendaftaranViewModel>(builder: (_, viewModel, __) {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                    key: viewModel.formKey,
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
                        WPrimaryTextField(
                          label: 'Nama',
                          enable: false,
                          controller: viewModel.namaController,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Nama tidak boleh kosong'
                                  : value.hasEmoji
                                      ? 'Nama tidak boleh mengandung emoji'
                                      : null,
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Email',
                          style: WTextStyle.body2.bold,
                        ),
                        WSpacing.vertical.size4,
                        WPrimaryTextField(
                          label: 'Email',
                          enable: false,
                          controller: viewModel.emailController,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Email tidak boleh kosong'
                                  : value.hasEmoji
                                      ? 'Email tidak boleh mengandung emoji'
                                      : null,
                        ),
                        WSpacing.vertical.size8,
                        Text('Telepon', style: WTextStyle.body2.bold),
                        WSpacing.vertical.size4,
                        WPrimaryTextField(
                          label: 'Telepon',
                          enable: false,
                          controller: viewModel.teleponController,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Telepon tidak boleh kosong'
                                  : value.hasEmoji
                                      ? 'Telepon tidak boleh mengandung emoji'
                                      : null,
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Tanggal Mulai',
                          style: WTextStyle.body2.bold,
                        ),
                        WSpacing.vertical.size4,
                        WPrimaryTextField(
                          label: 'Tanggal Mulai',
                          enable: false,
                          controller: viewModel.tanggalMulaiController,
                          onTap: viewModel.selectDate,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Tanggal Mulai tidak boleh kosong'
                                  : null,
                        ),
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
                          controller: viewModel.ktpController,
                          onTap: viewModel.selectKtp,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Foto KTP tidak boleh kosong'
                                  : null,
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
                          controller: viewModel.kkController,
                          onTap: viewModel.selectKk,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Foto KK tidak boleh kosong'
                                  : null,
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
                          controller: viewModel.pribadiController,
                          onTap: viewModel.selectPribadi,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Foto Pribadi tidak boleh kosong'
                                  : null,
                        ),
                        WSpacing.vertical.size8,
                        Center(
                          child: WPrimaryButton(
                            title: 'Submit',
                            onTap: viewModel.submit,
                            isLoading: viewModel.isLoading,
                            fullWidth: false,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
