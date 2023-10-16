import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {required this.height,
        required this.width,
        this.shapeBorder = const RoundedRectangleBorder()});

  const ShimmerWidget.circular(
      {this.width, this.height, this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          decoration:
          ShapeDecoration(shape: shapeBorder, color: Colors.grey[400]),
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!);
  }
}
