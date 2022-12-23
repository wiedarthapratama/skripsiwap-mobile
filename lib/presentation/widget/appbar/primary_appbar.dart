part of 'appbar.dart';

class WPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WPrimaryAppBar(
      {Key? key,
      this.title,
      this.elevation,
      this.actions,
      this.bottom,
      this.backButtonAction,
      this.showBackButton})
      : super(key: key);

  final String? title;
  final double? elevation;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? backButtonAction;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      backgroundColor: WColors.white,
      iconTheme: ThemeData.light().iconTheme,
      elevation: elevation ?? 4,
      leading: _leading(context),
      centerTitle: false,
      bottom: bottom,
      title: _title,
      actions: actions,
    );
  }

  Widget? get _title => title == null
      ? null
      : Text(
          title!,
          style: WTextStyle.subtitle1.semiBold,
        );

  Widget? _leading(BuildContext context) =>
      showBackButton ?? NavigationService().router.canPop()
          ? GestureDetector(
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
            )
          : null;

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
