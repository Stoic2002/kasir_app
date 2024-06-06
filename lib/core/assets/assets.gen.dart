/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Bookmark.png
  AssetGenImage get bookmark =>
      const AssetGenImage('assets/icons/Bookmark.png');

  /// File path: assets/icons/Category.png
  AssetGenImage get category =>
      const AssetGenImage('assets/icons/Category.png');

  /// File path: assets/icons/Home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/Home.png');

  /// File path: assets/icons/Profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/Profile.png');

  /// File path: assets/icons/Vector.png
  AssetGenImage get vector => const AssetGenImage('assets/icons/Vector.png');

  /// List of all assets
  List<AssetGenImage> get values => [bookmark, category, home, profile, vector];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.png');

  /// File path: assets/images/splash_screen1.png
  AssetGenImage get splashScreen1 =>
      const AssetGenImage('assets/images/splash_screen1.png');

  /// File path: assets/images/splash_screen2.png
  AssetGenImage get splashScreen2 =>
      const AssetGenImage('assets/images/splash_screen2.png');

  /// File path: assets/images/splash_screen3.png
  AssetGenImage get splashScreen3 =>
      const AssetGenImage('assets/images/splash_screen3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [logo, splashScreen, splashScreen1, splashScreen2, splashScreen3];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
