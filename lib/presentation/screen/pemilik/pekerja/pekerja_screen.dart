import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/pekerja/pekerja_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class PekerjaScreen extends StatefulWidget {
  const PekerjaScreen({Key? key}) : super(key: key);

  static const String name = 'PekerjaScreen';

  @override
  State<PekerjaScreen> createState() => _PekerjaScreenState();
}

class _PekerjaScreenState extends State<PekerjaScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PekerjaViewModel>(
      create: (_) => PekerjaViewModel()..init(),
      child: Consumer<PekerjaViewModel>(
          builder: (_, viewModel, __) => Scaffold(
                appBar: WPrimaryAppBar(
                  title: 'Aplikasi',
                  elevation: .2,
                  actions: [
                    InkWell(
                      onTap: () async {
                        final add = await NavigationService()
                            .router
                            .push(PekerjaFormRoute());

                        if (add != null) {
                          viewModel.init();
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
                              'Tambah',
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
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: viewModel.data.length,
                        itemBuilder: (_, position) {
                          final model = viewModel.data[position];

                          return Container(
                            margin: const EdgeInsets.only(
                                top: 12, right: 16, left: 16),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              model.nama,
                                              style:
                                                  WTextStyle.headline3.semiBold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () async {
                                                    final add =
                                                        await NavigationService()
                                                            .router
                                                            .push(PekerjaFormRoute(
                                                                idPekerja:
                                                                    model.id));

                                                    if (add != null) {
                                                      viewModel.init();
                                                    }
                                                  },
                                                  borderRadius:
                                                      WRadius.circular(50),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(4),
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
                                                  onTap: () =>
                                                      viewModel.onDelete(model),
                                                  borderRadius:
                                                      WRadius.circular(50),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(4),
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
                                        model.alamat,
                                        style: WTextStyle.body2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
              )),
    );
  }
}
