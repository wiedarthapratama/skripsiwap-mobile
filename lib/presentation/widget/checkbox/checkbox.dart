import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/assets.gen.dart';

class WCheckbox extends StatelessWidget {
  const WCheckbox(
      {Key? key,
      required this.isSelected,
      required this.onChanged,
      required this.title,
      this.children})
      : super(key: key);

  final bool isSelected;
  final ValueChanged<bool> onChanged;
  final String title;
  final List<InlineSpan>? children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onChanged(!isSelected);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected
                  ? WAssets.solid.checkboxOn.path
                  : WAssets.solid.checkboxOff.path,
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 4,
            ),
            Text.rich(TextSpan(
                text: title, style: WTextStyle.caption1, children: children)),
          ],
        ));
  }

  static textClickable({required String text, GestureRecognizer? gesture}) =>
      TextSpan(
          text: text,
          style: gesture == null
              ? WTextStyle.caption1
              : WTextStyle.caption1.semiBold,
          recognizer: gesture);
}
