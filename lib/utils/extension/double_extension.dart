import '../screen_fit.dart';

extension doubleFit on double {
  double get px {
    return ScreenFit.px2Rpx(this);
  }
  double get rpx {
    return ScreenFit.rpx2Px(this);
  }
}