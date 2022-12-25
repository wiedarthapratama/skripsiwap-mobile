part of 'modal.dart';

class WBottomSheet extends StatelessWidget {
  const WBottomSheet(
      {Key? key,
      required this.child,
      this.paddingH = 16,
      this.footer,
      this.alignment})
      : super(key: key);

  final Widget child;
  final double paddingH;
  final WBottomSheetFooter? footer;
  final CrossAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: paddingH),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24))),
      child: SafeArea(
        top: false,
        bottom: footer == null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                    color: WColors.divider,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            WSpacing.vertical.size24,
            Flexible(child: child),
            if (footer != null) ...[WSpacing.vertical.size16, footer!],
          ],
        ),
      ),
    );
  }
}

class WBottomSheetFooter extends StatelessWidget {
  const WBottomSheetFooter({Key? key, required this.child, this.paddingH})
      : super(key: key);

  final Widget child;
  final double? paddingH;

  @override
  Widget build(BuildContext context) {
    return WButtonSection(
        useShadow: false, paddingH: paddingH ?? 0, child: child);
  }
}
