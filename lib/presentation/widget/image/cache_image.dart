part of 'image.dart';

class WCacheImage extends StatelessWidget {
  const WCacheImage(
      {Key? key,
      required this.url,
      this.headers,
      this.color,
      this.fit,
      this.width,
      this.height,
      this.errorWidget,
      this.placeholderWidget,
      this.imageBuilder,
      this.fadeInDuration,
      this.fadeOutDuration,
      this.memCacheWidth,
      this.memCacheHeight})
      : super(key: key);

  final String url;
  final Map<String, String>? headers;
  final Color? color;
  final BoxFit? fit;
  final double? width, height;
  final int? memCacheWidth, memCacheHeight;
  final LoadingErrorWidgetBuilder? errorWidget;
  final PlaceholderWidgetBuilder? placeholderWidget;
  final ImageWidgetBuilder? imageBuilder;
  final Duration? fadeInDuration, fadeOutDuration;

  @override
  Widget build(BuildContext context) {
    var h = <String, String>{};
    h['Keep-Alive'] = 'timeout=10';

    if (headers != null) h.addAll(headers!);

    return CachedNetworkImage(
      imageUrl: url,
      cacheKey: url,
      width: width,
      height: height,
      httpHeaders: h,
      fit: fit ?? BoxFit.fitWidth,
      color: color,
      fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 500),
      fadeOutDuration: fadeInDuration ?? const Duration(milliseconds: 1000),
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      imageBuilder: imageBuilder,
      placeholder: placeholderWidget,
      errorWidget: errorWidget ??
          (_, __, ___) => WAssets.image.placeholder.image(
                height: height,
                width: width,
                fit: fit,
              ),
    );
  }
}
