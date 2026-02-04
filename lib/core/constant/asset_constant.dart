// lib/core/constants/asset_constants.dart

class AssetConstants {
  AssetConstants._();

  static bool isSvg(String path) {
    return path.toLowerCase().endsWith('.svg');
  }

  static bool isPng(String path) {
    return path.toLowerCase().endsWith('.png');
  }

  static bool isJpg(String path) {
    return path.toLowerCase().endsWith('.jpg') ||
        path.toLowerCase().endsWith('.jpeg');
  }
}