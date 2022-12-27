part of 'button.dart';

class WPrimaryButton extends StatelessWidget {
  const WPrimaryButton(
      {Key? key,
      this.leftIcon,
      this.rightIcon,
      required this.title,
      required this.onTap,
      this.fullWidth = true,
      this.height = 40,
      this.isLight = false,
      this.isEnable = true,
      this.isLoading = false,
      this.color,
      this.strokeWidthLoading = 4.0,
      this.overflow})
      : super(key: key);

  final SvgGenImage? leftIcon, rightIcon;
  final String title;
  final VoidCallback onTap;
  final bool fullWidth, isLight;
  final double height, strokeWidthLoading;
  final bool isEnable, isLoading;
  final Color? color;
  final TextOverflow? overflow;

  Color get _color =>
      color ??
      (isLight ? WColors.white : (isEnable ? WColors.primary : WColors.grey70));

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: WColors.grey70, borderRadius: WRadius.size6),
            child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: strokeWidthLoading,
                )),
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(color: _color, borderRadius: WRadius.size6),
      child: InkWell(
        borderRadius: WRadius.size6,
        onTap: isEnable ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: height,
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leftIcon,
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: WTextStyle.subtitle2.semiBold.copyWith(
                    color: !isLight ? WColors.white : WColors.primary,
                    overflow: overflow ?? TextOverflow.ellipsis,
                  ),
                ),
              ),
              _rightIcon
            ],
          ),
        ),
      ),
    );
  }

  Widget get _leftIcon => leftIcon == null
      ? const SizedBox(
          width: 8,
        )
      : Container(
          padding: EdgeInsets.only(right: fullWidth ? 12 : 4),
          child: leftIcon!.svg(
            color: !isLight ? WColors.white : WColors.primary,
          ));

  Widget get _rightIcon => rightIcon == null
      ? const SizedBox(
          width: 8,
        )
      : Container(
          padding: EdgeInsets.only(left: fullWidth ? 12 : 4),
          child: rightIcon!.svg(
            color: !isLight ? WColors.white : WColors.primary,
          ));
}
