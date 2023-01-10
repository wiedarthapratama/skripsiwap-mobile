import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/pengaduan/pengaduan_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class PengaduanScreen extends StatefulWidget {
  const PengaduanScreen({Key? key}) : super(key: key);

  static const String name = 'PengaduanScreen';

  @override
  State<PengaduanScreen> createState() => _PengaduanScreenState();
}

class _PengaduanScreenState extends State<PengaduanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: 0,
      ),
      body: ChangeNotifierProvider<PengaduanViewModel>(
        create: (_) => PengaduanViewModel()..init(),
        child: Consumer<PengaduanViewModel>(
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
                            onTap: () => NavigationService()
                                .router
                                .push(PengaduanDetailRoute(id: model.id)),
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
                                          model.judul,
                                          style: WTextStyle.headline3.semiBold,
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
                                    model.deskripsi,
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
