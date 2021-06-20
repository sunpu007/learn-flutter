import 'dart:ui';

/// 屏幕适配工具类
/// - 程序主入口初始化
/// - 使用：
///  - px转rpx: ScreenFit.px2Rpx(double px)
///  - rpx转px: ScreenFit.rpx2Px(double rpx)
class ScreenFit {
  // 屏幕物理宽度
  static double _physicalWidth;
  // 屏幕物理高度
  static double _physicalHeight;
  // 设备像素比
  static double _dpr;
  // 屏幕宽度
  static double _screenWidth;
  // 屏幕高度
  static double _screenHeight;

  static double _rpx;
  static double _px;

  static void initialize({double standardWidth = 750}) {
    _physicalWidth = window.physicalSize.width;
    _physicalHeight = window.physicalSize.height;
    _dpr = window.devicePixelRatio;
    _screenWidth = _physicalWidth / _dpr;
    _screenHeight = _physicalHeight / _dpr;
    _rpx = _screenWidth / standardWidth;
    _px = _screenWidth / standardWidth * 2;
  }

  static double px2Rpx(double px) {
    return _rpx * px;
  }

  static double rpx2Px(double rpx) {
    return _px * rpx;
  }
}