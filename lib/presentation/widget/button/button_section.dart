part of 'button.dart';

class WButtonSection extends StatelessWidget {
  const WButtonSection(
      {Key? key,
      required this.child,
      this.useShadow = true,
      this.paddingH = 16,
      this.paddingV = 12})
      : super(key: key);

  final Widget child;
  final bool useShadow;
  final double paddingH, paddingV;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: useShadow
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, -4))
                ]
              : null),
      child: SafeArea(top: false, child: child),
    );
  }
}
