import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/pembayaran/pembayaran_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key? key, required this.id}) : super(key: key);

  static const String name = 'PaymentDetailScreen';

  final int id;

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const WPrimaryAppBar(
          title: 'Aplikasi',
          elevation: .2,
        ),
        body: ChangeNotifierProvider<PembayaranViewModel>(
            create: (_) =>
                PembayaranViewModel()..getDetail(idPembayaran: widget.id),
            child: Consumer<PembayaranViewModel>(builder: (_, viewModel, __) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Pembayaran',
                      style: WTextStyle.headline3.bold,
                    ),
                    WSpacing.vertical.size16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nama',
                          style: WTextStyle.body2,
                        ),
                        WSpacing.horizontal.size8,
                        Expanded(
                          child: Text(
                            viewModel.dataPembayaran.namaRekening,
                            style: WTextStyle.body2.bold,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    WSpacing.vertical.size8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dari Bank',
                          style: WTextStyle.body2,
                        ),
                        WSpacing.horizontal.size8,
                        Expanded(
                          child: Text(
                            viewModel.dataPembayaran.namaBank,
                            style: WTextStyle.body2.bold,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    WSpacing.vertical.size8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ke Bank',
                          style: WTextStyle.body2,
                        ),
                        Expanded(
                          child: Text(
                            viewModel.dataPembayaran.bank!.namaBank,
                            style: WTextStyle.body2.bold,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    WSpacing.vertical.size8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status Pembayaran',
                          style: WTextStyle.body2,
                        ),
                        WSpacing.horizontal.size8,
                        Expanded(
                          child: Text(
                            viewModel.dataPembayaran.status,
                            style: WTextStyle.body2.bold,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    WSpacing.vertical.size8,
                    Text(
                      'Bukti Transfer',
                      style: WTextStyle.body2,
                    ),
                    WSpacing.vertical.size6,
                    WCacheImage(
                      url: viewModel.dataPembayaran.buktiBayar,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              );
            })));
  }
}
