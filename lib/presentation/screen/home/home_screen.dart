import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/viewmodel/master/master_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MasterViewModel>().saveOrUpdateToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterViewModel>(builder: (_, viewModel, __) {
      return Scaffold(
        body: SafeArea(child: viewModel.navigation.page),
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
                currentIndex: viewModel.navigation.key,
                items: NavigationEnum.values
                    .map((menu) => BottomNavigationBarItem(
                          label: menu.name,
                          icon: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Icon(
                              menu.icon,
                              color: WColors.primary,
                            ),
                          ),
                          activeIcon: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Icon(
                              menu.icon,
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
                  viewModel.navigation = index.asNavigation;
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
    });
  }
}
