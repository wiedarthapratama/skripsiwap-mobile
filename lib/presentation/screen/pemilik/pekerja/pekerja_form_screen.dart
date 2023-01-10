import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/presentation/viewmodel/pekerja/pekerja_form_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class PekerjaFormScreen extends StatefulWidget {
  const PekerjaFormScreen({Key? key, this.idPekerja}) : super(key: key);

  static const String name = 'PekerjaFormScreen';
  final int? idPekerja;

  @override
  State<PekerjaFormScreen> createState() => PekerjaFormScreenState();
}

class PekerjaFormScreenState extends State<PekerjaFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<PekerjaFormViewModel>(
        create: (_) => PekerjaFormViewModel()..init(widget.idPekerja),
        child: Consumer<PekerjaFormViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WSpacing.vertical.size4,
                  WPrimaryTextField(
                    label: 'Nama',
                    controller: viewModel.namaController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Nama masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'No. Handphone',
                    controller: viewModel.nohpController,
                    textFieldType: WTextFieldType.numberOnly,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'No. Handphone masih kosong'
                        : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Provinsi',
                    enable: false,
                    onTap: viewModel.onTapProvince,
                    controller: viewModel.provinceController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Provinsi masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Kabupaten',
                    enable: false,
                    onTap: viewModel.onTapCity,
                    controller: viewModel.cityController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Kabupaten masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Kecamatan',
                    enable: false,
                    onTap: viewModel.onTapSubdistrict,
                    controller: viewModel.subdistrictController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Kecamatan masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Desa',
                    enable: false,
                    onTap: viewModel.onTapVillage,
                    controller: viewModel.villageController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Desa masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Alamat',
                    textFieldType: WTextFieldType.multiLine,
                    controller: viewModel.addressController,
                    maxLines: 3,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Alamat masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryButton(
                    title: 'Simpan',
                    onTap: viewModel.onSave,
                    fullWidth: false,
                    isLoading: viewModel.isLoadingCTA,
                  )
                ],
              ),
            )),
          );
        }),
      ),
    );
  }
}
