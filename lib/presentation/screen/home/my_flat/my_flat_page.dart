import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/data/model/kos/kos_foto_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/kos/kos_saya_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';
import 'package:skripsi_wap/util/util.dart';

class MyFlatPage extends StatefulWidget {
  const MyFlatPage({Key? key}) : super(key: key);

  @override
  State<MyFlatPage> createState() => _MyFlatPageState();
}

class _MyFlatPageState extends State<MyFlatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WColors.white,
      appBar: WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
        actions: [
          InkWell(
            onTap: () =>
                NavigationService().router.push(const NotifikasiRoute()),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: const Icon(
                Icons.notifications,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider<KosSayaViewModel>(
        create: (_) => KosSayaViewModel()..init(),
        child: Consumer<KosSayaViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return viewModel.model == null
              ? const Center(
                  child: Text('Tidak ada data'),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${viewModel.model!.kosTipe.kos!.judul} - ${viewModel.model!.kosTipe.namaTipe}",
                          style: WTextStyle.headline3.bold,
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Nama Pemilik Kost - ',
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size4,
                        Text(
                          viewModel.model!.kosTipe.kos!.alamat.toLowerCase(),
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Foto',
                          style: WTextStyle.headline3.bold,
                        ),
                        WSpacing.vertical.size4,
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: (viewModel.model?.kosTipe.fotos ??
                                      <KosFotoModel>[])
                                  .length,
                              itemBuilder: (_, position) => Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 150,
                                    child: WCacheImage(
                                      url: viewModel
                                          .model!.kosTipe.fotos[position].foto,
                                      // height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ),
                        WSpacing.vertical.size16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pembayaran',
                              style: WTextStyle.headline3.bold,
                            ),
                            WSecondaryButton(
                              title: 'Bayar Kos',
                              onTap: () async {
                                final payment = await NavigationService()
                                    .router
                                    .push(
                                        PaymentRoute(model: viewModel.model!));

                                if (payment != null) {
                                  viewModel.init();
                                }
                              },
                              fullWidth: false,
                            )
                          ],
                        ),
                        WSpacing.vertical.size8,
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: viewModel.model?.dataPembayaran.length,
                          itemBuilder: (_, position) {
                            final model =
                                viewModel.model!.dataPembayaran[position];
                            return Card(
                              elevation: 10,
                              margin: const EdgeInsets.only(top: 12),
                              child: InkWell(
                                onTap: () => NavigationService()
                                    .router
                                    .push(PaymentDetailRoute(id: model.id)),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Pembayaran ke ${position + 1}',
                                                    style: WTextStyle
                                                        .subtitle2.bold,
                                                  ),
                                                  Text(
                                                    model.tanggalBayar
                                                        .dateFormat.formatEdmY,
                                                    style: WTextStyle
                                                        .subtitle2.bold,
                                                  )
                                                ],
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        WSpacing.vertical.size24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pengaduan',
                              style: WTextStyle.headline3.bold,
                            ),
                            WSecondaryButton(
                              title: 'Ajukan Keluhan',
                              onTap: () async {
                                final payment = await NavigationService()
                                    .router
                                    .push(PengontrakPengaduanRoute(
                                        model: viewModel.model!));

                                if (payment != null) {
                                  viewModel.init();
                                }
                              },
                              fullWidth: false,
                            )
                          ],
                        ),
                        WSpacing.vertical.size8,
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: viewModel.model?.dataPengaduan.length,
                          itemBuilder: (_, position) {
                            final model =
                                viewModel.model!.dataPengaduan[position];

                            return Card(
                              elevation: 10,
                              margin: const EdgeInsets.only(top: 12),
                              child: InkWell(
                                onTap: () => NavigationService().router.push(
                                    PengontrakPengaduanDetailRoute(
                                        id: model.id)),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    model.judul,
                                                    style: WTextStyle
                                                        .subtitle2.bold,
                                                  ),
                                                  Text(
                                                    model.tanggal.dateFormat
                                                        .formatEdmY,
                                                    style: WTextStyle
                                                        .subtitle2.bold,
                                                  )
                                                ],
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
