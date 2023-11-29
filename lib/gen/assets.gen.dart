/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAssetsGen {
  const $AssetsAssetsGen();

  /// File path: assets/assets/Appliances.jpg
  AssetGenImage get appliances =>
      const AssetGenImage('assets/assets/Appliances.jpg');

  /// File path: assets/assets/Books.jpg
  AssetGenImage get books => const AssetGenImage('assets/assets/Books.jpg');

  /// File path: assets/assets/Fashion.jpg
  AssetGenImage get fashion => const AssetGenImage('assets/assets/Fashion.jpg');

  /// File path: assets/assets/appliancerose.jpg
  AssetGenImage get appliancerose =>
      const AssetGenImage('assets/assets/appliancerose.jpg');

  /// File path: assets/assets/bookswhite.jpg
  AssetGenImage get bookswhite =>
      const AssetGenImage('assets/assets/bookswhite.jpg');

  /// File path: assets/assets/essentials.jpeg
  AssetGenImage get essentials =>
      const AssetGenImage('assets/assets/essentials.jpeg');

  /// File path: assets/assets/essentialswhite.jpg
  AssetGenImage get essentialswhite =>
      const AssetGenImage('assets/assets/essentialswhite.jpg');

  /// File path: assets/assets/fashionred.jpg
  AssetGenImage get fashionred =>
      const AssetGenImage('assets/assets/fashionred.jpg');

  /// File path: assets/assets/login.webp
  AssetGenImage get login => const AssetGenImage('assets/assets/login.webp');

  /// File path: assets/assets/login2.jpeg
  AssetGenImage get login2 => const AssetGenImage('assets/assets/login2.jpeg');

  /// File path: assets/assets/mobile.jpg
  AssetGenImage get mobile => const AssetGenImage('assets/assets/mobile.jpg');

  /// File path: assets/assets/mobileblue.jpg
  AssetGenImage get mobileblue =>
      const AssetGenImage('assets/assets/mobileblue.jpg');

  /// File path: assets/assets/slider1.jpg
  AssetGenImage get slider1 => const AssetGenImage('assets/assets/slider1.jpg');

  /// File path: assets/assets/slider2.jpeg
  AssetGenImage get slider2 =>
      const AssetGenImage('assets/assets/slider2.jpeg');

  /// File path: assets/assets/slider3.jpg
  AssetGenImage get slider3 => const AssetGenImage('assets/assets/slider3.jpg');

  /// File path: assets/assets/slider5.jpg
  AssetGenImage get slider5 => const AssetGenImage('assets/assets/slider5.jpg');

  /// File path: assets/assets/slider6.jpg
  AssetGenImage get slider6 => const AssetGenImage('assets/assets/slider6.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        appliances,
        books,
        fashion,
        appliancerose,
        bookswhite,
        essentials,
        essentialswhite,
        fashionred,
        login,
        login2,
        mobile,
        mobileblue,
        slider1,
        slider2,
        slider3,
        slider5,
        slider6
      ];
}

class Assets {
  Assets._();

  static const $AssetsAssetsGen assets = $AssetsAssetsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
