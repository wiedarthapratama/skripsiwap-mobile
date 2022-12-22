part of 'decoration.dart';

class WRadius extends BorderRadius {
  const WRadius.all(super.radius) : super.all();
  WRadius.circular(double radius) : super.circular(radius);

  static WRadius get size6 => WRadius.circular(6.r);
  static WRadius get size12 => WRadius.circular(12.r);
  static WRadius get size16 => WRadius.circular(16.r);
  static WRadius get size24 => WRadius.circular(24.r);
  static WRadius get size32 => WRadius.circular(32.r);
}
