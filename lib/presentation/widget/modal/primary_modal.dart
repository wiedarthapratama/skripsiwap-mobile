part of 'modal.dart';

typedef GCModalBuilder<T> = Widget Function(BuildContext context);

class GCSimpleSheet extends StatelessWidget {
  final String title, description;
  final Widget? button;
  final VoidCallback? onSubmit;
  final String? buttonTitle;
  final Image? image;
  final SvgPicture? imageSvg;
  final CrossAxisAlignment alignment;

  const GCSimpleSheet(
      {Key? key,
      required this.title,
      required this.description,
      this.onSubmit,
      this.button,
      this.buttonTitle,
      this.image,
      this.imageSvg,
      this.alignment = CrossAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      alignment: alignment,
      footer: WBottomSheetFooter(
          child: button ??
              WPrimaryButton(
                  title: buttonTitle ?? 'Tutup',
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onSubmit != null) {
                      onSubmit!();
                    }
                  })),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: alignment,
        children: [
          if (image != null || imageSvg != null) ...[
            Center(
                child: Column(children: [image != null ? image! : imageSvg!])),
            const SizedBox(
              height: 32,
            )
          ],
          Text(
            title,
            style: WTextStyle.subtitle1.bold,
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.left,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: WTextStyle.body1.secondary,
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.left,
          ),
        ],
      ),
    );
  }
}
