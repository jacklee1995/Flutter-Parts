import 'package:flutter/material.dart';

import 'empty_flexi_card_item.dart';

/// FlexiCard是"Flexible Card"的简写，即"灵活卡片"，
/// 常用于移动应用的金刚区。这部分区域会根据产品业务目
/// 标变更进行调整，就像百变金刚一样灵活，所以叫做金刚区。
///
class FlexiCard extends StatelessWidget {
  final List<Widget> items;
  final Widget? leading;
  final List<Widget> actions;
  final IconData? actionIcon;
  final double? actionIconSize;
  final double? actionIconWeight;
  final Color? actionIconColor;
  final double? actionIconFill;

  /// 每行的item个数
  final int itemsPerLine;

  const FlexiCard({
    super.key,
    required this.items,
    this.leading,
    this.actions = const [],
    this.actionIcon = Icons.chevron_right_sharp,
    this.actionIconSize,
    this.actionIconWeight,
    this.actionIconColor,
    this.actionIconFill,
    this.itemsPerLine = 4, // 默认每行4个
    // this.direction = FlexiCardDirection.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: _buildRows(context),
    );
  }

  _buildRows(BuildContext context) {
    // 计算行数
    int rowCount = (items.length / itemsPerLine).ceil();
    // 构建所有行
    List<Widget> rows = List.generate(rowCount, (rowIndex) {
      // 计算当前行的起始和结束索引
      int start = rowIndex * itemsPerLine;
      int end = start + itemsPerLine;
      end = end > items.length ? items.length : end;

      // 获取当前行的items
      List<Widget> rowItems = items.sublist(start, end);

      // 如果是最后一行且元素不足，进行填充
      if (rowIndex == rowCount - 1 && rowItems.length < itemsPerLine) {
        int fillCount = itemsPerLine - rowItems.length;
        rowItems.addAll(
            List.generate(fillCount, (_) => const EmptyFlexiCardItem()));
      }

      // 返回构建的行
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rowItems,
      );
    });
    return Column(
      children: [
        if (leading != null || actions.isNotEmpty)
          Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: leading,
                ),
              if (actions.isNotEmpty) const Spacer(),
              if (actions.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      ...actions,
                      if (actionIcon != null)
                        Icon(
                          actionIcon,
                          size: actionIconSize,
                          // weight: actionIconWeight, // 注意：Icon类没有weight属性
                          color: actionIconColor,
                          // fill: actionIconFill, // 注意：Icon类没有fill属性
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ...rows,
      ],
    );
  }
}
