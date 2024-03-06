import 'package:flutter/material.dart';
import 'package:flutter_parts/src/king_kong/empty_flexi_card_item.dart';

/// ScrollableFlexiCard是"Flexible Card"的简写，即"灵活卡片"，
/// 常用于移动应用的金刚区。这部分区域会根据产品业务目
/// 标变更进行调整，就像百变金刚一样灵活，所以叫做金刚区。
///
class ScrollableFlexiCard extends StatefulWidget {
  final List<Widget> items;
  final Widget? leading;
  final List<Widget> actions;
  final IconData? actionIcon;
  final double? actionIconSize;
  final double? actionIconWeight;
  final Color? actionIconColor;
  final double? actionIconFill;

  /// 卡片背景色
  final Color? backgroundColor;
  final List<Widget> bottoms;

  /// 每行的item个数
  final int itemsPerRow;

  /// 单元的尺寸
  final double unitSize;

  /// 滚动控制
  final ScrollController controller;

  /// 排列方向
  // final ScrollableFlexiCardDirection direction;

  ScrollableFlexiCard({
    super.key,
    required this.items,
    this.leading,
    this.actions = const [],
    this.actionIcon = Icons.chevron_right_sharp,
    this.actionIconSize,
    this.actionIconWeight,
    this.actionIconColor,
    this.actionIconFill,
    this.itemsPerRow = 4, // 默认每行4个
    ScrollController? controller,
    this.bottoms = const [],
    this.unitSize = 80,
    this.backgroundColor,
  }) : controller = controller ?? ScrollController();

  @override
  State<StatefulWidget> createState() => ScrollableFlexiCardState();
}

class ScrollableFlexiCardState extends State<ScrollableFlexiCard> {
  @override
  void deactivate() {
    super.deactivate();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          // 第一部分
          if (widget.leading != null || widget.actions.isNotEmpty)
            Row(
              children: [
                if (widget.leading != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: widget.leading,
                  ),
                if (widget.actions.isNotEmpty) const Spacer(),
                if (widget.actions.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      children: [
                        ...widget.actions,
                        if (widget.actionIcon != null)
                          Icon(
                            widget.actionIcon,
                            size: widget.actionIconSize,
                            color: widget.actionIconColor,
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          // 第二部分
          _buildGrid(context),
          // 第三部分
          if (widget.bottoms.isNotEmpty) ...widget.bottoms,
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    /// 先假设空缺个数为0
    int vacant = 0;

    /// 元素总个数
    int itemCount = widget.items.length;

    /// 商是列数（每行元素个数）
    int columsCount = itemCount ~/ widget.itemsPerRow;

    /// 计算余数，是待补充元素个数
    int remainder = itemCount % widget.itemsPerRow;

    // 补充空元素后的整除组件表
    List<Widget> itemsWithEmpty;

    // 不被整除
    if (remainder != 0) {
      columsCount += 1; // 列数还需要加1，即真实每行元素个数
      vacant =
          widget.itemsPerRow * columsCount - widget.items.length; // 空缺数，用于补充空元素
    }

    itemsWithEmpty = [
      ...widget.items,
      ...List.generate(vacant, (index) => const EmptyFlexiCardItem())
    ];

    // 构建所有列
    List<Widget> columns = List.generate(columsCount, (index) {
      List<Widget> units = [];
      // 遍历行数
      for (var i = 0; i < widget.itemsPerRow; i++) {
        units.add(
          itemsWithEmpty[index + columsCount * i],
        );
      }

      // 构建列
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: units,
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: widget.controller,
      child: SizedBox(
        height: widget.unitSize * widget.itemsPerRow,
        child: Wrap(
          direction: Axis.vertical,
          children: columns,
        ),
      ),
    );
  }
}
