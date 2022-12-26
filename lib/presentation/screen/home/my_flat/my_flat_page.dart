import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class MyFlatPage extends StatefulWidget {
  const MyFlatPage({Key? key}) : super(key: key);

  @override
  State<MyFlatPage> createState() => _MyFlatPageState();
}

class _MyFlatPageState extends State<MyFlatPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul Kost Ceritanya',
                style: WTextStyle.headline3.bold,
              ),
              WSpacing.vertical.size8,
              Text(
                'Nama Pemilik Kost - ',
                style: WTextStyle.subtitle2,
              ),
              WSpacing.vertical.size4,
              Text(
                'Alamat: Jl. Citra Raya Boulevard No.25/ 01, Panongan, Kec. Panongan, Kabupaten Tangerang, Banten 15711',
                style: WTextStyle.subtitle2,
              ),
              WSpacing.vertical.size8,
              Text(
                'Foto',
                style: WTextStyle.headline3.bold,
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
              WSpacing.vertical.size16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pembayaran',
                    style: WTextStyle.headline3.bold,
                  ),
                  WSecondaryButton(
                    title: 'Bayar Kos',
                    onTap: () =>
                        NavigationService().router.push(const PaymentRoute()),
                    fullWidth: false,
                  )
                ],
              ),
              WSpacing.vertical.size8,
              ListView(
                shrinkWrap: true,
                primary: false,
                children: List.generate(
                    3,
                    (index) => Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: WColors.primary)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Pembayaran ke 1',
                                                style:
                                                    WTextStyle.subtitle2.bold,
                                              ),
                                              Text(
                                                '01 Januari 2023',
                                                style:
                                                    WTextStyle.subtitle2.bold,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.check,
                                          color: WColors.accient,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
              WSpacing.vertical.size24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pengaduan',
                    style: WTextStyle.headline3.bold,
                  ),
                  WSecondaryButton(
                    title: 'Ajukan Keluhan',
                    onTap: () =>
                        NavigationService().router.push(const PengaduanRoute()),
                    fullWidth: false,
                  )
                ],
              ),
              WSpacing.vertical.size8,
              ListView(
                shrinkWrap: true,
                primary: false,
                children: List.generate(
                    3,
                    (index) => Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: WColors.primary)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Pengaduan ke 1',
                                                style:
                                                    WTextStyle.subtitle2.bold,
                                              ),
                                              Text(
                                                '01 Januari 2023',
                                                style:
                                                    WTextStyle.subtitle2.bold,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.check,
                                          color: WColors.accient,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
