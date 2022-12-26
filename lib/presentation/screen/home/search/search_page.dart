import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: List.generate(
                        10,
                        (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const WCacheImage(
                                    url:
                                        'https://pps.unj.ac.id/wp-content/uploads/2021/09/placeholder-1.png',
                                    // height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  WSpacing.vertical.size8,
                                  Text(
                                    'Ceritanya Judul',
                                    style: WTextStyle.body2.semiBold,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    'Ceritanya Deskripsi',
                                    style: WTextStyle.subtitle2,
                                  ),
                                  WSpacing.vertical.size4,
                                  Text(
                                    'Rp 100.000',
                                    style: WTextStyle.caption1.accient,
                                  )
                                ])),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
