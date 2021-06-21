import '../screen_fit.dart';

extension intFit on int {
  double get px {
    return ScreenFit.px2Rpx(this.toDouble());
  }
  double get rpx {
    return ScreenFit.rpx2Px(this.toDouble());
  }
}