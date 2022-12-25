import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

part 'bottom_sheet_modal.dart';
part 'primary_modal.dart';

class GCModal {
  static Future<dynamic>? show(BuildContext? context,
      {required String title,
      required String message,
      String? name,
      Image? image,
      SvgPicture? imageSvg,
      CrossAxisAlignment alignment = CrossAxisAlignment.center,
      Widget? button,
      bool isScrollControlled = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool canDuplicate = true,
      VoidCallback? onSubmit,
      WBottomSheetFooter? footer}) {
    String namedRoute = name ?? 'modal-bottom-sheet';
    bool canCountinue = true;
    if (context == null) {
      return null;
    }

    if (!canDuplicate) {
      NavigationService().navigationKey.currentState?.popUntil((route) {
        if (route.settings.name == namedRoute) {
          canCountinue = false;
        }
        return true;
      });
    }

    if (!canCountinue) return null;

    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        isScrollControlled: isScrollControlled,
        routeSettings: RouteSettings(name: namedRoute),
        builder: (_) => GCSimpleSheet(
              title: title,
              description: message,
              image: image,
              imageSvg: imageSvg,
              button: button,
              alignment: alignment,
              onSubmit: onSubmit,
            ));
  }

  static Future<dynamic>? builder(
    BuildContext? context, {
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    if (context == null) {
      return null;
    }
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        builder: (_) =>
            child /* builder */ /* GCSimpleSheet.builder(builder: builder, padding: padding, footer: footer) */);
  }
}
