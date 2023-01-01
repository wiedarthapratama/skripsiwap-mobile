part of 'decoration.dart';

BoxShadow get wShadow => BoxShadow(
    color: WColors.black.withOpacity(.08),
    offset: const Offset(0, 4),
    spreadRadius: 0,
    blurRadius: 12);

BoxShadow get wShadowAccient => BoxShadow(
    color: WColors.black.withOpacity(.2),
    offset: const Offset(0, 4),
    spreadRadius: 0,
    blurRadius: 12);

BoxShadow get wShadowCard => BoxShadow(
    color: WColors.primary.withOpacity(.08),
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0);
