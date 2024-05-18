import 'package:final_assignment/screen/splash_screen.dart';

import '../constants/constant_path.dart';

class _AssetsImagesGen {
  const _AssetsImagesGen();

  String get Logo => '$kImagesPath/Logo.png';
  String get SplashScreen => '$kImagesPath/splash.png';
  String get AppleLogo => '$kImagesPath/apple.png';
  String get GoogleLogo => '$kImagesPath/google.png';
  String get Facebook => '$kImagesPath/facebook.png';
  String get Banner => '$kImagesPath/banner.png';
}

class _AssetsSvgImagesGen {
  const _AssetsSvgImagesGen();

  String get back => '$kSvgImagesPath/long_back.svg';
}

class Assets {
  Assets._();
  static const images = _AssetsImagesGen();
  static const svgImages = _AssetsSvgImagesGen();
}
