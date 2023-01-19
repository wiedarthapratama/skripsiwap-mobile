import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/home_viewmodel.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/master_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WColors.white,
      appBar: WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12, top: 12),
            child: Consumer<MasterViewModel>(builder: (_, viewModel, __) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      await NavigationService()
                          .router
                          .push(const NotifikasiRoute());
                      context.read<MasterViewModel>().getNotificationCount();
                    },
                    child: const Icon(
                      Icons.notifications,
                      size: 28,
                    ),
                  ),
                  if (viewModel.notification > 0)
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 14,
                        width: 14,
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: WColors.error,
                          borderRadius: WRadius.circular(50),
                        ),
                        child: Text('${viewModel.notification}',
                            style: WTextStyle.caption2.semiBold.white),
                      ),
                    ),
                ],
              );
            }),
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel()..init(),
        child: Consumer<HomeViewModel>(builder: (_, viewModel, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WSpacingDirection.vertical.size16,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewModel.onSearchModal();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.filter_alt_rounded),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: WPrimaryTextField(
                          hint: 'Pencarian',
                          controller: viewModel.namaController,
                          onSubmit: (val) async {
                            viewModel.onSearchSend();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                WSpacingDirection.vertical.size16,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rekomendasi',
                        style: WTextStyle.headline1.bold,
                      ),
                      WSpacingDirection.vertical.size24,
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: viewModel.dataRekomendasi
                            .map((rekomendasi) => InkWell(
                                  onTap: () => NavigationService().router.push(
                                      DetailKostRoute(
                                          idKosTipe: rekomendasi.idKostTipe)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        WCacheImage(
                                          url: rekomendasi.foto,
                                          // height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        WSpacing.vertical.size8,
                                        Text(
                                          rekomendasi.nama,
                                          style: WTextStyle.body2.semiBold,
                                        ),
                                        WSpacing.vertical.size4,
                                        Text(
                                          rekomendasi.alamat.toLowerCase(),
                                          style: WTextStyle.subtitle2,
                                        ),
                                        WSpacing.vertical.size4,
                                        Text(
                                          rekomendasi.hargaPerBulan.idrFormat,
                                          style: WTextStyle.caption1.accient,
                                        )
                                      ]),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
