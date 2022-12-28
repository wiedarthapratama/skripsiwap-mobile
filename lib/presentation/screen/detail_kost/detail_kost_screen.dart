import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

import '../../../config/colors.gen.dart';
import '../../../config/route.gr.dart';
import '../../widget/image/image.dart';

class DetailKostScreen extends StatefulWidget {
  const DetailKostScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WCacheImage(
                      url:
                          'https://pps.unj.ac.id/wp-content/uploads/2021/09/placeholder-1.png',
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Judul Kost Ceritanya",
                          style: WTextStyle.headline3.semiBold,
                        ),
                        const Icon(Icons.map),
                      ],
                    ),
                    WSpacing.vertical.size4,
                    Text(
                      "Rp1.000.000",
                      style: WTextStyle.caption1.accient,
                    ),
                    WSpacing.vertical.size4,
                    Text(
                      "Ini ceritanya alamatnya",
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
                              "10",
                              style: WTextStyle.subtitle2,
                            ),
                            WSpacing.vertical.size4,
                            Text(
                              "1",
                              style: WTextStyle.subtitle2,
                            ),
                            WSpacing.vertical.size4,
                            Text(
                              "20x20m",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. ',
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size4,
                        Expanded(
                          child: Text(
                            'Perabot',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: WTextStyle.subtitle2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. ',
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size4,
                        Expanded(
                          child: Text(
                            'Listrik',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: WTextStyle.subtitle2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3. ',
                          style: WTextStyle.subtitle2,
                        ),
                        WSpacing.vertical.size4,
                        Expanded(
                          child: Text(
                            'Kamar mandi dalam',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: WTextStyle.subtitle2,
                          ),
                        ),
                      ],
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
                          itemCount: 10,
                          itemBuilder: (_, position) => Container(
                                margin: const EdgeInsets.only(right: 16),
                                width: 150,
                                child: const WCacheImage(
                                  url:
                                      'https://pps.unj.ac.id/wp-content/uploads/2021/09/placeholder-1.png',
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
                    "Rp1.000.000",
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
      ),
    );
  }
}
