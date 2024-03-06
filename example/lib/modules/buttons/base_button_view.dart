import 'package:flutter/material.dart';
import 'package:flutter_parts/flutter_parts.dart';
import '../../utils.dart';

class BaseButtonView extends StatelessWidget {
  static String url = '/base-button';
  const BaseButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h1('BaseButton 组件'),
                h2('1. 基础用法'),
                row([
                  BaseButton(
                    text: 'Primary',
                    type: TypeEnum.primary,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Success',
                    type: TypeEnum.success,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Info',
                    type: TypeEnum.info,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Warning',
                    type: TypeEnum.warning,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Danger',
                    type: TypeEnum.danger,
                    onPressed: () {},
                  ),
                ]),
                row([
                  BaseButton(
                    text: 'Primary',
                    effect: EffectEnum.dark,
                    type: TypeEnum.primary,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Success',
                    effect: EffectEnum.dark,
                    type: TypeEnum.success,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Info',
                    effect: EffectEnum.dark,
                    type: TypeEnum.info,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Warning',
                    effect: EffectEnum.dark,
                    type: TypeEnum.warning,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Danger',
                    effect: EffectEnum.dark,
                    type: TypeEnum.danger,
                    onPressed: () {},
                  ),
                ]),
                row([
                  BaseButton(
                    text: 'Primary',
                    type: TypeEnum.primary,
                    effect: EffectEnum.plain,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Success',
                    type: TypeEnum.success,
                    effect: EffectEnum.plain,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Info',
                    type: TypeEnum.info,
                    effect: EffectEnum.plain,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Warning',
                    type: TypeEnum.warning,
                    effect: EffectEnum.plain,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Danger',
                    type: TypeEnum.danger,
                    effect: EffectEnum.plain,
                    onPressed: () {},
                  ),
                ]),
                h2('2. 不同尺寸'),
                row([
                  BaseButton(
                    text: 'Large',
                    size: SizeEnum.large,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Default',
                    size: SizeEnum.defaultSize,
                    onPressed: () {},
                  ),
                  BaseButton(
                    text: 'Small',
                    size: SizeEnum.small,
                    onPressed: () {},
                  ),
                ]),
                h2('3. 朴素按钮'),
                row([
                  BaseButton(
                    text: 'Plain',
                    plain: true,
                    onPressed: () {},
                  ),
                ]),
                h2('4. 圆角按钮'),
                row([
                  BaseButton(
                    text: 'Round',
                    round: true,
                    onPressed: () {},
                  ),
                ]),
                h2('5. 圆形按钮'),
                row([
                  BaseButton(
                    text: 'Circle',
                    circle: true,
                    icon: Icons.check,
                    onPressed: () {},
                  ),
                ]),
                h2('6. 加载状态'),
                row([
                  BaseButton(
                    effect: EffectEnum.dark,
                    text: 'Loading',
                    loading: true,
                    onPressed: () {},
                  ),
                ]),
                h2('7. 自定义颜色'),
                row([
                  BaseButton(
                    text: 'Custom Color',
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                ]),
                h2('8. 带图标的按钮'),
                row([
                  BaseButton(
                    text: 'Icon',
                    icon: Icons.send,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
