import 'package:flutter/widgets.dart';

/// 滚动进度指示器
class ScrollIndicator extends StatefulWidget {
  final ScrollController controller;
  final double spoutWidth;
  final double sliderWidth;
  final double sliderHeight;
  final Color spoutColor;
  final Color sliderColor;
  const ScrollIndicator(
    this.controller, {
    super.key,
    this.spoutWidth = 80,
    this.sliderWidth = 40,
    this.sliderHeight = 7,
    this.spoutColor = const Color.fromARGB(255, 183, 183, 183),
    this.sliderColor = const Color.fromARGB(255, 255, 134, 13),
  });

  @override
  State<StatefulWidget> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double scrollPercentage = 0.0;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      double scrollPosition = widget.controller.position.pixels;
      double maxScrollExtent = widget.controller.position.maxScrollExtent;
      setState(() {
        scrollPercentage = scrollPosition / maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.spoutWidth,
          height: widget.sliderHeight,
          decoration: BoxDecoration(
            color: widget.spoutColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Positioned(
          left: (widget.spoutWidth - widget.sliderWidth) * scrollPercentage,
          child: Container(
            width: widget.sliderWidth,
            height: widget.sliderHeight,
            decoration: BoxDecoration(
              color: widget.sliderColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
