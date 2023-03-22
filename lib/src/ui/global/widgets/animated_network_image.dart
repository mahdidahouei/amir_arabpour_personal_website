import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedNetworkImage extends StatelessWidget {
  const AnimatedNetworkImage(
    this.src, {
    Key? key,
    this.scale = 1.0,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.isAntiAlias = false,
    this.headers,
    this.cacheWidth,
    this.cacheHeight,
    this.onImageLoaded,
    this.borderRadius = BorderRadius.zero,
    this.loadingPlaceHolder,
    this.errorPlaceHolder,
    this.backgroundColor,
    this.onNextTap,
    this.onPreviousTap,
  })  : assert(cacheWidth == null || cacheWidth > 0),
        assert(cacheHeight == null || cacheHeight > 0),
        super(key: key);
  final String src;

  final Map<String, String>? headers;

  final int? cacheWidth;

  final int? cacheHeight;

  final double scale;

  final ImageFrameBuilder? frameBuilder;

  final ImageLoadingBuilder? loadingBuilder;

  final ImageErrorWidgetBuilder? errorBuilder;

  final VoidCallback? onImageLoaded;

  final double? width;

  final double? height;

  final Color? color;

  final Color? backgroundColor;

  final Animation<double>? opacity;

  final FilterQuality filterQuality;

  final BlendMode? colorBlendMode;

  final BoxFit fit;

  final AlignmentGeometry alignment;

  final ImageRepeat repeat;

  final Rect? centerSlice;

  final bool matchTextDirection;

  final bool gaplessPlayback;

  final String? semanticLabel;

  final bool excludeFromSemantics;

  final bool isAntiAlias;

  final BorderRadius borderRadius;

  final Widget? loadingPlaceHolder;

  final Widget? errorPlaceHolder;

  final VoidCallback? onNextTap;

  final VoidCallback? onPreviousTap;

  Widget _buildImage(BuildContext context) {
    final themeData = Theme.of(context);
    final bool fitMatchesParent = fit == BoxFit.fill || fit == BoxFit.cover;
    return LayoutBuilder(builder: (context, viewPortConstraints) {
      return Image.network(
        src,
        fit: fit,
        frameBuilder: frameBuilder ??
            (BuildContext context, Widget child, int? frame,
                bool wasSynchronouslyLoaded) {
              final clickableChild = child;
              if (wasSynchronouslyLoaded) {
                onImageLoaded?.call();
                return clickableChild;
              }
              if (frame != null) {
                onImageLoaded?.call();
              }
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeOut,
                child: frame == null
                    ? Container(
                        height: height,
                        width: width,
                        color: Colors.transparent,
                        child: loadingPlaceHolder,
                      )
                    : clickableChild,
              );
            },
        errorBuilder: errorBuilder ??
            (context, error, stackTrace) {
              if (errorPlaceHolder != null) {
                return errorPlaceHolder!;
              }
              if (kDebugMode) {
                return Center(
                  child: Text(
                    error.toString(),
                    style: themeData.textTheme.bodyText2!.apply(
                      color: themeData.errorColor,
                    ),
                  ),
                );
              }
              return Container();
            },
        alignment: alignment,
        width: width ??
            (fitMatchesParent || fit == BoxFit.fitWidth
                ? viewPortConstraints.maxWidth
                : null),
        loadingBuilder: loadingBuilder,
        color: color,
        height: height ??
            (fitMatchesParent || fit == BoxFit.fitHeight
                ? viewPortConstraints.maxHeight
                : null),
        opacity: opacity,
        centerSlice: centerSlice,
        colorBlendMode: colorBlendMode,
        excludeFromSemantics: excludeFromSemantics,
        filterQuality: filterQuality,
        semanticLabel: semanticLabel,
        scale: scale,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        isAntiAlias: isAntiAlias,
        headers: headers,
        gaplessPlayback: gaplessPlayback,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ClipRRect(
      borderRadius: borderRadius,
      child: backgroundColor != null
          ? Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: themeData.colorScheme.secondary,
                ),
                _buildImage(context),
              ],
            )
          : _buildImage(context),
    );
  }
}
