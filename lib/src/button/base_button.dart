import 'package:flutter/material.dart';
import '../../flutter_parts.dart';
import '../const/colors.dart';
import '../const/enums.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final TypeEnum type;
  final SizeEnum size;
  final bool plain;
  final bool round;
  final bool circle;
  final bool loading;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final EffectEnum effect; // 新增effect属性

  const BaseButton({
    super.key,
    this.text = '',
    this.type = TypeEnum.primary,
    this.size = SizeEnum.defaultSize,
    this.plain = false,
    this.round = false,
    this.circle = false,
    this.loading = false,
    this.onPressed,
    this.color,
    this.icon,
    this.effect = EffectEnum.light, // 默认值为light
  });

  /// 计算最终的背景色
  Color _getBackgroundColor() {
    if (effect == EffectEnum.plain) {
      return Colors.transparent; // plain效果下背景透明
    }
    if (color != null) return color!;

    switch (effect) {
      case EffectEnum.light:
        return lightColors[type]!;
      case EffectEnum.dark:
        return darkColors[type]!;
      default:
        return lightColors[type]!;
    }
  }

  Color _getTextColor() {
    if (plain || loading || onPressed == null) {
      return darkColors[type]!;
    }
    // 根据effect调整文字颜色
    if (effect == EffectEnum.plain || effect == EffectEnum.light) {
      return darkColors[type]!;
    } else if (effect == EffectEnum.dark) {
      return Colors.white;
    }
    return Colors.white;
  }

  BorderSide _getBorderSide() {
    if (plain || loading || onPressed == null || effect != EffectEnum.dark) {
      return BorderSide(color: darkColors[type]!, width: 1);
    }

    return BorderSide.none;
  }

  double _getFontSize() {
    switch (size) {
      case SizeEnum.large:
        return 26.0;
      case SizeEnum.small:
        return 14.0;
      case SizeEnum.defaultSize:
      default:
        return 20.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 圆形按钮
    final buttonShape = circle
        ? const CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(round ? 20 : 4),
          );

    // 加载指示器
    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (loading)
          SizedBox(
            width: _getFontSize() - 3,
            height: _getFontSize() - 3,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        if (loading) const SizedBox(width: 6),
        if (!loading && icon != null) Icon(icon, color: _getTextColor()),
        if (!circle) Text(text),
      ],
    );

    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: _getTextColor(),
        backgroundColor: _getBackgroundColor(),
        shape: buttonShape,
        side: _getBorderSide(), // 根据effect使用边框
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: _getFontSize()),
      ),
      child: buttonChild,
    );
  }
}
