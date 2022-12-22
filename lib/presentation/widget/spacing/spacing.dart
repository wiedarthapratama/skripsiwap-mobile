import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum WSpacingDirection { vertical, horizontal }

class WSpacing extends SizedBox {
  const WSpacing({super.key, double? height, double? width})
      : super(height: height, width: width);

  static WSpacingDirection get vertical => WSpacingDirection.vertical;
}

extension WSpacingDirectionExt on WSpacingDirection {
  WSpacing get size6 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 6.h,
        )
      : WSpacing(
          width: 6.w,
        );
  WSpacing get size8 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 8.h,
        )
      : WSpacing(
          width: 8.w,
        );
  WSpacing get size12 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 12.h,
        )
      : WSpacing(
          width: 12.w,
        );
  WSpacing get size16 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 16.h,
        )
      : WSpacing(
          width: 16.w,
        );
  WSpacing get size24 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 24.h,
        )
      : WSpacing(
          width: 24.w,
        );
  WSpacing get size32 => this == WSpacingDirection.vertical
      ? WSpacing(
          height: 32.h,
        )
      : WSpacing(
          width: 32.w,
        );
}
