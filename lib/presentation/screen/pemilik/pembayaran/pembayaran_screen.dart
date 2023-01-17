import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/viewmodel/pembayaran/pembayaran_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({Key? key}) : super(key: key);

  static const String name = 'PembayaranScreen';

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: 0,
      ),
      body: ChangeNotifierProvider<PembayaranViewModel>(
        create: (_) => PembayaranViewModel()..init(),
        child: Consumer<PembayaranViewModel>(
            builder: (_, viewModel, __) => viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.data.length,
                    itemBuilder: (_, position) {
                      final model = viewModel.data[position];

                      return Container(
                        margin:
                            const EdgeInsets.only(top: 12, right: 16, left: 16),
                        decoration: BoxDecoration(
                            color: WColors.white,
                            borderRadius: WRadius.size6,
                            boxShadow: [wShadowCard]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => viewModel.onTapDetails(model),
                            borderRadius: WRadius.size6,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${model.kos?.judul} (${model.kosTipe?.namaTipe})',
                                          style: WTextStyle.headline3.semiBold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          model.status,
                                          style: WTextStyle.body2,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  WSpacing.vertical.size6,
                                  Text(
                                    model.user?.name ?? 'N/A',
                                    style: WTextStyle.body2,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    model.jumlahBayar.idrFormat,
                                    style: WTextStyle.body2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
