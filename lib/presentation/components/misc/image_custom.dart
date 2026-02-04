import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tumbuh_iman/core/constant/asset_constant.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';

enum ImageType {
  asset,
  network,
  svg,
}

class ImageCustom extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final ImageType? type;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ImageCustom({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.type,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final ImageType effectiveType = type ?? _detectType();

    switch (effectiveType) {
      case ImageType.svg:
        return _buildSvg();
      case ImageType.network:
        return _buildNetwork();
      case ImageType.asset:
        return _buildAsset();
    }
  }

  ImageType _detectType() {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return ImageType.network;
    } else if (AssetConstants.isSvg(path)) {
      return ImageType.svg;
    } else {
      return ImageType.asset;
    }
  }

  Widget _buildSvg() {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      // Network SVG
      return SvgPicture.network(
        path,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) =>
        placeholder ?? _defaultPlaceholder(),
      );
    } else {
      // Asset SVG
      return SvgPicture.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) =>
        placeholder ?? _defaultPlaceholder(),
      );
    }
  }

  Widget _buildAsset() {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _defaultError();
      },
    );
  }

  Widget _buildNetwork() {
    return Image.network(
      path,
      width: width,
      height: height,
      fit: fit,
      color: color,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ?? _defaultPlaceholder();
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _defaultError();
      },
    );
  }

  Widget _defaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.border,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _defaultError() {
    return Container(
      width: width,
      height: height,
      color: AppColors.border,
      child: Icon(
        Icons.broken_image,
        color: AppColors.textSecondary,
      ),
    );
  }
}