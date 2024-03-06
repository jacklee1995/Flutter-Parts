import 'package:flutter/material.dart';

/// 带有自动添加/移除返回顶部按钮的页面自定义滚动组件
class TotopScrollView extends StatefulWidget {
  /// 固定在滚顶区域上方的组件
  final Widget? above;

  final bool isDarkMode;

  /// 用于自定义滚顶元素的 slivers
  final List<Widget> slivers;

  final Widget icon;

  /// 固定在滚顶区域下方的组件
  final Widget? under;
  const TotopScrollView({
    super.key,
    this.above,
    this.slivers = const <Widget>[],
    this.under,
    this.isDarkMode = false,
    Widget? icon,
  }) : icon = icon ??
            const Icon(
              Icons.arrow_upward,
              color: Colors.amber,
            );

  @override
  State<StatefulWidget> createState() => _TotopScrollViewState();
}

class _TotopScrollViewState extends State<TotopScrollView> {
  final ScrollController _scrollController = ScrollController();
  bool _showToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 100 && !_showToTopButton) {
      setState(() {
        _showToTopButton = true;
      });
    } else if (_scrollController.offset < 100 && _showToTopButton) {
      setState(() {
        _showToTopButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            if (widget.above != null) widget.above!,
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: widget.slivers,
              ),
            ),
            if (widget.under != null) widget.under!
          ],
        ),
        // 返回顶部按钮
        if (_showToTopButton)
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 10,
              backgroundColor:
                  widget.isDarkMode ? Colors.white : Colors.blueGrey[900],
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: widget.icon,
            ),
          ),
      ],
    );
  }
}
