import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/auth/register_owner_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

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
      body: ChangeNotifierProvider<RegisterAsOwnerViewModel>(
        create: (_) => RegisterAsOwnerViewModel(),
        child: Consumer<RegisterAsOwnerViewModel>(builder: (_, viewModel, __) {
          return Form(
            key: viewModel.key,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Menjadi Pemilik Kost',
                      style: WTextStyle.headline3.bold,
                    ),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                      label: 'Provinsi',
                      enable: false,
                      onTap: viewModel.onTapProvince,
                      controller: viewModel.provinceController,
                      validator: (value) => (value ?? '').isEmpty
                          ? 'Provinsi masih kosong'
                          : null,
                    ),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                        label: 'Kabupaten',
                        enable: false,
                        onTap: viewModel.onTapCity,
                        controller: viewModel.cityController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'Kabupaten masih kosong'
                            : null),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                        label: 'Kecamatan',
                        enable: false,
                        onTap: viewModel.onTapSubdistrict,
                        controller: viewModel.subdistrictController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'Kecamatan masih kosong'
                            : null),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                        label: 'Desa',
                        enable: false,
                        onTap: viewModel.onTapVillage,
                        controller: viewModel.villageController,
                        validator: (value) =>
                            (value ?? '').isEmpty ? 'Desa masih kosong' : null),
                    WSpacing.vertical.size16,
                    WPrimaryTextField(
                        label: 'Alamat Lengkap',
                        controller: viewModel.addressController,
                        validator: (value) => (value ?? '').isEmpty
                            ? 'Alamat masih kosong'
                            : value!.hasEmoji
                                ? 'Alamat tidak boleh mengandung emoji'
                                : null),
                    WSpacing.vertical.size8,
                    Center(
                      child: WPrimaryButton(
                        title: 'Daftar',
                        isLoading: viewModel.isLoading,
                        onTap: viewModel.onSave,
                        fullWidth: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
