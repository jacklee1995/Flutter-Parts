import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const BoxContainer({
    super.key,
    required this.child,
    this.width = 100,
    this.height = 100,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
