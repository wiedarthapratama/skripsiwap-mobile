import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/screen/home/my_flat/my_flat_page.dart';
import 'package:skripsi_wap/presentation/screen/home/profile/profile_page.dart';
import 'package:skripsi_wap/presentation/screen/home/search/search_page.dart';
import 'package:skripsi_wap/service/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final List<MapEntry<String, MapEntry<IconData, Widget>>> menus = const [
    MapEntry('Cari', MapEntry<IconData, Widget>(Icons.search, SearchPage())),
    MapEntry('Kost Saya', MapEntry<IconData, Widget>(Icons.home, MyFlatPage())),
    MapEntry('Profil', MapEntry<IconData, Widget>(Icons.person, ProfilePage())),
  ];

  @override
  void initState() {
    FirebaseService.instance.token.then((value) {
      log('token: $value');
    });

    FirebaseService.instance.installationId.then((value) {
      log('installId: $value');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: menus[current].value.value),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 0.5,
              width: double.infinity,
              color: const Color.fromRGBO(0, 0, 0, 0.08),
            ),
            BottomNavigationBar(
              currentIndex: current,
              items: menus
                  .map((menu) => BottomNavigationBarItem(
                        label: menu.key,
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Icon(
                            menu.value.key,
                            color: WColors.primary,
                          ),
                        ),
                        activeIcon: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Icon(
                            menu.value.key,
                            color: WColors.accient,
                          ),
                        ),
                      ))
                  .toList(),
              backgroundColor: WColors.white,
              unselectedItemColor: WColors.secondary,
              selectedItemColor: WColors.accient,
              showUnselectedLabels: true,
              selectedLabelStyle: WTextStyle.overLine.semiBold,
              unselectedLabelStyle: WTextStyle.overLine.semiBold,
              type: BottomNavigationBarType.fixed,
              onTap: (index) async {
                current = index;
                setState(() {});
                /* final _isLogin = await StorageService.isLogin;
                      if ([2.menu, 4.menu].contains(index.menu) && !_isLogin) {
                        return viewModel.navigateToLogin();
                      }
                      viewModel.selectedMenu = index.menu; */
              },
            ),
          ],
        ),
      ),
    );
  }
}
