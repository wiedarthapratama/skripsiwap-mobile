import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/pengaduan/pengaduan_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
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
        body: ChangeNotifierProvider<PengaduanViewModel>(
            create: (_) => PengaduanViewModel()..getDetail(id: widget.id),
            child: Consumer<PengaduanViewModel>(builder: (_, viewModel, __) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return viewModel.dataPengaduan == null
                  ? const Center(
                      child: Text('Error'),
                    )
                  : Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Judul',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.dataPengaduan.judul,
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
                                'Deskripsi',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.dataPengaduan.deskripsi,
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
                                'Status Pengaduan',
                                style: WTextStyle.body2,
                              ),
                              WSpacing.horizontal.size8,
                              Expanded(
                                child: Text(
                                  viewModel.dataPengaduan.status,
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
                            url: viewModel.dataPengaduan.fotoPengaduan,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    );
            })));
  }
}
