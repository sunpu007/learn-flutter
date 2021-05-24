import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {

  final Axis axis;
  final double dashedLineWidth;
  final double dashedLineHeight;
  final int count;
  final Color color;

  const DashedLine({
    this.axis = Axis.horizontal,
    this.dashedLineWidth = 1,
    this.dashedLineHeight = 1,
    this.count = 10,
    this.color = const Color(0xff999999),
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashedLineWidth,
          height: dashedLineHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
            ),
          ),
        );
      }),
    );
  }
}