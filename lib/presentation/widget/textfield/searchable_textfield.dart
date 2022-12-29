part of 'textfield.dart';

class WSearchableTextField extends StatelessWidget {
  const WSearchableTextField(
      {Key? key,
      this.controller,
      required this.hint,
      this.focusNode,
      this.onChanged,
      this.onSubmitted,
      this.enable})
      : super(key: key);

  final TextEditingController? controller;
  final String hint;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged, onSubmitted;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableSuggestions: false,
      enabled: enable,
      controller: controller,
      focusNode: focusNode,
      style: WTextStyle.body1.primary.semiBold,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: WTextStyle.body1.primary.semiBold),
      maxLines: 1,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
