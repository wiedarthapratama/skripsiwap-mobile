import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/kos/tipe/kos_tipe_form_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/checkbox/checkbox.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class KosTipeFormScreen extends StatefulWidget {
  const KosTipeFormScreen({Key? key, this.id, required this.kosModel})
      : super(key: key);

  static const String name = 'KosTipeFormScreen';
  final KosModel kosModel;
  final int? id;

  @override
  State<KosTipeFormScreen> createState() => _KosTipeFormScreenState();
}

class _KosTipeFormScreenState extends State<KosTipeFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<KosTipeFormViewModel>(
        create: (_) => KosTipeFormViewModel()..init(widget.id, widget.kosModel),
        child: Consumer<KosTipeFormViewModel>(builder: (_, viewModel, __) {
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
                  WPrimaryTextField(
                    label: 'Nama Tipe',
                    controller: viewModel.namaTipeController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Nama Tipe masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Jumlah Kos',
                    controller: viewModel.jumlahKosController,
                    textFieldType: WTextFieldType.numberOnly,
                    validator: (value) =>
                        (value ?? '').isEmpty ? 'Jumlah masih kosong' : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Harga',
                    controller: viewModel.hargaController,
                    textFieldType: WTextFieldType.numberOnly,
                    validator: (value) =>
                        (value ?? '').isEmpty ? 'Harga masih kosong' : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Jumlah Ruang',
                    controller: viewModel.jumlahRuangController,
                    textFieldType: WTextFieldType.numberOnly,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Jumlah Ruang masih kosong'
                        : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Luas',
                    controller: viewModel.luasController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Luas masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fasilitas',
                      style: WTextStyle.body2.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  WSpacing.vertical.size12,
                  WCheckbox(
                      isSelected: viewModel.selectedPerabot,
                      onChanged: (value) => viewModel.selectedPerabot =
                          !viewModel.selectedPerabot,
                      title: 'Include Perabot'),
                  WSpacing.vertical.size6,
                  WCheckbox(
                      isSelected: viewModel.selectedRumah,
                      onChanged: (value) =>
                          viewModel.selectedRumah = !viewModel.selectedRumah,
                      title: 'Tipenya Rumah'),
                  WSpacing.vertical.size6,
                  WCheckbox(
                      isSelected: viewModel.selectedKamarMandi,
                      onChanged: (value) => viewModel.selectedKamarMandi =
                          !viewModel.selectedKamarMandi,
                      title: 'Kamar Mandi Dalam'),
                  WSpacing.vertical.size6,
                  WCheckbox(
                      isSelected: viewModel.selectedListrik,
                      onChanged: (value) => viewModel.selectedListrik =
                          !viewModel.selectedListrik,
                      title: 'Include Listrik'),
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
