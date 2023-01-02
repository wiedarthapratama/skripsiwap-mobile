import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/kos/kos_detail_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class KosDetailScreen extends StatefulWidget {
  const KosDetailScreen({Key? key, required this.id}) : super(key: key);

  static const String name = 'KosDetailScreen';

  final int id;

  @override
  State<KosDetailScreen> createState() => _KosDetailScreenState();
}

class _KosDetailScreenState extends State<KosDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KosDetailViewModel>(
      create: (_) => KosDetailViewModel()..init(widget.id),
      child: Consumer<KosDetailViewModel>(builder: (_, viewModel, __) {
        return Scaffold(
          appBar: WPrimaryAppBar(
            title: 'Aplikasi',
            elevation: .2,
            actions: [
              InkWell(
                onTap: () async {
                  final add = await NavigationService()
                      .router
                      .push(KosTipeFormRoute(kosModel: viewModel.model));

                  if (add != null) {
                    viewModel.init(widget.id);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 28,
                      ),
                      Text(
                        'Tambah Tipe',
                        style: WTextStyle.body2.semiBold,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.model.judul,
                          style: WTextStyle.headline3.bold,
                        ),
                        WSpacing.vertical.size6,
                        Text(
                          'Alamat: ${viewModel.model.alamat}',
                          style: WTextStyle.body2,
                        ),
                        WSpacing.vertical.size12,
                        ...viewModel.model.dataTipe
                            .map((tipe) => Container(
                                  margin: const EdgeInsets.only(
                                      top: 12, right: 12, left: 12),
                                  decoration: BoxDecoration(
                                      color: WColors.white,
                                      borderRadius: WRadius.size6,
                                      boxShadow: [wShadowCard]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () =>
                                          {} /* NavigationService()
                                .router
                                .push(KosDetailRoute(id: model.id)) */
                                      ,
                                      borderRadius: WRadius.size6,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    tipe.namaTipe,
                                                    style: WTextStyle
                                                        .headline3.semiBold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () async {
                                                          final add = await NavigationService()
                                                              .router
                                                              .push(KosTipeFormRoute(
                                                                  id: tipe.id,
                                                                  kosModel:
                                                                      viewModel
                                                                          .model));

                                                          if (add != null) {
                                                            viewModel.init(
                                                                widget.id);
                                                          }
                                                        },
                                                        borderRadius:
                                                            WRadius.circular(
                                                                50),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    WSpacing.horizontal.size4,
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () => viewModel
                                                            .onDelete(tipe),
                                                        borderRadius:
                                                            WRadius.circular(
                                                                50),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            WSpacing.vertical.size6,
                                            Text(
                                              tipe.hargaPerBulan.idrFormat,
                                              style: WTextStyle.body2.copyWith(
                                                  color: WColors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()
                      ],
                    ),
                  )),
        );
      }),
    );
  }
}
