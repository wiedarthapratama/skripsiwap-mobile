import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi_wap/config/assets.gen.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class WAppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const WAppBarSearch({
    Key? key,
    this.title,
    this.elevation,
    this.bottom,
    this.backButtonAction,
    this.focusNode,
    this.controller,
    this.isNotEmptySearch = false,
    this.onChanged,
    this.onSubmitted,
    this.isLoading,
    this.onTapAction,
  }) : super(key: key);

  final String? title;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final VoidCallback? backButtonAction;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool isNotEmptySearch;
  final ValueChanged<String>? onChanged, onSubmitted;
  final bool? isLoading;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      backgroundColor: WColors.white,
      iconTheme: ThemeData.light().iconTheme,
      elevation: elevation ?? 0,
      leading: _leading,
      centerTitle: false,
      bottom: bottom,
      title: WSearchableTextField(
        hint: title ?? 'Cari Lokasi',
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        enable: !(isLoading ?? false),
      ),
      titleSpacing: 0,
      actions: [_action],
    );
  }

  Widget get _leading => GestureDetector(
        onTap: () {
          if (backButtonAction != null) {
            backButtonAction!();
          } else {
            NavigationService().router.popForced();
          }
        },
        child: Container(
            width: 24,
            margin: const EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: WAssets.outline.arrowLeft.svg(
              color: WColors.primary,
              height: 24,
              width: 24,
            )),
      );

  Widget get _action => GestureDetector(
        onTap: onTapAction,
        child: Container(
            width: 24,
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.centerLeft,
            child: isLoading ?? false
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                    ),
                  )
                : (!isNotEmptySearch
                        ? WAssets.outline.search
                        : WAssets.outline.close)
                    .svg(
                    color: WColors.primary,
                    height: 24,
                    width: 24,
                  )),
      );

  @override
  Size get preferredSize => _PreferredAppBarSize(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0), 0);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
