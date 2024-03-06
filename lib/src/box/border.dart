import 'package:flutter/material.dart';

enum CustomBorderStyle { solid, dashed }

enum BorderRadiusSize { none, small, large, round }

enum BoxShadowStyle { basic, light, lighter, dark, none }

class BorderBox extends StatelessWidget {
  final Widget child;
  final CustomBorderStyle borderStyle;
  final double borderWidth;
  final BorderRadiusSize borderRadiusSize;
  final BoxShadowStyle boxShadowStyle;

  const BorderBox({
    super.key,
    required this.child,
    this.borderStyle = CustomBorderStyle.solid,
    this.borderWidth = 1.0,
    this.borderRadiusSize = BorderRadiusSize.none,
    this.boxShadowStyle = BoxShadowStyle.basic,
  });

  BorderRadius _getBorderRadius() {
    switch (borderRadiusSize) {
      case BorderRadiusSize.none:
        return BorderRadius.zero;
      case BorderRadiusSize.small:
        return BorderRadius.circular(2);
      case BorderRadiusSize.large:
        return BorderRadius.circular(4);
      case BorderRadiusSize.round:
        return BorderRadius.circular(20);
      default:
        return BorderRadius.zero;
    }
  }

  List<BoxShadow> _getBoxShadow() {
    switch (boxShadowStyle) {
      case BoxShadowStyle.basic:
        return [const BoxShadow(color: Colors.grey, blurRadius: 2.0)];
      case BoxShadowStyle.light:
        return [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 2.0)
        ];
      case BoxShadowStyle.lighter:
        return [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2.0)
        ];
      case BoxShadowStyle.dark:
        return [BoxShadow(color: Colors.grey[900]!, blurRadius: 2.0)];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: borderStyle == CustomBorderStyle.dashed
          ? DashBorderPainter(borderWidth: borderWidth)
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _getBorderRadius(),
          boxShadow: _getBoxShadow(),
        ),
        child: child,
      ),
    );
  }
}

// 自定义DashBorderPainter来绘制虚线边框
class DashBorderPainter extends CustomPainter {
  final double borderWidth;
  final Color color; // 添加颜色属性以便自定义虚线颜色

  DashBorderPainter({required this.borderWidth, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color // 使用传入的颜色
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    // 定义虚线的线段长度和间隔长度
    const dashWidth = 5.0;
    const dashSpace = 5.0;

    // 绘制上边框的虚线
    double x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + dashSpace;
    }

    // 绘制右边框的虚线
    double y = 0.0;
    while (y < size.height) {
      canvas.drawLine(
          Offset(size.width, y), Offset(size.width, y + dashWidth), paint);
      y += dashWidth + dashSpace;
    }

    // 绘制下边框的虚线
    x = size.width;
    while (x > 0) {
      canvas.drawLine(
          Offset(x, size.height), Offset(x - dashWidth, size.height), paint);
      x -= dashWidth + dashSpace;
    }

    // 绘制左边框的虚线
    y = size.height;
    while (y > 0) {
      canvas.drawLine(Offset(0, y), Offset(0, y - dashWidth), paint);
      y -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 如果旧的CustomPainter与当前的CustomPainter不同，则需要重绘
    return oldDelegate != this;
  }
}
