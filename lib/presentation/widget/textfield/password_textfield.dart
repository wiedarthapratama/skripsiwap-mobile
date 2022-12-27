part of 'textfield.dart';

class WPasswordTextField extends StatefulWidget {
  const WPasswordTextField(
      {Key? key, required this.label, this.controller, this.validator})
      : super(key: key);

  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

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
      controller: widget.controller,
      suffix: (isSecure
              ? WAssets.outline.showPassword
              : WAssets.outline.hidePassword)
          .svg(color: WColors.primary, height: 24),
      onTapSuffix: onChangeSecure,
      validator: widget.validator,
    );
  }
}
