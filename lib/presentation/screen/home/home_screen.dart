import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/screen/home/my_flat/my_flat_page.dart';
import 'package:skripsi_wap/presentation/screen/home/profile/profile_page.dart';
import 'package:skripsi_wap/presentation/screen/home/search/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final List<MapEntry<String, MapEntry<Icon, Widget>>> menus = const [
    MapEntry(
        'Cari',
        MapEntry<Icon, Widget>(
            Icon(
              Icons.search,
              color: WColors.primary,
            ),
            SearchPage())),
    MapEntry(
        'Kost Saya',
        MapEntry<Icon, Widget>(
            Icon(
              Icons.home,
              color: WColors.primary,
            ),
            MyFlatPage())),
    MapEntry(
        'Profil',
        MapEntry<Icon, Widget>(
            Icon(
              Icons.person,
              color: WColors.primary,
            ),
            ProfilePage())),
  ];
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
                          child: menu.value.key,
                        ),
                        activeIcon: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: menu.value.key,
                        ),
                      ))
                  .toList(),
              backgroundColor: WColors.white,
              unselectedItemColor: WColors.secondary,
              selectedItemColor: WColors.primary,
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
