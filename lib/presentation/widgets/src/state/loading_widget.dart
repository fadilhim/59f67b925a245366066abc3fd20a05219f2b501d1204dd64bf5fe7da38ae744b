import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
    required this.width,
    required this.height,
  })  : boxDecoration = const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        super(key: key);

  const ShimmerLoading.circular({
    Key? key,
    this.width = double.infinity,
    required this.height,
  })  : boxDecoration = const ShapeDecoration(
          shape: CircleBorder(),
        ),
        super(key: key);

  final double width;
  final double height;
  final Decoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black45,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: boxDecoration,
      ),
    );
  }
}
