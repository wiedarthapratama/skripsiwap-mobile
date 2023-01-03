import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/kos/detail_kos_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

import '../../../config/colors.gen.dart';
import '../../../config/route.gr.dart';
import '../../widget/image/image.dart';

class DetailKostScreen extends StatefulWidget {
  const DetailKostScreen({Key? key, required this.idKosTipe}) : super(key: key);

  final int idKosTipe;

  static const String name = 'DetailKostScreen';

  @override
  State<DetailKostScreen> createState() => _DetailKostScreenState();
}

class _DetailKostScreenState extends State<DetailKostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<DetailKosViewModel>(
        create: (_) => DetailKosViewModel()..init(idKosTipe: widget.idKosTipe),
        child: Consumer<DetailKosViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WCacheImage(
                          url: viewModel.model.fotos
                              .firstWhere((element) => element.mainFoto == 1)
                              .foto,
                          height: 350,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              viewModel.model.kos?.judul ?? '',
                              style: WTextStyle.headline3.semiBold,
                            ),
                            const Icon(Icons.map),
                          ],
                        ),
                        if (viewModel.model.isRumah == 1)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                color: WColors.success,
                                borderRadius: WRadius.size6),
                            child: Text(
                              'Rumah',
                              style: WTextStyle.caption1.semiBold.white,
                            ),
                          ),
                        WSpacing.vertical.size4,
                        Text(
                          viewModel.model.hargaPerBulan.idrFormat,
                          style: WTextStyle.caption1.accient,
                        ),
                        WSpacing.vertical.size4,
                        Text(
                          viewModel.model.kos?.alamat ?? '',
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jumlah Kontrakan",
                                  style: WTextStyle.subtitle2,
                                ),
                                WSpacing.vertical.size4,
                                Text(
                                  "Jumlah Ruang",
                                  style: WTextStyle.subtitle2,
                                ),
                                WSpacing.vertical.size4,
                                Text(
                                  "Luas",
                                  style: WTextStyle.subtitle2,
                                ),
                              ],
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " : ",
                                    style: WTextStyle.subtitle2,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    " : ",
                                    style: WTextStyle.subtitle2,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    " : ",
                                    style: WTextStyle.subtitle2,
                                  ),
                                ]),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${viewModel.model.jumlahKontrakan}',
                                  style: WTextStyle.subtitle2,
                                ),
                                WSpacing.vertical.size4,
                                Text(
                                  "${viewModel.model.jumlahRuang}",
                                  style: WTextStyle.subtitle2,
                                ),
                                WSpacing.vertical.size4,
                                Text(
                                  viewModel.model.luas,
                                  style: WTextStyle.subtitle2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Fasilitas',
                          style: WTextStyle.body1.bold,
                        ),
                        WSpacing.vertical.size4,
                        Column(
                          children: [
                            MapEntry('Perabot', viewModel.model.isPerabot),
                            MapEntry('Listrik', viewModel.model.isListrik),
                            MapEntry('Kamar mandi didalam',
                                viewModel.model.isKamarMandiDalem)
                          ]
                              .where((element) => element.value == 1)
                              .map((e) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '- ',
                                        style: WTextStyle.subtitle2,
                                      ),
                                      WSpacing.vertical.size4,
                                      Expanded(
                                        child: Text(
                                          e.key,
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: WTextStyle.subtitle2,
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                        WSpacing.vertical.size8,
                        Text(
                          'Foto',
                          style: WTextStyle.body1.bold,
                        ),
                        WSpacing.vertical.size4,
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.model.fotos.length,
                              itemBuilder: (_, position) => Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 150,
                                    child: WCacheImage(
                                      url: viewModel.model.fotos[position].foto,
                                      // height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: WColors.primary))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        viewModel.model.hargaPerBulan.idrFormat,
                        style: WTextStyle.subtitle2.accient,
                      ),
                      WSecondaryButton(
                        title: 'Ajukan Sewa',
                        onTap: () => NavigationService()
                            .router
                            .push(const PendaftaranRoute()),
                        fullWidth: false,
                      )
                    ]),
              )
            ],
          );
        }),
      ),
    );
  }
}
