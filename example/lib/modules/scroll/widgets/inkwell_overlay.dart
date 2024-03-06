import 'package:flutter/material.dart';

/// 用于为子部件提供触摸交互叠加效果的包装器部件
class InkWellOverlay extends StatelessWidget {
  /// 参数：
  /// - [key]: 用于唯一标识此小部件的键
  /// - [onTap]: onTap
  /// - [height]: 包装InkWell的SizedBox的高度
  /// - [child]: 要由InkWell包装的小部件
  const InkWellOverlay({
    super.key,
    this.onTap,
    this.height,
    this.child,
    this.padding,
    this.margin,
  });

  /// 当InkWell被点击时触发的回调函数
  final VoidCallback? onTap;

  /// 包装InkWell的SizedBox的高度
  final double? height;

  /// 要由InkWell包装的小部件
  final Widget? child;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
