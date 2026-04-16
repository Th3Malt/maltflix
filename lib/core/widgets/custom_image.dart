import 'dart:io';

import 'package:maltflix/app_imports.dart';

class AppImage extends StatelessWidget {
  final bool local;
  final bool file;
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Alignment? alignment;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? opacity;
  final Widget Function(BuildContext, String, DownloadProgress)?
  progressIndicatorBuilder;
  final BorderRadiusGeometry? borderRadius;
  final String? fallbackSvgAsset;
  final String? fallbackPngAsset;
  final VoidCallback? onImageLoaded;
  final Duration fadeInDuration;
  const AppImage({
    super.key,
    this.local = false,
    required this.image,
    this.fit,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.alignment,
    this.progressIndicatorBuilder,
    this.color,
    this.colorBlendMode,
    this.opacity,
    this.borderRadius,
    this.fallbackSvgAsset,
    this.fallbackPngAsset,
    this.onImageLoaded,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.file = false,
  });

  static List<String> reportedImageUrlsWithError = [];

  static void reportError(String imageUrl, exception, stackTrace) {
    if (reportedImageUrlsWithError.contains(imageUrl)) return;
    reportedImageUrlsWithError.add(imageUrl);
    debugPrint("Error loading image: $imageUrl");
  }

  Widget defaultErrorWidget(BuildContext context) {
    if (fallbackSvgAsset != null) {
      return SvgPicture.asset(
        fallbackSvgAsset!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
    } else if (fallbackPngAsset != null) {
      return Image.asset(
        fallbackPngAsset!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
    }
    return const Icon(Icons.image);
  }

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: errorWidget != null
            ? errorWidget!(context, "", "")
            : defaultErrorWidget(context),
      );
    }
    if (file) {
      return Opacity(
        opacity: opacity ?? 1,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Image.file(
            File(image),
            fit: fit,
            alignment: alignment ?? Alignment.center,
            height: height,
            width: width,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, obj, stack) {
              return errorWidget != null
                  ? errorWidget!(context, obj.toString(), stack)
                  : defaultErrorWidget(context);
            },
            color: color,
            colorBlendMode: colorBlendMode,
          ),
        ),
      );
    }

    if (local) {
      return Opacity(
        opacity: opacity ?? 1,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Image.asset(
            image.contains('assets/images/') ? image : 'assets/images/$image',
            fit: fit,
            alignment: alignment ?? Alignment.center,
            height: height,
            width: width,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, obj, stack) {
              return errorWidget != null
                  ? errorWidget!(context, obj.toString(), stack)
                  : defaultErrorWidget(context);
            },
            color: color,
            colorBlendMode: colorBlendMode,
          ),
        ),
      );
    }

    return Opacity(
      opacity: opacity ?? 1,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          filterQuality: FilterQuality.high,
          imageUrl: image,
          fit: fit,
          height: height,
          alignment: alignment ?? Alignment.center,
          width: width,
          fadeOutDuration: Duration.zero,
          placeholder: (context, url) {
            return placeholder != null
                ? placeholder!(context, url)
                : SkeletonShimmer(
                    height: height,
                    width: width,
                    borderRadius: borderRadius,
                  );
          },
          errorWidget: (context, error, stack) {
            reportError(image, error, stack);

            return Image.network(
              image,
              fit: fit,
              alignment: alignment ?? Alignment.center,
              height: height,
              width: width,
              color: color,
              colorBlendMode: colorBlendMode,
              errorBuilder: (context, error, stack) {
                return errorWidget != null
                    ? errorWidget!(context, error.toString(), stack)
                    : defaultErrorWidget(context);
              },
            );
          },
          progressIndicatorBuilder: progressIndicatorBuilder,
          color: color,
          colorBlendMode: colorBlendMode,
          fadeInDuration: fadeInDuration,
          imageBuilder: (context, imageProvider) {
            if (onImageLoaded != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onImageLoaded!();
              });
            }
            return Image(
              image: imageProvider,
              fit: fit,
              alignment: alignment ?? Alignment.center,
              height: height,
              width: width,
              color: color,
              colorBlendMode: colorBlendMode,
            );
          },
        ),
      ),
    );
  }
}
