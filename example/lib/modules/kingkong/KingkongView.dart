import 'package:flutter/material.dart';
import 'package:flutter_parts/flutter_parts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KingkongView extends StatelessWidget {
  static const String url = '/king-kong';
  const KingkongView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Icons Card Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //
              FlexiCard(
                leading: const Text('我的'),
                actions: const [Text('前往')],
                items: [
                  FlexiCardIconItem(
                      icon: Icons.favorite, text: '喜欢', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.access_time, text: '最近', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.location_on, text: '本地', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.settings, text: '设置', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.access_time, text: '最近', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.location_on, text: '本地', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.favorite, text: '喜欢', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.settings, text: '设置', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.access_time, text: '最近', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.location_on, text: '本地', onTap: () {}),
                  FlexiCardIconItem(
                      icon: Icons.favorite, text: '喜欢', onTap: () {}),
                ],
              ),

              // --------------- 可滚动 ---------------
              const SizedBox(height: 20), // 添加一些间距
              // 指定宽度的用法
              Container(
                margin: const EdgeInsets.all(40),
                child: BorderBox(
                  // borderStyle: CustomBorderStyle.dashed,
                  borderWidth: 1.0,
                  borderRadiusSize: BorderRadiusSize.round,
                  boxShadowStyle: BoxShadowStyle.dark,
                  child: ScrollableFlexiCard(
                    leading: const Text('我的'),
                    actions: const [Text('前往')],
                    controller: controller,
                    items: [
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/地狗好屋.svg'),
                          text: const Text('地狗好屋'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/动物餐厅.svg'),
                          text: const Text('动物餐厅'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/飞鸟旅行.svg'),
                          text: const Text('飞鸟旅行'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/肥鱼.svg'),
                          text: const Text('肥鱼'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/分类.svg'),
                          text: const Text('分类'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/工厂购.svg'),
                          text: const Text('工厂购'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/购1001铺.svg'),
                          text: const Text('购1001铺'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/购票票.svg'),
                          text: const Text('购票票'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/购直播.svg'),
                          text: const Text('购直播'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/关注店铺.svg'),
                          text: const Text('关注店铺'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/活动日历.svg'),
                          text: const Text('活动日历'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/捡漏.svg'),
                          text: const Text('捡漏'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/减肥助手.svg'),
                          text: const Text('减肥助手'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/金币.svg'),
                          text: const Text('金币'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/聚补贴.svg'),
                          text: const Text('聚补贴'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/领券中心.svg'),
                          text: const Text('领券中心'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/全部频道.svg'),
                          text: const Text('全部频道'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/全球购.svg'),
                          text: const Text('全球购'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/小美庭院.svg'),
                          text: const Text('小美庭院'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/小时达.svg'),
                          text: const Text('小时达'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/摇现金.svg'),
                          text: const Text('摇现金'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/资质规则.svg'),
                          text: const Text('资质规则'),
                          onTap: () {}),
                      FlexiCardItem(
                          icon: SvgPicture.asset('assets/svgs/足迹.svg'),
                          text: const Text('足迹'),
                          onTap: () {}),
                    ],
                    itemsPerRow: 2,
                    bottoms: [
                      ScrollIndicator(controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
