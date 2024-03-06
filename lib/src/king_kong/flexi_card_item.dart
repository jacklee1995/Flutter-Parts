import 'package:flutter/material.dart';

class FlexiCardItem extends StatefulWidget {
  final void Function()? onTap;
  final Widget icon;
  final Widget text;

  /// 背景色
  final Color bgColor;

  /// 激活状态下的背景色
  final Color? activeBgColor;

  const FlexiCardItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
    this.bgColor = Colors.transparent,
    this.activeBgColor,
  });

  @override
  State<StatefulWidget> createState() => _FlexiCardItemState();
}

class _FlexiCardItemState extends State<FlexiCardItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // 背景色
    Color backgroundColor = widget.bgColor;

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
                  Expanded(
                    child: widget.icon,
                  ),
                  Expanded(
                    child: widget.text,
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

class ExptyFlexiCardItem extends StatelessWidget {
  const ExptyFlexiCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Spacer();
  }
}
