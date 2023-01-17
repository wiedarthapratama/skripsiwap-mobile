import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/viewmodel/user/user_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<UserViewModel>().loadProfile();
    });
    super.initState();
  }

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
        body: Consumer<UserViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              viewModel.loadProfile();
            },
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: .5.sh),
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
                                      viewModel.user?.name ?? 'Gagal',
                                      style: WTextStyle.headline3.bold,
                                    ),
                                    WSpacing.vertical.size8,
                                    Text(
                                      viewModel.user?.nohp ?? 'Gagal',
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
                            viewModel.user?.isPemilik ?? false
                                ? Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: InkWell(
                                      onTap: () => NavigationService()
                                          .router
                                          .push(const PemilikRoute()),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: WColors.primary)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Kelola Kost',
                                              style: WTextStyle.subtitle1.bold,
                                            ),
                                            Text(
                                              'Kelola kost dengan mudah disini',
                                              style: WTextStyle.subtitle2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: InkWell(
                                      onTap: () => NavigationService()
                                          .router
                                          .push(const DaftarPemilikRoute()),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: WColors.primary)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Daftar Pemilik Kost',
                                              style: WTextStyle.subtitle1.bold,
                                            ),
                                            Text(
                                              'Untuk mendaftar menjadi pemilik kost',
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
                                    .push(const UbahProfileRoute()),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: WColors.primary)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      border:
                                          Border.all(color: WColors.primary)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                onTap: viewModel.showLogoutConfirm,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: WColors.primary)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          ]),
                    ))),
          );
        }));
  }
}
