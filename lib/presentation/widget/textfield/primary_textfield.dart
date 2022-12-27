part of 'textfield.dart';

class WPrimaryTextField extends StatelessWidget {
  const WPrimaryTextField(
      {super.key,
      this.label,
      this.hint,
      this.isSecure = false,
      this.enable = true,
      this.textFieldType = WTextFieldType.defaultType,
      this.inputType,
      this.inputFormats,
      this.controller,
      this.focusNode,
      this.maxLines = 1,
      this.minLines = 1,
      this.onChanged,
      this.maxLength,
      this.suffix,
      this.onTap,
      this.onTapSuffix,
      this.validator});

  final String? label;
  final String? hint;
  final bool isSecure;
  final bool enable;
  final WTextFieldType textFieldType;

  /// Digunakan ketika textFieldType nya GCTextFieldType.defaultType
  final TextInputType? inputType;

  /// Digunakan ketika textFieldType nya GCTextFieldType.defaultType
  final List<TextInputFormatter>? inputFormats;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final Widget? suffix;
  final VoidCallback? onTapSuffix;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        enabled: enable,
        obscureText: textFieldType == WTextFieldType.defaultType
            ? isSecure
            : textFieldType.isSecure,
        controller: controller,
        keyboardType: textFieldType == WTextFieldType.defaultType
            ? inputType
            : textFieldType.keyboardType,
        inputFormatters: textFieldType == WTextFieldType.defaultType
            ? inputFormats
            : textFieldType.inputFormatter,
        autocorrect: false,
        focusNode: focusNode,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        onChanged: onChanged,
        validator: validator,
        style: WTextStyle.subtitle2,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          isDense: true,
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          hintStyle: WTextStyle.caption1.secondary,
          labelStyle: WTextStyle.caption1,
          suffixIcon: suffix == null
              ? null
              : GestureDetector(
                  onTap: onTapSuffix,
                  child: Container(
                      padding: const EdgeInsets.only(right: 12), child: suffix),
                ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }
}
