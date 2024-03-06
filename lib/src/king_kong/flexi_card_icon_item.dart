import 'package:flutter/material.dart';

class FlexiCardIconItem extends StatefulWidget {
  final void Function()? onTap;
  final IconData icon;
  final String text;

  /// 前景色
  final Color? foreColor;

  /// 背景色
  final Color bgColor;

  /// 激活状态下的前景色
  final Color? activeForeColor;

  /// 激活状态下的背景色
  final Color? activeBgColor;

  const FlexiCardIconItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
    this.bgColor = Colors.transparent,
    this.foreColor,
    this.activeForeColor,
    this.activeBgColor,
  });

  @override
  State<StatefulWidget> createState() => _FlexiCardIconItemState();
}

class _FlexiCardIconItemState extends State<FlexiCardIconItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // 前景色
    Color foreGroundColor =
        widget.foreColor ?? Theme.of(context).textTheme.bodyLarge!.color!;
    // 背景色
    Color backgroundColor = widget.bgColor;

    Color activeForeColor =
        widget.activeForeColor ?? Theme.of(context).primaryColor;
    Color activeBgColor = widget.activeBgColor ?? Theme.of(context).focusColor;

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  _isPressed ? activeBgColor : backgroundColor, // 使用主题背景色或激活背景色
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 24,
                    color: _isPressed ? activeForeColor : foreGroundColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: _isPressed ? activeForeColor : foreGroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExptyFlexiCardIconItem extends StatelessWidget {
  const ExptyFlexiCardIconItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Spacer();
  }
}
