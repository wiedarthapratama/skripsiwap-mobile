import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';
import 'package:skripsi_wap/service/storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Judul Kost Ceritanya',
                                style: WTextStyle.headline3.bold,
                              ),
                              WSpacing.vertical.size8,
                              Text(
                                '628xx-xxxx-xxxx',
                                style: WTextStyle.subtitle2,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.person,
                            color: WColors.accient,
                            size: 50,
                          )
                        ],
                      ),
                      WSpacing.vertical.size8,
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: InkWell(
                          onTap: () => NavigationService()
                              .router
                              .push(const UbahProfileRoute()),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: WColors.primary)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Ubah Profil',
                                  style: WTextStyle.subtitle1.bold,
                                ),
                                Text(
                                  'Untuk ubah data profil pribadi',
                                  style: WTextStyle.subtitle2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: InkWell(
                          onTap: () => NavigationService()
                              .router
                              .push(const UbahPasswordRoute()),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: WColors.primary)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Ubah Password',
                                  style: WTextStyle.subtitle1.bold,
                                ),
                                Text(
                                  'Untuk ubah data password',
                                  style: WTextStyle.subtitle2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: InkWell(
                          onTap: () async {
                            await StorageService.delete(
                                StorageKeyEnum.accessToken);
                            NavigationService().router.push(const LoginRoute());
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: WColors.primary)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Keluar',
                                  style: WTextStyle.subtitle1.bold,
                                ),
                                Text(
                                  'Untuk keluar dari aplikasi',
                                  style: WTextStyle.subtitle2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
