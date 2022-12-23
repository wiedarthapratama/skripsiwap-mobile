part of 'textfield.dart';

class WPasswordTextField extends StatefulWidget {
  const WPasswordTextField({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  State<WPasswordTextField> createState() => _WPasswordTextFieldState();
}

class _WPasswordTextFieldState extends State<WPasswordTextField> {
  bool isSecure = true;

  void onChangeSecure() {
    setState(() {
      isSecure = !isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WPrimaryTextField(
      label: widget.label,
      isSecure: isSecure,
      suffix: (isSecure
              ? WAssets.outline.showPassword
              : WAssets.outline.hidePassword)
          .svg(color: WColors.primary, height: 24),
      onTapSuffix: onChangeSecure,
    );
  }
}
