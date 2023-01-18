import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/home_viewmodel.dart';
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
      backgroundColor: WColors.bgGrey,
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
                color: WColors.primary,
              ),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel()..init(),
        child: Consumer<HomeViewModel>(builder: (_, viewModel, __) {
          return Column(
            children: [
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    WSpacingDirection.vertical.size16,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.filter_alt_rounded),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: const WPrimaryTextField(
                              hint: 'Pencarian',
                            ),
                          ),
                        ),
                      ],
                    ),
                    WSpacingDirection.vertical.size16,
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rekomendasi',
                        style: WTextStyle.headline1.bold,
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        children: viewModel.dataRekomendasi
                            .map((rekomendasi) => InkWell(
                                  onTap: () => NavigationService().router.push(
                                      DetailKostRoute(
                                          idKosTipe: rekomendasi.idKostTipe)),
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                              rekomendasi
                                                  .hargaPerBulan.idrFormat,
                                              style:
                                                  WTextStyle.caption1.accient,
                                            )
                                          ]),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              )),
            ],
          );
        }),
      ),
    );
  }
}
