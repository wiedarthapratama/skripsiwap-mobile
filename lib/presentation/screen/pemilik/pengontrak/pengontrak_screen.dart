import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/viewmodel/pengontrak/pengontrak_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PengontrakScreen extends StatefulWidget {
  const PengontrakScreen({Key? key}) : super(key: key);

  static const String name = 'PengontrakScreen';

  @override
  State<PengontrakScreen> createState() => _PengontrakScreenState();
}

class _PengontrakScreenState extends State<PengontrakScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: 0,
      ),
      body: ChangeNotifierProvider<PengontrakViewModel>(
        create: (_) => PengontrakViewModel()..init(),
        child: Consumer<PengontrakViewModel>(
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
                            /* onTap: () => NavigationService()
                                .router
                                .push(KosDetailRoute(id: model.id)), */
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
                                          model.name,
                                          style: WTextStyle.headline3.semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  WSpacing.vertical.size6,
                                  Text(
                                    '${model.judul}-${model.namaTipe}',
                                    style: WTextStyle.body2,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    'Tanggal Sewa: ${model.toDateFormat}',
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
