import 'package:flutter/material.dart';

import 'package:flutter_parts/flutter_parts.dart';

import '../../utils.dart';
import 'move_tab.dart';
import 'toggle_checked_tab.dart';

class LabelView extends StatelessWidget {
  static const String url = '/label';
  const LabelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h1('Tag 组件'),
                h2('1.基础用法'),
                row(
                  const [
                    Tag(
                      type: TypeEnum.primary,
                      child: Text('primary'),
                    ),
                    Tag(
                      type: TypeEnum.success,
                      child: Text('success'),
                    ),
                    Tag(
                      type: TypeEnum.info,
                      child: Text('info'),
                    ),
                    Tag(
                      type: TypeEnum.warning,
                      child: Text('warning'),
                    ),
                    Tag(
                      type: TypeEnum.danger,
                      child: Text('danger'),
                    ),
                  ],
                ),
                h2('2.可移除标签'),
                row(
                  [
                    const MoveTab(
                      'primary',
                      type: TypeEnum.primary,
                    ),
                    const MoveTab(
                      'success',
                      type: TypeEnum.success,
                    ),
                    const MoveTab(
                      'info',
                      type: TypeEnum.info,
                    ),
                    const MoveTab(
                      'warning',
                      type: TypeEnum.warning,
                    ),
                    const MoveTab(
                      'danger',
                      type: TypeEnum.danger,
                    ),
                  ],
                ),
                row(
                  [
                    const MoveTab(
                      'primary',
                      effect: EffectEnum.light,
                      type: TypeEnum.primary,
                    ),
                    const MoveTab(
                      'success',
                      effect: EffectEnum.light,
                      type: TypeEnum.success,
                    ),
                    const MoveTab(
                      'info',
                      effect: EffectEnum.light,
                      type: TypeEnum.info,
                    ),
                    const MoveTab(
                      'warning',
                      effect: EffectEnum.light,
                      type: TypeEnum.warning,
                    ),
                    const MoveTab(
                      'danger',
                      effect: EffectEnum.light,
                      type: TypeEnum.danger,
                    ),
                  ],
                ),
                h2('3.不同尺寸'),
                row(const [
                  Tag(size: SizeEnum.large, child: Text('Large')),
                  Tag(size: SizeEnum.defaultSize, child: Text('Default')),
                  Tag(size: SizeEnum.small, child: Text('Small')),
                ]),
                h2('4.效果'),
                row(const [
                  Tag(
                    effect: EffectEnum.dark,
                    child: Text('dark'),
                  ),
                  Tag(
                    effect: EffectEnum.light,
                    child: Text('light'),
                  ),
                  Tag(
                    effect: EffectEnum.plain,
                    child: Text('plain'),
                  ),
                ]),
                h2('5.圆形标签'),
                row(const [
                  Tag(
                    effect: EffectEnum.dark,
                    round: true,
                    type: TypeEnum.primary,
                    child: Text('Tag1'),
                  ),
                  Tag(
                    effect: EffectEnum.dark,
                    round: true,
                    type: TypeEnum.success,
                    child: Text('Tag2'),
                  ),
                  Tag(
                    effect: EffectEnum.dark,
                    round: true,
                    type: TypeEnum.info,
                    child: Text('Tag3'),
                  ),
                  Tag(
                    effect: EffectEnum.dark,
                    round: true,
                    type: TypeEnum.warning,
                    child: Text('Tag4'),
                  ),
                  Tag(
                    effect: EffectEnum.dark,
                    round: true,
                    type: TypeEnum.danger,
                    child: Text('Tag5'),
                  ),
                ]),
                row(const [
                  Tag(
                    effect: EffectEnum.light,
                    round: true,
                    type: TypeEnum.primary,
                    child: Text('Tag1'),
                  ),
                  Tag(
                    effect: EffectEnum.light,
                    round: true,
                    type: TypeEnum.success,
                    child: Text('Tag2'),
                  ),
                  Tag(
                    effect: EffectEnum.light,
                    round: true,
                    type: TypeEnum.info,
                    child: Text('Tag3'),
                  ),
                  Tag(
                    effect: EffectEnum.light,
                    round: true,
                    type: TypeEnum.warning,
                    child: Text('Tag4'),
                  ),
                  Tag(
                    effect: EffectEnum.light,
                    round: true,
                    type: TypeEnum.danger,
                    child: Text('Tag5'),
                  ),
                ]),
                row(const [
                  Tag(
                    effect: EffectEnum.plain,
                    round: true,
                    type: TypeEnum.primary,
                    child: Text('Tag1'),
                  ),
                  Tag(
                    effect: EffectEnum.plain,
                    round: true,
                    type: TypeEnum.success,
                    child: Text('Tag2'),
                  ),
                  Tag(
                    effect: EffectEnum.plain,
                    round: true,
                    type: TypeEnum.info,
                    child: Text('Tag3'),
                  ),
                  Tag(
                    effect: EffectEnum.plain,
                    round: true,
                    type: TypeEnum.warning,
                    child: Text('Tag4'),
                  ),
                  Tag(
                    effect: EffectEnum.plain,
                    round: true,
                    type: TypeEnum.danger,
                    child: Text('Tag5'),
                  ),
                ]),
                h2('6.可选中的标签'),
                row([
                  const Tag(
                    checked: true,
                    child: Text('checked is true'),
                  ),
                  const Tag(
                    checked: false,
                    child: Text('checked is false'),
                  ),
                ]),
                const ToggleCheckedTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
