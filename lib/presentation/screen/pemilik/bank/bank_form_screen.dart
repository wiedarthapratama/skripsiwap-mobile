import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/presentation/viewmodel/bank/bank_form_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class BankFormScreen extends StatefulWidget {
  const BankFormScreen({Key? key, this.id}) : super(key: key);

  static const String name = 'BankFormScreen';
  final int? id;

  @override
  State<BankFormScreen> createState() => _BankFormScreenState();
}

class _BankFormScreenState extends State<BankFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<BankFormViewModel>(
        create: (_) => BankFormViewModel()..init(widget.id),
        child: Consumer<BankFormViewModel>(builder: (_, viewModel, __) {
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
                    label: 'Nama Bank',
                    controller: viewModel.namaBankController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Nama Bank masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Nama Rekening',
                    controller: viewModel.namaRekeningController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Nama Rekening masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Nomor Rekening',
                    controller: viewModel.noRekeningController,
                    textFieldType: WTextFieldType.numberOnly,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Nomor Rekening masih kosong'
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
