import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {

  final double rating;
  final int maxRating;
  final int count;
  final Color unSelectedColor;
  final Color selectedColor;
  final double size;

  final Widget unSelectedImage;
  final Widget selectedImage;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.unSelectedColor = const Color(0xffdddddd),
    this.selectedColor = const Color(0xffff0000),
    this.size = 30,
    Widget unSelectedImage,
    Widget selectedImage
  }): unSelectedImage = unSelectedImage ?? Icon(Icons.star_border, color: unSelectedColor, size: size,),
      selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size),
    assert(() {
      if (rating > maxRating) {
        throw FlutterError('The value of rating is wrong and exceeds the maximum value of $maxRating');
      }
      return true;
    }());

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  int _selectCount;

  @override
  void initState() {
    super.initState();
    _selectCount = (widget.rating / (widget.maxRating / widget.count)).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.count, (_) {
            return widget.unSelectedImage;
          }),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildSelectWidget(),
        ),
      ],
    );
  }

  List<Widget> _buildSelectWidget() {
    List<Widget> list = [];
    final _star = widget.selectedImage;

    // 计算单个大小
    double oneValue = widget.maxRating / widget.count;
    // 计算沾满的个数
    int stained = (widget.rating / oneValue).floor();
    list.addAll(List.generate(stained, (int index) {
      return _star;
    }));
    // 计算剩余的大小
    double stay = ((widget.rating / oneValue) - stained) * widget.size;
    list.add(ClipRect(
      clipper: _StarCustomClipper(stay),
      child: _star,
    ));

    return list;
  }
}

class _StarCustomClipper extends CustomClipper<Rect> {

  double width;

  _StarCustomClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(_StarCustomClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}