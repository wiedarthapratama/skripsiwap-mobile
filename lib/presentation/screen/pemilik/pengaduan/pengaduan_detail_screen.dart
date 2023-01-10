import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/viewmodel/pengaduan/pengaduan_detail_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PengaduanDetailScreen extends StatefulWidget {
  const PengaduanDetailScreen({Key? key, required this.id}) : super(key: key);

  static const String name = 'PengaduanDetailScreen';
  final int id;

  @override
  State<PengaduanDetailScreen> createState() => _PengaduanDetailScreenState();
}

class _PengaduanDetailScreenState extends State<PengaduanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const WPrimaryAppBar(
          title: 'Aplikasi',
          elevation: .2,
        ),
        body: ChangeNotifierProvider<PengaduanDetailViewModel>(
            create: (_) => PengaduanDetailViewModel()..init(widget.id),
            child:
                Consumer<PengaduanDetailViewModel>(builder: (_, viewModel, __) {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Pengaduan',
                            style: WTextStyle.headline3.bold,
                          ),
                          WSpacing.vertical.size16,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Judul',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.model.judul,
                                  style: WTextStyle.body2.bold,
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          WSpacing.vertical.size8,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Deskripsi',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.model.deskripsi,
                                  style: WTextStyle.body2.bold,
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          WSpacing.vertical.size8,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status Pengaduan',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.model.status,
                                  style: WTextStyle.body2.bold,
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                          WSpacing.vertical.size8,
                          Text(
                            'Bukti Pelengkap',
                            style: WTextStyle.body2,
                          ),
                          WSpacing.vertical.size6,
                          WCacheImage(
                            url: viewModel.model.fotoPengaduan,
                            fit: BoxFit.cover,
                          ),
                          WSpacing.vertical.size8,
                          viewModel.model.pengerjaan == null
                              ? Center(
                                  child: WPrimaryButton(
                                      title: 'Kirim Pekerja',
                                      fullWidth: false,
                                      isLoading: viewModel.isLoadingCTA,
                                      onTap: viewModel.onSendModal),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(
                                    top: 12,
                                  ),
                                  decoration: BoxDecoration(
                                      color: WColors.white,
                                      borderRadius: WRadius.size6,
                                      boxShadow: [wShadowCard]),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                viewModel
                                                    .model.pengerjaan!.status,
                                                style: WTextStyle
                                                    .headline3.semiBold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        WSpacing.vertical.size6,
                                        Text(
                                          viewModel.model.pengerjaan!
                                              .durasiPengerjaan,
                                          style: WTextStyle.body2,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
