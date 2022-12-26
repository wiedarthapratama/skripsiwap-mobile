part of 'modal.dart';

class WSnackBar extends SnackBar {
  final String title;
  final bool cancelable;
  final WSnackBarType type;

  ///! Working with [cancelable] true
  final VoidCallback? onTap;

  const WSnackBar(
      {Key? key,
      Widget content = const SizedBox.shrink(),
      required this.title,
      this.onTap,
      this.type = WSnackBarType.defaultSnackbar,
      this.cancelable = true})
      : super(key: key, content: content);

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  double? get elevation => 0;

  @override
  Widget get content => WSnackBarContent(
        title: title,
        onTap: onTap,
        type: type,
        cancelable: cancelable,
      );
}

class WSnackBarContent extends StatelessWidget {
  const WSnackBarContent(
      {Key? key,
      required this.title,
      this.onTap,
      required this.type,
      required this.cancelable})
      : super(key: key);

  final String title;
  final bool cancelable;
  final WSnackBarType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: type.color, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: WTextStyle.body2.semiBold.white,
          )),
          Visibility(
            visible: cancelable,
            child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                },
                child: WAssets.outline.close.svg(
                  color: WColors.white,
                  height: 24,
                  width: 24,
                )),
          ),
        ],
      ),
    );
  }
}
