/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/amazon_in.png
  AssetGenImage get amazonIn =>
      const AssetGenImage('assets/images/amazon_in.png');

  /// File path: assets/images/appliances.jpeg
  AssetGenImage get appliances =>
      const AssetGenImage('assets/images/appliances.jpeg');

  /// File path: assets/images/books.jpeg
  AssetGenImage get books => const AssetGenImage('assets/images/books.jpeg');

  /// File path: assets/images/electronics.jpeg
  AssetGenImage get electronics =>
      const AssetGenImage('assets/images/electronics.jpeg');

  /// File path: assets/images/essentials.jpeg
  AssetGenImage get essentials =>
      const AssetGenImage('assets/images/essentials.jpeg');

  /// File path: assets/images/fashion.jpeg
  AssetGenImage get fashion =>
      const AssetGenImage('assets/images/fashion.jpeg');

  /// File path: assets/images/mobiles.jpeg
  AssetGenImage get mobiles =>
      const AssetGenImage('assets/images/mobiles.jpeg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [amazonIn, appliances, books, electronics, essentials, fashion, mobiles];
}

class Assets {
  Assets._();

  static const String applepay = 'assets/applepay.json';
  static const String gpay = 'assets/gpay.json';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  List<String> get values => [applepay, gpay];
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
