import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/pembayaran/submit_pembayaran_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.model}) : super(key: key);

  static const String name = 'PaymentScreen';

  final KosSayaModel model;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<SubmitPembayaranViewModel>(
        create: (_) => SubmitPembayaranViewModel()..init(widget.model),
        child: Consumer<SubmitPembayaranViewModel>(builder: (_, viewModel, __) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pembayaran Kos',
                    style: WTextStyle.headline3.bold,
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    label: 'Nama Rekening',
                    controller: viewModel.namaRekeningController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Nama Rekening tidak boleh kosong'
                        : value.hasEmoji
                            ? 'Nama Rekening tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size8,
                  WPrimaryTextField(
                    label: 'Nama Bank',
                    controller: viewModel.namaBankController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Nama Bank tidak boleh kosong'
                        : value.hasEmoji
                            ? 'Nama Bank tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size8,
                  WPrimaryTextField(
                    label: 'Ke Bank - Pemilik Kos',
                    enable: false,
                    controller: viewModel.bankPemilikController,
                    onTap: viewModel.showBank,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Bank Pemilik tidak boleh kosong'
                        : null,
                  ),
                  WSpacing.vertical.size8,
                  WPrimaryTextField(
                    label: 'Upload Bukti',
                    enable: false,
                    controller: viewModel.buktiController,
                    onTap: viewModel.selectBukti,
                    validator: (value) => value == null || value.trim().isEmpty
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
        }),
      ),
    );
  }
}
