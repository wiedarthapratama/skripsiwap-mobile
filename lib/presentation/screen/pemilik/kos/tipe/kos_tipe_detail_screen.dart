import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/presentation/viewmodel/kos/tipe/kos_tipe_detail_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/checkbox/checkbox.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class KosTipeDetailScreen extends StatefulWidget {
  const KosTipeDetailScreen({Key? key, required this.id, required this.kos})
      : super(key: key);

  static const String name = 'KosTipeDetailScreen';
  final int id;
  final KosModel kos;

  @override
  State<KosTipeDetailScreen> createState() => _KosTipeDetailScreenState();
}

class _KosTipeDetailScreenState extends State<KosTipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KosTipeDetailViewModel>(
      create: (_) => KosTipeDetailViewModel()
        ..init(idKosTipe: widget.id, idKos: widget.kos.id),
      child: Consumer<KosTipeDetailViewModel>(builder: (_, viewModel, __) {
        return Scaffold(
          appBar: const WPrimaryAppBar(
            title: 'Aplikasi',
            elevation: .2,
          ),
          body: viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.kosModel.judul,
                        style: WTextStyle.headline3.bold,
                      ),
                      WSpacing.vertical.size6,
                      Text(
                        'Alamat: ${viewModel.kosModel.alamat}',
                        style: WTextStyle.body2,
                      ),
                      WSpacing.vertical.size6,
                      Text(
                        'Jumlah Kos: ${viewModel.model.jumlahKontrakan}',
                        style: WTextStyle.body2,
                      ),
                      WSpacing.vertical.size6,
                      Text(
                        'Harga: ${viewModel.model.hargaPerBulan.idrFormat}',
                        style: WTextStyle.body2,
                      ),
                      WSpacing.vertical.size6,
                      Text(
                        'Jumlah Ruang: ${viewModel.model.jumlahRuang}',
                        style: WTextStyle.body2,
                      ),
                      WSpacing.vertical.size6,
                      Text(
                        'Luas: ${viewModel.model.luas}',
                        style: WTextStyle.body2,
                      ),
                      WSpacing.vertical.size12,
                      Text(
                        'Fasilitas',
                        style: WTextStyle.headline3.bold,
                      ),
                      WSpacing.vertical.size6,
                      WCheckbox(
                          isSelected: viewModel.model.isPerabot == 1,
                          onChanged: (value) => {},
                          title: 'Include Perabot'),
                      WSpacing.vertical.size6,
                      WCheckbox(
                          isSelected: viewModel.model.isRumah == 1,
                          onChanged: (value) => {},
                          title: 'Tipenya Rumah'),
                      WSpacing.vertical.size6,
                      WCheckbox(
                          isSelected: viewModel.model.isKamarMandiDalem == 1,
                          onChanged: (value) => {},
                          title: 'Kamar Mandi Dalam'),
                      WSpacing.vertical.size6,
                      WCheckbox(
                          isSelected: viewModel.model.isListrik == 1,
                          onChanged: (value) => {},
                          title: 'Include Listrik'),
                      WSpacing.vertical.size12,
                      Text(
                        'Foto Kos',
                        style: WTextStyle.headline3.bold,
                      ),
                      WSpacing.vertical.size6,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Row(
                          children: viewModel.model.fotos
                              .map((e) => Container(
                                    margin: const EdgeInsets.only(right: 12),
                                    color: WColors.white,
                                    child: WCacheImage(
                                      url: e.foto,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      WSpacing.vertical.size12,
                      WPrimaryButton(
                          fullWidth: false,
                          title: 'Tambah Foto',
                          isLoading: viewModel.isLoadingCTA,
                          onTap: viewModel.addImage)
                    ],
                  ),
                )),
        );
      }),
    );
  }
}
